package com.chenlm.web.controller;

import com.chenlm.jpa.model.*;
import com.chenlm.web.controller.model.CompanyAttachFiles;
import com.chenlm.web.interceptor.Privilege;
import com.chenlm.web.service.*;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by chenlm on 15-11-25.
 */
@Controller
@RequestMapping("/comp")
public class CompanyController extends BaseController {
    @Autowired
    private CompanyService companyService;
    @Autowired
    private UserService userService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private TagService tagService;

    @RequestMapping(value = "/info")
    public String info(Company company, Model model) {
        company = companyService.getCompany(company);
        if (company == null) {
            return "redirect:/";
        } else {
            model.addAttribute("company", company);
            return "company/company";
        }
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    @Privilege("adv")
    public String add(Model model) {
        return "company/add";
    }

    /**
     * 新增公司
     *
     * @param company
     * @param companyFiles
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @Privilege("adv")
    public String save(Company company, CompanyAttachFiles companyFiles,
                       HttpServletRequest request, Model model) throws IOException {
        AUser login = (AUser) request.getSession().getAttribute("login");
        company.setaUser(login);
        String uploadDir = request.getServletContext().getRealPath("/");
        // logofile
        List<Attachment> logoFile = companyService.saveCompanyLogo(companyFiles, uploadDir);
        if (logoFile == null) {
            model.addAttribute("error", "1");
            return "company/add";
        }
        company.setLogo(logoFile);

        // attachment
        Set<Attachment> attachments = companyService.saveCompanyFiles(companyFiles, uploadDir);
        if (attachments != null)
            company.setAttachments(attachments);
        companyService.saveCompany(company);
        model.addAttribute("success", true);
        return "company/add";
    }

    /**
     * 添加评论
     *
     * @return
     */
    @RequestMapping(value = "/comment", method = RequestMethod.POST)
    @Privilege("adv")
    @ResponseBody
    public String comment(HttpServletRequest request, Company company, String comment) {
        AUser login = (AUser) request.getSession().getAttribute("login");
        company = companyService.getCompany(company);
        if (companyService.saveComment(login, company, comment)) {
            return gson.toJson("0");
        } else {
            return gson.toJson("1");
        }
    }

    private Gson gson = new GsonBuilder().setPrettyPrinting().create();

    /**
     * 添加点评
     *
     * @return
     */
    @RequestMapping(value = "/vote", method = RequestMethod.POST)
    @Privilege("adv")
    @ResponseBody
    public String vote(HttpServletRequest request, Company company, String[] ids, String[] values) {
        AUser login = (AUser) request.getSession().getAttribute("login");
        company = companyService.getCompany(company);
        if (companyService.saveVotes(login, company, ids, values)) {
            return gson.toJson("0");
        } else {
            return gson.toJson("1");
        }
    }

    /**
     * 添加点评
     *
     * @return
     */
    @RequestMapping(value = "/updown", method = RequestMethod.POST)
    @Privilege("adv")
    @ResponseBody
    public String updown(HttpServletRequest request, Company company, Long commentid, boolean updown) {
        AUser login = (AUser) request.getSession().getAttribute("login");
        company = companyService.getCompany(company);
        Comment comment = commentService.getComment(commentid);
        if (companyService.saveVotes(login, company, comment, updown)) {
            return gson.toJson("0");
        } else {
            return gson.toJson("1");
        }
    }

    /**
     * 关注公司
     *
     * @return
     */
    @RequestMapping(value = "/focus", method = RequestMethod.POST)
    @Privilege("normal")
    @ResponseBody
    public String focus(HttpServletRequest request, Company company) {
        AUser login = (AUser) request.getSession().getAttribute("login");
        company = companyService.getCompany(company);
        if (userService.focusCompany(login, company)) {
            return gson.toJson("0");
        } else {
            return gson.toJson("1");
        }
    }

    @ExceptionHandler
    public void exception(HttpServletRequest request, HttpServletResponse response,
                          Exception e) throws IOException {
        e.printStackTrace();
        response.sendRedirect(request.getContextPath() + "/error/exception");
    }
}
