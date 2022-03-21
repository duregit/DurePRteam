package com.example.DurePRteam.dao;
 
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.example.DurePRteam.dto.CommonCode;
import com.example.DurePRteam.dto.CommonCodeDetail;

public interface CommonCodeDetailMapper {
	
	// [상세 공통코드] 전체조회
	@Select("SELECT * FROM pr_code_detail")
    List<CommonCodeDetail> findAll();
	
//	// [상세 공통코드] 공통코드에 해당되는 전체조회
//	@Select("SELECT * FROM pr_code_detail WHERE MasterCode = #{masterCode} "
//			+ "LIMIT #{paginationInfo.firstRecordIndex}, #{recordsPerPage} ")
//    List<CommonCodeDetail> findByMasterCode(CommonCodeDetail pCommonCodeDetail, String masterCode);
	
	// [상세 공통코드] 공통코드에 해당되는 전체조회
	@Select("SELECT * FROM pr_code_detail WHERE MasterCode = #{masterCode}")
    List<CommonCodeDetail> findByMasterCode(String masterCode);
	
	// [상세 공통코드] 공통코드에 해당되는 전체조회 count
	@Select("SELECT COUNT(*) FROM pr_code_detail WHERE MasterCode = #{masterCode}")
    int findAllCount(CommonCodeDetail pCommonCodeDetail, String masterCode);
	
	// [상세 공통코드] 하나만조회
	@Select("SELECT * FROM pr_code_detail WHERE MasterCode = #{masterCode} AND DetailCode = #{detailCode}")
    CommonCodeDetail findOne(@Param("masterCode") String masterCode, @Param("detailCode") String detailCode);
	
	// [상세 공통코드] 생성
    @Insert("INSERT pr_code_detail (MasterCode, DetailCode, Text, ActiveYN, Remark, AddUser, AddDate) "
    		+ "VALUES (#{masterCode}, #{detailCode}, #{text}, #{activeYN}, #{remark}, '장우진', SYSDATE() )")
    //@Options(useGeneratedKeys=true, keyProperty="id") 설명: id필드는 Auto Increment 속성
    void insert(CommonCodeDetail commonCodeDetail);
	
	// [공통코드] 수정
	@Update("UPDATE pr_code_detail SET          " +
            "	Text = #{text}, 			    " +
            "	ActiveYN = #{activeYN},         " +
            "	Remark = #{remark},   	        " +
            "	ModUser = '장우진',               " +
            "	ModDate = SYSDATE()             " +
            "WHERE MasterCode = #{masterCode}	" +
            "	AND DetailCode = #{detailCode}  ")
    void update(CommonCodeDetail commonCodeDetail);

}