package com.example.DurePRteam.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.DurePRteam.dto.Join;

@Mapper
public interface JoinMapper {
	@Select("SELECT COUNT(*) FROM pr_usermaster "
			+ "WHERE UserID = #{UserId}")
	int findId(String UserId);

	// [공통코드] 생성 #{addUser}
    @Insert("INSERT pr_usermaster (UserID, UserPass, UserName, PIProperty, SuPIProperty, UserZip, UserAddr1, UserAddr2, UserCTel, UserACBank, UserACNum, UserActive, UserLevel, UserAddDate , UserAddUser)  "
    		+ "		     VALUES (#{userId}, #{userPW}, #{userName}, #{piProperty}, #{suPIProperty}, #{userZip}, #{userAddr1}, #{userAddr2}, #{userCtel}, #{bCode}, #{acNum}, 'N' , 'C' , SYSDATE() , #{userId} )")
    //@Options(useGeneratedKeys=true, keyProperty="id") 설명: id필드는 Auto Increment 속성
    void insert(Join join);
}
