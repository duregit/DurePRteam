package com.example.DurePRteam.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.DurePRteam.dto.TestDTO;
import com.example.DurePRteam.service.DbService;

@Controller
public class TestController {

    @Autowired
    DbService dbService;

    @RequestMapping("/")
    public String main() {
        return "login";
    }


    @RequestMapping("/main")
    public ModelAndView dbTest() throws Exception {

        List<TestDTO> list = new ArrayList<TestDTO>();
        list = dbService.getList();



        return new ModelAndView("main", "list", list);
    }
}