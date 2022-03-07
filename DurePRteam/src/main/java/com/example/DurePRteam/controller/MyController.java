package com.example.DurePRteam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.DurePRteam.service.DbService;

@Controller
public class MyController {

    @Autowired
    DbService dbService;

    @RequestMapping("/my/my01")
    public String my01() throws Exception {

        return "my/my01";
    }

}