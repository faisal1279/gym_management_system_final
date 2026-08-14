package com.brightnest.gymmanagementsystem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {

    @GetMapping("/403")
    public String accessDenied() {
        return "error/403";
    }

    @GetMapping("/404")
    public String pageNotFound() {
        return "error/404";
    }

    @GetMapping("/500")
    public String serverError() {
        return "error/500";
    }

}
