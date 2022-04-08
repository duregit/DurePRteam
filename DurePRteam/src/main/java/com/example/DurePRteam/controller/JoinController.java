package com.example.DurePRteam.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.DurePRteam.dto.CommonsSubProp;
import com.example.DurePRteam.dto.Join;
import com.example.DurePRteam.mapper.BCodeMapper;
import com.example.DurePRteam.mapper.CommonPropMapper;
import com.example.DurePRteam.mapper.CommonSubPropMapper;
import com.example.DurePRteam.mapper.JoinMapper;

@Controller
@RequestMapping("join")
public class JoinController {

	 @Autowired JoinMapper joinMapper;
     @Autowired CommonPropMapper commonPropMapper;
     @Autowired CommonSubPropMapper commonSubPropMapper;
     @Autowired BCodeMapper bcodeMapper;


	@RequestMapping("join01")
    public String join01(Model model) throws Exception {
		model.addAttribute("join", new Join());
		model.addAttribute("piProperty", commonPropMapper.findAllS()); // 단협

		//model.addAttribute("bCode", new BCode());
		model.addAttribute("bCode", bcodeMapper.findBCAll()); // 은행

		return "join/join01";
    }

	@PostMapping("join01")
	public String create(Model model , Join join) {
		System.out.println("joincreate");
		joinMapper.insert(join);

		return "redirect:/login";
	}


	// 아이디 중복 확인
	@RequestMapping("joinCheckId")
	@ResponseBody
    public String joinCheckId( HttpServletResponse response, @RequestBody Join jn ) throws Exception {

		int idChkCount = joinMapper.findId(jn.getUserId());

		String count = Integer.toString(idChkCount);

		//System.out.println(count);

		return count;
		//return null;
    }


	// 매장
	@RequestMapping("subPropCode")
	@ResponseBody
    public List<CommonsSubProp> SubPropCode( ModelMap model , HttpServletResponse response, @RequestBody Join jn) throws Exception {
		String prop = jn.getPiProperty();

		List<CommonsSubProp> commonSubProps = commonSubPropMapper.findByPropCode(prop); // 매장
		model.addAttribute("commonSubProps",commonSubProps);

		return commonSubProps;
    }

}