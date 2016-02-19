package com.chenlm.web.controller;

import com.chenlm.jpa.*;
import com.chenlm.jpa.model.*;
import com.chenlm.web.controller.model.RetBean;
import com.chenlm.web.controller.model.Searcher;
import com.chenlm.web.interceptor.Privilege;
import com.chenlm.web.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by chenlm on 15-11-25.
 */
@Controller
@RequestMapping("/admin")
public class AdminController extends BaseController {
    @Autowired
    private AdminService adminService;
    @Autowired
    private ICompanyDao iCompanyDao;
    @Autowired
    private IUserDao iUserDao;
    @Autowired
    private IRoleDao iRoleDao;
    @Resource
    private ICommentDao iCommentDao;
    @Resource
    private ITagDao iTagDao;

    @ModelAttribute
    public void admin(Model model, Integer page, Integer pagesize, String tab) {
        page = page == null || page < 0 ? 0 : page;
        pagesize = pagesize == null ? 10 : pagesize;

        PageRequest pager = new PageRequest(page, pagesize);
        PageRequest apager = new PageRequest(0, 10);

        Page<AUser> users = iUserDao.findAll(tab != null && "user".equals(tab) ? pager : apager);
        Page<Company> companies = iCompanyDao.findAll(tab != null && "comp".equals(tab) ? pager : apager);
        Page<Comment> comments = iCommentDao.findAll(tab != null && "comment".equals(tab) ? pager : apager);
        model.addAttribute("users", users);
        model.addAttribute("companies", companies);
        model.addAttribute("comments", comments);
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    @Privilege("admin")
    public String info(HttpServletRequest request, Model model) {
        AUser login = (AUser) request.getSession().getAttribute("login");
        return "admin/admin";
    }

    @RequestMapping(value = "", method = RequestMethod.POST)
    @Privilege("admin")
    public String save(HttpServletRequest request, Searcher searcher, String tab, Model model) {
        AUser login = (AUser) request.getSession().getAttribute("login");
        Map<String, String[]> parameterMap = request.getParameterMap();
        adminService.saveParams(parameterMap);
//        params(model);
        return "redirect:admin?tab=" + tab;
    }

    @RequestMapping(value = "/comment/delete", method = RequestMethod.POST)
    @Privilege("admin")
    @ResponseBody
    public String deleteComment(HttpServletRequest request, Long id, Model model) {
        AUser login = (AUser) request.getSession().getAttribute("login");
        if (id == null)
            return RetBean.error("2").toJson();
        iCommentDao.delete(id);
        return RetBean.success().toJson();
    }

    @RequestMapping(value = "/tag/add", method = RequestMethod.POST)
    @Privilege("admin")
    @ResponseBody
    public String addTag(HttpServletRequest request, Tag tag, Model model) {
        AUser login = (AUser) request.getSession().getAttribute("login");
        if (tag == null || tag.getName() == null || "".equals(tag.getName()))
            return RetBean.error("2").toJson();
        iTagDao.save(tag);
        return RetBean.success().toJson();
    }

    @RequestMapping(value = "/tag/delete", method = RequestMethod.POST)
    @Privilege("admin")
    @ResponseBody
    public String deleteTag(HttpServletRequest request, Tag tag, Model model) {
        AUser login = (AUser) request.getSession().getAttribute("login");
        if (tag == null || tag.getId() == null)
            return RetBean.error("2").toJson();
        Tag one = iTagDao.findOne(tag.getId());
        List<Tag> children = one.getChildren();
        if (children != null) {
            iTagDao.delete(children);
        }
        iTagDao.delete(tag);
        return RetBean.success().toJson();
    }

    @RequestMapping(value = "/user/forbid", method = RequestMethod.POST)
    @Privilege("admin")
    @ResponseBody
    public String setUserDisable(HttpServletRequest request, AUser user, Model model) {
        AUser login = (AUser) request.getSession().getAttribute("login");
        if (user == null || user.getId() == null)
            return RetBean.error("2").toJson();
        user = iUserDao.findOne(user.getId());
        user.setRole(iRoleDao.findRoleByName("disable"));
        iUserDao.save(user);
        return RetBean.success().toJson();
    }

    @RequestMapping(value = "/user/normal", method = RequestMethod.POST)
    @Privilege("admin")
    @ResponseBody
    public String setUserNormal(HttpServletRequest request, AUser user, Model model) {
        AUser login = (AUser) request.getSession().getAttribute("login");
        if (user == null || user.getId() == null)
            return RetBean.error("2").toJson();
        user = iUserDao.findOne(user.getId());
        user.setRole(iRoleDao.findRoleByName("normal"));
        iUserDao.save(user);
        return RetBean.success().toJson();
    }

    @RequestMapping(value = "/user/adv", method = RequestMethod.POST)
    @Privilege("admin")
    @ResponseBody
    public String setUserAdv(HttpServletRequest request, AUser user, Model model) {
        AUser login = (AUser) request.getSession().getAttribute("login");
        if (user == null || user.getId() == null)
            return RetBean.error("2").toJson();
        user = iUserDao.findOne(user.getId());
        user.setRole(iRoleDao.findRoleByName("adv"));
        iUserDao.save(user);
        return RetBean.success().toJson();
    }

    @RequestMapping(value = "/comp/delete", method = RequestMethod.POST)
    @Privilege("admin")
    @ResponseBody
    public String deleteComp(HttpServletRequest request, Company company, Model model) {
        AUser login = (AUser) request.getSession().getAttribute("login");
        if (company == null || company.getId() == null)
            return RetBean.error("2").toJson();
        company = iCompanyDao.findOne(company.getId());
        iCompanyDao.delete(company);
        return RetBean.success().toJson();
    }

    @RequestMapping(value = "/comp/edit", method = RequestMethod.POST)
    @Privilege("admin")
    public String editComp(HttpServletRequest request, Company company, Model model) {
        AUser login = (AUser) request.getSession().getAttribute("login");
        if (company == null || company.getId() == null)
            return RetBean.error("2").toJson();
        company = iCompanyDao.findOne(company.getId());
        model.addAttribute("company", company);
        return "company/add";
    }
}
