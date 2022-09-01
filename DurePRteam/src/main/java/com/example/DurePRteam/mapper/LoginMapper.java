package com.example.DurePRteam.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface LoginMapper {
	@Select("SELECT COUNT(*) FROM pr_usermaster "
			+ "WHERE UserID = #{UserId}")
	int checkId(String UserId);

	@Select("SELECT UserPW FROM pr_usermaster "
			+ "WHERE UserID = #{UserId} AND UserActive != 'X' ")
	String checkPw(String UserId);
}
