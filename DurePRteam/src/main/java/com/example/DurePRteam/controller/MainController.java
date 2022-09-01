package com.example.DurePRteam.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.DurePRteam.dto.UserMain;
import com.example.DurePRteam.mapper.MainMapper;

@Controller
public class MainController {

	@Autowired MainMapper mainMapper;


	
    @RequestMapping("/main")
    public String main(HttpSession session , Model model) {
    	String login_id = (String) session.getAttribute("login_id");

    	UserMain usermain = mainMapper.findUser(login_id);
    	model.addAttribute("usermain", usermain);

    	System.out.println(usermain);

        return "main";
    }

}