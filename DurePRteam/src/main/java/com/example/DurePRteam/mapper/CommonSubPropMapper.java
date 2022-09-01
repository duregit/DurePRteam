package com.example.DurePRteam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.DurePRteam.dto.CommonsSubProp;
import com.example.DurePRteam.dto.UserMain;

@Mapper
public interface CommonSubPropMapper {

	// [상세 공통코드] 전체조회
	@Select("SELECT * FROM pr_subproperty")
    List<CommonsSubProp> findAll();

	// [상세 공통코드] 공통코드에 해당되는 전체조회
	@Select("SELECT * FROM pr_subproperty WHERE PIProperty = #{piProperty}")
    List<CommonsSubProp> findByPropCode(String piProperty);

	// [상세 공통코드] 공통코드에 해당되는 전체조회 count
	@Select("SELECT COUNT(*) FROM pr_subproperty WHERE PIProperty = #{piProperty}")
    int findAllCount(CommonsSubProp pCommonSubProp, String piProperty);

	// [상세 공통코드] 하나만조회
	@Select("SELECT * FROM pr_subproperty WHERE PIProperty = #{piProperty} AND SuPIProperty = #{suPiproperty}")
	CommonsSubProp findOne(@Param("piProperty") String piProperty, @Param("suPiproperty") String suPiproperty);

	// [상세 공통코드] 생성
    @Insert("INSERT pr_subproperty (PIProperty, SuPIProperty, SuPIPropName, SuPIActive, SuPIAddDate, SuPIAddUser ) "
    		+ "				VALUES (#{commonsSubProp.piProperty}, #{commonsSubProp.suPiproperty}, #{commonsSubProp.suPipropname}, #{commonsSubProp.supiActive}, SYSDATE(), #{user.userId} )")
    //@Options(useGeneratedKeys=true, keyProperty="id") 설명: id필드는 Auto Increment 속성
    void insert(@RequestParam("commonsSubProp") CommonsSubProp commonsSubProp, UserMain user);

	// [공통코드] 수정
	@Update("UPDATE pr_subproperty SET          " +
            "	SuPIActive = #{commonsSubProp.supiActive},     " +
            "	SuPIModUser = #{user.userId},               " +
            "	SuPIModDate = SYSDATE()             " +
            "WHERE PIProperty = #{commonsSubProp.piProperty}	" +
            "	AND SuPIProperty = #{commonsSubProp.suPiproperty}  ")
    void update(@RequestParam("commonsSubProp") CommonsSubProp commonsSubProp, UserMain user);

}