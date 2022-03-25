package com.example.DurePRteam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JoinController {

    @RequestMapping("/join/join01")
    public String join01() throws Exception {

        return "join/join01";
    }

}