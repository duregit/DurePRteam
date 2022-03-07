package com.example.DurePRteam.dao;
 
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.example.DurePRteam.dto.Planning;

public interface PlanningMapper {
	
	@Select("SELECT * FROM pr_planning")
    List<Planning> findAll();

    @Select("SELECT * FROM pr_planning WHERE PlanNo = #{planNo}")
    Planning findOne(int planNo);

    @Insert("INSERT pr_planning (AddUser, PRName, PIProperty, SuPIProperty, PDate, PDay, Gubun, Reason)"
    		+ " VALUES (#{addUser}, #{prName}, #{piproperty}, #{suPIProperty}, #{pDate}, #{pDay}, #{gubun}, #{reason})")
    @Options(useGeneratedKeys=true, keyProperty="planNo")
    void insert(Planning planning);
	
    @Update("UPDATE pr_planning SET departmentName = #{departmentName} WHERE PlanNo = #{planNo}")
    void update(Planning planning);

    @Delete("DELETE FROM pr_planning WHERE PlanNo = #{planNo}")
    void delete(int planNo);

}
 
