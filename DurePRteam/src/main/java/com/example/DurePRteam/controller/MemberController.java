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

import com.example.DurePRteam.dto.CommonsSubProp;
import com.example.DurePRteam.dto.GoodsEval;
import com.example.DurePRteam.dto.My;
import com.example.DurePRteam.dto.UserList;
import com.example.DurePRteam.dto.UserMain;
import com.example.DurePRteam.mapper.CommonPropMapper;
import com.example.DurePRteam.mapper.CommonSubPropMapper;
import com.example.DurePRteam.mapper.MemberMapper;
import com.example.DurePRteam.paging.Criteria;
import com.example.DurePRteam.paging.Paging;

@Controller
@SessionAttributes("user")
@RequestMapping("admin")
public class MemberController {

    @Autowired CommonPropMapper commonPropMapper;
    @Autowired CommonSubPropMapper commonSubPropMapper;
    @Autowired MemberMapper memberMapper;

    // 로그인 정보 없는 경우
 	@ModelAttribute("user")
 	public UserMain setUser() {
 		//System.out.println("*********[관리자페이지-사용자조회] 로그인정보 없음*******");
 		return new UserMain();
 	}
 	
 	// [관리자페이지-사용자관리] 리스트
 	@RequestMapping("member/list")
    public String list(@ModelAttribute("user") UserMain user, HttpServletResponse response, Criteria cri, Model model,
		@RequestParam(value="Apiproperty", required=false, defaultValue="0") String piproperty,
		@RequestParam(value="AsuPIProperty", required=false, defaultValue="0") String suPIProperty,
		@RequestParam(value="AuserId", required=false, defaultValue="") String userId,
		@RequestParam(value="AuserName", required=false, defaultValue="") String userName,
		@RequestParam(value="AuserActive", required=false, defaultValue="") String userActive) throws Exception {

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
    			
    	//페이징 시작
    	//전체 글 개수
    	int memberTotalCount = memberMapper.findAllCount(piproperty, suPIProperty, userId, userName, userActive);

    	//페이징 객체
		Paging paging = new Paging();
		cri.setCustomPerPageNum(20);	// 페이지 목록 개수
		paging.setCri(cri);
		paging.setTotalCount(memberTotalCount);

		//리스트 조회쿼리
		List<UserList> members = memberMapper.findAll(cri, piproperty, suPIProperty, userId, userName, userActive);		
		//페이징 소스 끝

		// 검색조건
		model.addAttribute("Apiproperty", piproperty);
		model.addAttribute("AsuPIProperty", suPIProperty);
		model.addAttribute("AuserId", userId);
		model.addAttribute("AuserName", userName);
		model.addAttribute("AuserActive", userActive);
		
		// selectbox
		model.addAttribute("selPIProperty", commonPropMapper.findAllS());					// 단협
		model.addAttribute("selSuPIProperty", commonSubPropMapper.findByPropCode(piproperty));	// 매장(사용자 단협정보)
				
		model.addAttribute("members", members);
		model.addAttribute("paging", paging);
		model.addAttribute("criteria", cri);
		
        return "admin/member/list";
    }
  	
 	// [관리자페이지-사용자관리] 수정페이지
 	@GetMapping("member/edit")
    public String edit(@ModelAttribute("user") UserMain user, HttpServletResponse response, Model model, @RequestParam("AuserId") String userId) throws Exception {

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
		
		My member = memberMapper.findOne(userId);	
		
		model.addAttribute("member", member);
		
        return "admin/member/edit";
    }
 	
 	//	[관리자페이지-사용자관리] 비밀번호 초기화
  	@PostMapping("member/pwReset")
  	@ResponseBody
     public void pwReset(HttpServletResponse response, @RequestBody UserList userlist) throws Exception {
 		
 		memberMapper.pwReset(userlist.getUserId());
     }
  	
 	// [관리자페이지-사용자관리] 가입승인
 	@PostMapping("member/confirm")
 	@ResponseBody
    public void confirm(HttpServletResponse response, Model model, @RequestBody UserList userlist) throws Exception {
		
		memberMapper.confirm(userlist.getUserId());
    }
 	
	// [관리자페이지-사용자관리] 탈퇴
 	@PostMapping("member/delete")
 	@ResponseBody
    public void delete(HttpServletResponse response, Model model, @RequestBody UserList userlist) throws Exception {
		
		memberMapper.delete(userlist.getUserId());
    }

	// [관리자페이지-사용자관리] 관리자권한 부여
 	@PostMapping("member/authority")
 	@ResponseBody
    public void authority(HttpServletResponse response, Model model, @RequestBody UserList userlist) throws Exception {
		
		memberMapper.authority(userlist.getUserId());
    }

	// 매장
	@RequestMapping("subPropCode")
	@ResponseBody
    public List<CommonsSubProp> SubPropCode(@ModelAttribute("user") UserMain user, HttpServletResponse response, ModelMap model, @RequestBody UserList userlist) throws Exception {
		
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
		
		String prop = userlist.getPiProperty();

		List<CommonsSubProp> commonSubProps = commonSubPropMapper.findByPropCode(prop); // 매장
		model.addAttribute("commonSubProps",commonSubProps);

		return commonSubProps;
    }

}