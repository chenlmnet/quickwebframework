package com.chenlm.web.controller;

import com.chenlm.jpa.model.Param;
import com.chenlm.jpa.model.Tag;
import com.chenlm.web.service.AdminService;
import com.chenlm.web.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by chenlm on 16-1-23.
 */
public class BaseController {
    @Autowired
    private AdminService adminService;
    @Autowired
    private TagService tagService;

    @ModelAttribute
    public void params(Model model) {
        List<Param> params = adminService.findAllParams();
        Map<String, String> paramMap = new HashMap<>();
        for (Param param : params) {
            paramMap.put(param.getPid() + "." + param.getName(), param.getValue());
        }
        model.addAttribute("params", params);
        model.addAttribute("pmap", paramMap);

        List<Tag> bussinessTag = tagService.getBussinessTag(); // 行业标签
        model.addAttribute("busi", bussinessTag);
        List<Tag> qualityTag = tagService.getQualityTag(); // 质量证书标签
        model.addAttribute("quality", qualityTag);

        model.addAttribute("votes", tagService.getVotes()); // 总体评价
        model.addAttribute("pro", tagService.getPro()); // 专业能力
    }
}
