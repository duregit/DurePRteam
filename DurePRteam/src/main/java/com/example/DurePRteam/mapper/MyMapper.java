package com.example.DurePRteam.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.DurePRteam.dto.My;

@Mapper
public interface MyMapper {

	// 로그인 한 아이디에 대한 usermaster 정보 조회
	@Select("SELECT * "
			+ "FROM pr_usermaster A "
			+ "JOIN pr_property B ON A.PIProperty = B.PIProperty "
			+ "JOIN pr_subproperty C ON A.PIProperty = C.PIProperty AND A.SuPIProperty = C.SuPIProperty "
			+ "JOIN pr_bank D ON A.UserACBank = D.BCode "
			+ "WHERE A.UserId = #{login_id} " )
	My findUser(String login_id);

	//마이페이지 수정
//	@Update("UPDATE pr_usermaster "
//			+ "SET UserName = #{userName} ,"
//			+ "	   UserZip = #{userZip} ,"
//			+ "	   UserAddr1 = #{userAddr1} , "
//			+ "	   UserAddr2 = #{userAddr2} ,"
//			+ "    UserCTel = #{userCtel} , "
//			+ "	   UserACBank = #{bCode} ,"
//			+ "	   UserACNum = #{userACNum}"
//			+ "WHERE UserId = #{userId} ")
//	void update(My my);

	//비밀번호 변경
	@Update("UPDATE pr_usermaster "
			+ "SET UserPW = #{userPW} "
			+ "WHERE UserID = #{userId} " )
    void pwUpdate(My my);

	// 마이페이지 수정
    @Update("UPDATE pr_usermaster "
    		+ "SET UserName = #{userName}, "
    		+ "	   UserZip =  #{userZip}, "
    		+ "	   UserAddr1 = #{userAddr1}, "
    		+ "	   UserAddr2 = #{userAddr2},"
    		+ "	   UserCTel = #{userCtel},"
    		+ "	   UserACBank = #{bCode},"
    		+ "	   UserACNum = #{userACNum} "
    		+ "WHERE UserID = #{userId}  " )
    void update(My my);

}
