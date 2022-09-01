package com.example.DurePRteam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.DurePRteam.dto.GoodsEval;
import com.example.DurePRteam.dto.My;
import com.example.DurePRteam.dto.UserList;
import com.example.DurePRteam.dto.UserMain;
import com.example.DurePRteam.paging.Criteria;

@Mapper
public interface MemberMapper {

	// [사용자관리] 전체 조회	
	@Select({"<script>",
		"SELECT A.PIProperty, B.PIPropName, A.SUPIProperty, C.SuPIPropName, A.UserLevel, A.UserID, A.UserName, A.UserActive ",
		"	FROM pr_usermaster A ",
		" 	JOIN pr_property B ON A.PIProperty = B.PIProperty ",
		"	JOIN pr_subproperty C ON A.PIProperty = C.PIProperty AND A.SuPIProperty = C.SuPIProperty ",     
		"	WHERE UserLevel = 'C' ",
		"   <if test='piproperty != \"0\"'> AND A.PIProperty = #{piproperty} </if>",
		"   <if test='suPIProperty != \"0\"'> AND A.SUPIProperty = #{suPIProperty} </if>",
		"   <if test='userId != \"\"'> AND A.UserID LIKE CONCAT('%',#{userId},'%') </if>",
		"   <if test='userName != \"\"'> AND A.UserName LIKE CONCAT('%',#{userName},'%') </if>",
		"   <if test='userActive != \"\"'> AND A.UserActive = #{userActive} </if>",
		"ORDER BY UserAddDate DESC ",
		"LIMIT #{cri.pageStart}, #{cri.perPageNum} ",
		"</script>"})
	List<UserList> findAll(Criteria cri, String piproperty, String suPIProperty, String userId, String userName, String userActive);

	// [사용자관리] 전체 조회 count
	@Select({"<script>",
		"SELECT COUNT(*) FROM pr_usermaster ",
		"WHERE UserLevel = 'C' ",
		"   <if test='piproperty != \"0\"'> AND PIProperty = #{piproperty} </if>",
		"   <if test='suPIProperty != \"0\"'> AND SuPIProperty = #{suPIProperty} </if>",
		"   <if test='userId != \"\"'> AND UserId = #{userId} </if>",
		"   <if test='userName != \"\"'> AND UserName = #{userName} </if>",
		"   <if test='userActive != \"\"'> AND UserActive = #{userActive} </if>",
		"</script>"})
	int findAllCount(String piproperty, String suPIProperty, String userId, String userName, String userActive);

	// [사용자관리] 하나만 조회
	@Select("SELECT A.PIProperty, B.PIPropName, A.SUPIProperty, C.SuPIPropName, "
			+ "A.UserLevel, A.UserID, A.UserName, A.UserCTel, A.UserZip, A.UserAddr1, A.UserAddr2, A.UserActive, "
			+ "D.BName, A.UserACNum "
			+ "FROM pr_usermaster A "
			+ "JOIN pr_property B ON A.PIProperty = B.PIProperty "
			+ "JOIN pr_subproperty C ON A.PIProperty = C.PIProperty AND A.SuPIProperty = C.SuPIProperty "
			+ "JOIN pr_bank D ON A.UserACBank = D.BCode "
			+ "WHERE UserId = #{userId} ")
	My findOne(String userId);
	
	// [사용자관리] 비밀번호 초기화
    @Update("UPDATE pr_usermaster SET UserPW = '1234' WHERE UserID = #{userId}")  
    void pwReset(String userId);
    
	// [사용자관리] 승인
    @Update("UPDATE pr_usermaster SET UserActive = 'Y' WHERE UserID = #{userId}")    
    void confirm(String userId);
    
	// [사용자관리] 탈퇴
    @Update("UPDATE pr_usermaster SET UserActive = 'X' WHERE UserID = #{userId}")    
    void delete(String userId);
    
	// [사용자관리] 관리자권한 부여
    @Update("UPDATE pr_usermaster SET UserLevel = 'A' WHERE UserID = #{userId}")    
    void authority(String userId);
}
