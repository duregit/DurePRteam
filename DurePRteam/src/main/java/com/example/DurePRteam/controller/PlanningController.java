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
public class PlanningController {

    @Autowired
    DbService dbService;
    
    @RequestMapping("/dashboard")
    public String dashboard() throws Exception {
        return "index";
    }    
    
    @RequestMapping("/planning/plan01")
    public String plan01() throws Exception {

        return "planning/plan01";
    }
    
    @RequestMapping("/planning/plan02")
    public String plan02() throws Exception {

        return "planning/plan02";
    }
    
}