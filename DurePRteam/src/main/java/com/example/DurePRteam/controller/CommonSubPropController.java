package com.example.DurePRteam.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.DurePRteam.dto.CommonProp;
import com.example.DurePRteam.dto.CommonsSubProp;
import com.example.DurePRteam.dto.Join;
import com.example.DurePRteam.dto.UserMain;
import com.example.DurePRteam.mapper.CommonCodeMapper;
import com.example.DurePRteam.mapper.CommonPropMapper;
import com.example.DurePRteam.mapper.CommonSubPropMapper;

@Controller
@SessionAttributes("user")
@RequestMapping("admin")
public class CommonSubPropController {

    //@Autowired CommonCodeMapper commonCodeMapper;
    @Autowired CommonPropMapper commonPropMapper;
    @Autowired CommonSubPropMapper commonSubPropMapper;

	// 로그인 정보 없는 경우
	@ModelAttribute("user")
	public UserMain setUser() {
		//System.out.println("*********[매장코드] 로그인정보 없음*******");
		return new UserMain();
	}
	
    // [상세 공통코드] 등록페이지
    @GetMapping("commonSubProp/create")
    public String create(@ModelAttribute("user") UserMain user, HttpServletResponse response,Model model, @RequestParam("piProperty") String piProperty) throws IOException {
    	//CommonCode commonCode = commonCodeMapper.findOne(piProperty);
    	
    	// 로그인정보 체크
		if (user.getUserId() == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인정보가 없습니다. 로그인페이지로 이동합니다.'); location.href='/login'; </script>");
			out.flush();
			return null;
		}
		
		// 관리자 체크
		if (!user.getUserLevel().equals("A")) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('권한이 없습니다. 메인페이지로 이동합니다.'); location.href='/'; </script>");
			out.flush();
			return null;
		}
    			
    	CommonProp commonProp = commonPropMapper.findOne(piProperty);

    	model.addAttribute("commonProp", commonProp);
    	model.addAttribute("commonsSubProp", new CommonsSubProp());

        return "admin/commonSubProp/edit";
    }

    // [상세 공통코드] 등록
    @PostMapping("commonSubProp/create")
    public String create(@ModelAttribute("user") UserMain user, HttpServletResponse response,Model model, CommonsSubProp commonsSubProp) throws IOException {
    	
    	// 로그인정보 체크
		if (user.getUserId() == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인정보가 없습니다. 로그인페이지로 이동합니다.'); location.href='/login'; </script>");
			out.flush();
			return null;
		}
		
		// 관리자 체크
		if (!user.getUserLevel().equals("A")) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('권한이 없습니다. 메인페이지로 이동합니다.'); location.href='/'; </script>");
			out.flush();
			return null;
		}
		
    	commonSubPropMapper.insert(commonsSubProp, user);
    	System.out.println("생성");

        return "redirect:/admin/commonProp/list?piProperty=" + commonsSubProp.getPiProperty();
    }

    // [상세 공통코드] 수정페이지
    @GetMapping("commonSubProp/edit")
    public String edit(@ModelAttribute("user") UserMain user, HttpServletResponse response,Model model, String piProperty, String suPiproperty) throws IOException {
    	//CommonCode commonCode = commonCodeMapper.findOne(masterCode);
    	// 로그인정보 체크
		if (user.getUserId() == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인정보가 없습니다. 로그인페이지로 이동합니다.'); location.href='/login'; </script>");
			out.flush();
			return null;
		}
		
		// 관리자 체크
		if (!user.getUserLevel().equals("A")) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('권한이 없습니다. 메인페이지로 이동합니다.'); location.href='/'; </script>");
			out.flush();
			return null;
		}
		
    	CommonProp commonProp = commonPropMapper.findOne(piProperty);
    	//CommonCodeDetail commonCodeDetail = commonCodeDetailMapper.findOne(masterCode, detailCode);
    	CommonsSubProp commonsSubProp = commonSubPropMapper.findOne(piProperty, suPiproperty);

    	//model.addAttribute("commonCode", commonCode);
    	model.addAttribute("commonProp", commonProp);
        //model.addAttribute("commonCodeDetail", commonCodeDetail);
    	model.addAttribute("commonsSubProp", commonsSubProp);

        return "admin/commonSubProp/edit";
    }

    // [상세 공통코드] 수정
    @PostMapping("commonSubProp/edit")
    public String edit(@ModelAttribute("user") UserMain user, HttpServletResponse response,Model model, CommonsSubProp commonsSubProp) throws IOException {
    	
    	// 로그인정보 체크
		if (user.getUserId() == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인정보가 없습니다. 로그인페이지로 이동합니다.'); location.href='/login'; </script>");
			out.flush();
			return null;
		}
		
		// 관리자 체크
		if (!user.getUserLevel().equals("A")) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('권한이 없습니다. 메인페이지로 이동합니다.'); location.href='/'; </script>");
			out.flush();
			return null;
		}
    	commonSubPropMapper.update(commonsSubProp, user);

        return "redirect:/admin/commonSubProp/edit?piProperty=" + commonsSubProp.getPiProperty() + "&suPiproperty=" + commonsSubProp.getSuPiproperty();
    }
    
	// 단협 선택 후 매장리스트
	@RequestMapping("commonSubProp/subPropCode")
	@ResponseBody
    public List<CommonsSubProp> SubPropCode(@ModelAttribute("user") UserMain user, HttpServletResponse response, ModelMap model , @RequestBody CommonsSubProp commonsSubProp) throws Exception {		
		
		// 로그인정보 체크
		if (user.getUserId() == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인정보가 없습니다. 로그인페이지로 이동합니다.'); location.href='/login'; </script>");
			out.flush();
			return null;
		}
				
		List<CommonsSubProp> commonSubProps = commonSubPropMapper.findByPropCode(commonsSubProp.getPiProperty()); // 매장
		model.addAttribute("commonSubProps",commonSubProps);

		return commonSubProps;
    }
}