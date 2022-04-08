package com.example.DurePRteam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

    @RequestMapping("/")
    public String preview() {
        return "preview";
    }

    @RequestMapping("/main")
    public String main() {
        return "main";
    }

}