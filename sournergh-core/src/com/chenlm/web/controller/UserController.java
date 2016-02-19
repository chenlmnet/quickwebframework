package com.chenlm.web.controller;

import com.chenlm.comm.SendMail;
import com.chenlm.jpa.model.AUser;
import com.chenlm.web.controller.model.RetBean;
import com.chenlm.web.interceptor.Privilege;
import com.chenlm.web.service.RoleService;
import com.chenlm.web.service.UserService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by chenlm on 15-11-25.
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;

    @RequestMapping(value = "/center", method = RequestMethod.GET)
    public String center(HttpServletRequest request, Model model) {
        String userid = request.getParameter("id");
        AUser login = (AUser) request.getSession().getAttribute("login");
        if (login != null
                && ((userid == null
                || (userid != null && login.getId() == Long.parseLong(userid))))) { // 用户中心
            login = userService.findUser(login);
            request.getSession().setAttribute("login", login);
            return "user/user";
        } else if (userid != null) { // 查看其他用户
            AUser user = userService.findUser(Long.parseLong(userid));
            if (user == null) {
                return "redirect:/error/useridnotexists";
            }
            model.addAttribute("user", user);
            return "user/user-pub";
        } else if (login == null) {
            return "redirect:/error/nologin";
        } else {
            return "redirect:/error/useridnotexists";
        }
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginForm() {
        return "user/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(HttpServletRequest request, AUser login, Model model) {
        String vcode = request.getParameter("vcode");
        if (vcode == null) {
            model.addAttribute("msg", "请输入验证码");
            return "user/login";
        }
        if (!vcode.equals(request.getSession().getAttribute("vcode"))) {
            model.addAttribute("msg", "验证码有误");
            return "user/login";
        }
        if (login.getUserName() == null || "".equals(login.getUserName())) {
            model.addAttribute("msg", "请输入用户名");
            return "user/login";
        }
        if (login.getPassWord() == null || "".equals(login.getPassWord())) {
            model.addAttribute("msg", "请输入密码");
            return "user/login";
        }
        AUser loginUser = userService.findUser(login);
        if (loginUser == null) {
            model.addAttribute("msg", "用户不存在");
        } else if (!loginUser.getPassWord().equals(login.getPassWord())) {
            model.addAttribute("msg", "用户名或密码错误");
        } else {
            request.getSession().setAttribute("login", loginUser);
            return "redirect:/user/center";
        }
        request.getSession().removeAttribute("login");
        return "user/login";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerForm() {
        return "user/register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(HttpServletRequest request, AUser AUser, Model model) {
        String vcode = request.getParameter("vcode");
        if (vcode == null) {
            model.addAttribute("msg", "请输入验证码");
            return "user/register";
        }
        if (!vcode.equals(request.getSession().getAttribute("vcode"))) {
            model.addAttribute("msg", "验证码有误");
            return "user/register";
        }
        String passWord2 = request.getParameter("passWord2");
        if (AUser == null) {
            model.addAttribute("msg", "注册失败");
        } else if (AUser.getUserName() == null) {
            model.addAttribute("msg", "请输入用户名");
        } else if (AUser.getPassWord() == null) {
            model.addAttribute("msg", "请输入密码");
        } else if (AUser.getEmail() == null) {
            model.addAttribute("msg", "请输入邮箱");
        } else if (!AUser.getPassWord().equals(passWord2)) {
            model.addAttribute("msg", "两次密码不一致");
        } else {
            AUser.reg();
            AUser.setRole(roleService.getRegisterRole());
            userService.saveUser(AUser);
            SendMail.sendRegMail(AUser.getEmail(), AUser.getRegCode());
            return "user/login";//login(request, user, model);
        }
        return "user/register";
    }

    @RequestMapping(value = "/invite", method = RequestMethod.GET)
    public String invite() {
        return "user/login";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request) {
        request.getSession().removeAttribute("login");
        return "redirect:/";
    }


    @RequestMapping(value = "/focus")
    @ResponseBody
    @Privilege("normal")
    public String focusUser(HttpServletRequest request, Long id, boolean focus, Model model) {
        AUser login = (AUser) request.getSession().getAttribute("login");
        AUser user = userService.findUser(id);
        if (user != null
                && (focus ? login.addFocusUser(user) : login.removeFocusUser(user))
                && userService.saveUser(login) != null) {
            return RetBean.success().toJson();
        } else {
            return RetBean.error().toJson();
        }
    }
}
