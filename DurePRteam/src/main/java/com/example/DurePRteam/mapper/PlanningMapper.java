package com.example.DurePRteam.mapper;
 
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.mybatis.spring.annotation.MapperScan;

import com.example.DurePRteam.dto.Planning;

@MapperScan
public interface PlanningMapper {
	
	// 전체조회
	@Select("SELECT * FROM pr_planning")
    List<Planning> findAll();

	// 특정조회
    @Select("SELECT * FROM pr_planning WHERE PlanNo = #{planNo}")
    Planning findOne(int planNo);

    // 계획서 신규 생성
    @Insert("INSERT pr_planning (AddUser, PRName, PIProperty, SuPIProperty, PDate, PDay, Gubun, Reason)"
    		+ " VALUES (#{addUser}, #{prName}, #{piproperty}, #{suPIProperty}, #{pDate}, #{pDay}, #{gubun}, #{reason})")
    @Options(useGeneratedKeys=true, keyProperty="planNo")
    void insert(Planning planning);
	
    // [기본사항] 수정
    @Update("UPDATE pr_planning SET "
    		+ "PRName = #{prName}, "
    		+ "PIProperty = #{piproperty}, "
    		+ "SuPIProperty = #{suPIProperty}, "
    		+ "PDate = #{pDate}, "
    		+ "PDay = #{pDay}, "
    		+ "Gubun = #{gubun}, "
    		+ "Reason = #{reason} "
    		+ "WHERE PlanNo = #{planNo}")
    void update01(Planning planning);

//    @Delete("DELETE FROM pr_planning WHERE PlanNo = #{planNo}")
//    void delete(int planNo);

}