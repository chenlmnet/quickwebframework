package com.chenlm.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by chenlm on 15-11-25.
 */
@Controller
public class ErrorController extends BaseController {

    @RequestMapping(value = "/error/{code}", method = RequestMethod.GET)
    public String error(@PathVariable("code") String error, Model model) {
        model.addAttribute("code", error);
        return "error";
    }

}
