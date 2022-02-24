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
public class EvaluationController {

    @Autowired
    DbService dbService;
    
    @RequestMapping("/evaluation/evalList")
    public String evalList() throws Exception {

        return "evaluation/evalList";
    }   
    
    @RequestMapping("/evaluation/eval01")
    public String eval01() throws Exception {

        return "evaluation/eval01";
    }    
    
    @RequestMapping("/evaluation/eval02")
    public String eval02() throws Exception {

        return "evaluation/eval02";
    }    
    
    @RequestMapping("/evaluation/eval03")
    public String eval03() throws Exception {

        return "evaluation/eval03";
    }    
    
    @RequestMapping("/evaluation/eval04")
    public String eval04() throws Exception {

        return "evaluation/eval04";
    }    
    
    @RequestMapping("/evaluation/eval05")
    public String eval05() throws Exception {

        return "evaluation/eval05";
    }    
}