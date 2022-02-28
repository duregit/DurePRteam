package com.example.DurePRteam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.DurePRteam.service.DbService;

@Controller
public class JoinController {

    @Autowired
    DbService dbService;

    @RequestMapping("/join/join01")
    public String join01() throws Exception {

        return "join/join01";
    }

}