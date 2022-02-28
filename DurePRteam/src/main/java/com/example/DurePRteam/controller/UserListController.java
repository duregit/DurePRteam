package com.example.DurePRteam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.DurePRteam.service.DbService;

@Controller
public class UserListController {

    @Autowired
    DbService dbService;

    @RequestMapping("/userlist/userlist01")
    public String userlist01() throws Exception {

        return "userlist/userlist01";
    }

    @RequestMapping("/userlist/userlist02")
    public String userlist02() throws Exception {

        return "userlist/userlist02";
    }

}