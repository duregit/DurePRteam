package com.example.DurePRteam.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.DurePRteam.dto.UserMain;

@Mapper
public interface MainMapper {

	// 전체 조회
	@Select("SELECT * "
			+ "FROM pr_usermaster "
			+ "WHERE UserID = #{login_id} ")
	UserMain findUser(String login_id);

}
