package com.example.DurePRteam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("juso")
public class JusoController {

	@RequestMapping("/Sample")
	public String Sample() {
		return "juso/Sample";
	}

	@RequestMapping("/jusoPopup")
	public String jusoPopup() {
		return "juso/jusoPopup";
	}
}
