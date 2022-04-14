package com.example.DurePRteam.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
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
    public String userlist01(Criteria cri, Model model) throws Exception {

    	//페이징 시작
    	//전체 글 개수
    	int userlistTotalCount = userlistMapper.findAllCount();

    	//페이징 객체
		Paging paging = new Paging();
		paging.setCri(cri);
		paging.setTotalCount(userlistTotalCount);

		//리스트 조회쿼리
		List<UserList> userLists = userlistMapper.findAll(cri);
		model.addAttribute("userLists", userLists);
		System.out.println(userLists);
		System.out.println(model.addAttribute("userLists", userLists));
		//페이징 소스 끝

		model.addAttribute("paging", paging);
		model.addAttribute("criteria", cri);

		model.addAttribute("piProperty", commonPropMapper.findAllS()); // 단협


        return "userlist/userlist01";
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