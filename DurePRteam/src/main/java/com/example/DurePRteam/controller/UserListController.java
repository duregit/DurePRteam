package com.example.DurePRteam.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.DurePRteam.dto.CommonsSubProp;
import com.example.DurePRteam.dto.UserList;
import com.example.DurePRteam.mapper.CommonPropMapper;
import com.example.DurePRteam.mapper.CommonSubPropMapper;
import com.example.DurePRteam.mapper.UserListMapper;
import com.example.DurePRteam.paging.Criteria;
import com.example.DurePRteam.paging.Paging;

@Controller
@RequestMapping("userlist")
public class UserListController {

    @Autowired CommonPropMapper commonPropMapper;
    @Autowired CommonSubPropMapper commonSubPropMapper;
    @Autowired UserListMapper userlistMapper;

    @RequestMapping("userlist01")
    public String userlist01(HttpSession session , Criteria cri, Model model , HttpServletResponse response) throws Exception {
    	String login_id = (String) session.getAttribute("login_id");
    	String userLevel = 	userlistMapper.findLevel(login_id);
    	System.out.println(userLevel);

    	if (userLevel.equals("A")) {
	    	//페이징 시작
	    	//전체 글 개수
	    	int userlistTotalCount = userlistMapper.findAllCount();

	    	//페이징 객체
			Paging paging = new Paging();
			paging.setCri(cri);
			paging.setTotalCount(userlistTotalCount);

			//리스트 조회쿼리
			model.addAttribute("userList", new UserList());
			//System.out.println(model.addAttribute("userList", new UserList()));

			List<UserList> userLists = userlistMapper.findAll(cri);
			model.addAttribute("userLists", userLists);
			System.out.println(userLists);

			//페이징 소스 끝

			model.addAttribute("paging", paging);
			model.addAttribute("criteria", cri);

			model.addAttribute("piProperty", commonPropMapper.findAllS()); // 단협



	        return "userlist/userlist01";
    	} else {
    		response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('올바르지 않은 접속입니다.'); history.back(); </script>");
			out.flush();

			return null;
    	}
    }

    @PostMapping("userlist01")
    public String search(Model model) {
    	System.out.println("post");

		//리스트 조회쿼리
		model.addAttribute("userList", new UserList());

    	return null;
    }


    @RequestMapping("userlist02")
    public String userlist02() throws Exception {

        return "userlist/userlist02";
    }


	// 매장
	@RequestMapping("subPropCode")
	@ResponseBody
    public List<CommonsSubProp> SubPropCode( ModelMap model , HttpServletResponse response, @RequestBody UserList userlist) throws Exception {
		String prop = userlist.getPiProperty();

		List<CommonsSubProp> commonSubProps = commonSubPropMapper.findByPropCode(prop); // 매장
		model.addAttribute("commonSubProps",commonSubProps);

		return commonSubProps;
    }

}