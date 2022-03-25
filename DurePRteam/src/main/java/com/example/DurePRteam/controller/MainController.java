package com.example.DurePRteam.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
    
    @RequestMapping("/login")
    public String login() {
        return "login";
    }
}