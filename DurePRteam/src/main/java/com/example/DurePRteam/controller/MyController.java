package com.example.DurePRteam.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.DurePRteam.dto.My;
import com.example.DurePRteam.mapper.BCodeMapper;
import com.example.DurePRteam.mapper.MyMapper;

@Controller
@RequestMapping("my")
public class MyController {

	@Autowired MyMapper myMapper;
    @Autowired BCodeMapper bcodeMapper;


    @RequestMapping("my01")
    //@ResponseBody
    public String my01(HttpSession session , Model model) throws Exception {
    	//System.out.println(session.getAttribute("login_id"));
    	String login_id = (String) session.getAttribute("login_id");

    	My my = myMapper.findUser(login_id);
    	System.out.println(myMapper.findUser(login_id));

    	model.addAttribute("my", my);

		model.addAttribute("bCode", bcodeMapper.findBCAll()); // 은행
    	//System.out.println(bcodeMapper.findBCAll());


        return "my/my01";
    }


    // 마이페이지 수정
	@PostMapping("my01")
	public String update(HttpSession session , Model model , My my) {
    	String login_id = (String) session.getAttribute("login_id");
		System.out.println(my.getUserPW());
		System.out.println(login_id);
		myMapper.update(my);

		return "redirect:/my/my01";
	}


	// 비밀번호 변경
	@RequestMapping("updatePW")
	@ResponseBody
    public String updatePW(HttpSession session , HttpServletResponse response, @RequestBody My my ) throws Exception {
    	String login_id = (String) session.getAttribute("login_id");
		System.out.println(my);
		System.out.println(my.getUserPW());
		//int idChkCount = myMapper.findId(jn.getUserId());
		myMapper.pwUpdate(my);

		//System.out.println(count);

		return null;

    }

}