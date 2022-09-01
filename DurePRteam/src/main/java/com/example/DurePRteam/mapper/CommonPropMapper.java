package com.example.DurePRteam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.DurePRteam.dto.CommonProp;
import com.example.DurePRteam.dto.UserMain;
import com.example.DurePRteam.paging.Criteria;

@Mapper
public interface CommonPropMapper {

	// [공통코드] 전체조회
	@Select("SELECT * FROM pr_property ORDER BY PIProperty "
			+ "LIMIT #{pageStart}, #{perPageNum} ")
    List<CommonProp> findAll(Criteria cri);

	// [공통코드] 전체조회
	@Select("SELECT * FROM pr_property ORDER BY PIPROPERTY ")
    List<CommonProp> findAllS();

	// [공통코드] 전체조회 count
	@Select("SELECT COUNT(*) FROM pr_property")
    int findAllCount();

	// [공통코드] 하나만조회
	@Select("SELECT * FROM pr_property WHERE PIProperty = #{piProperty}")
	CommonProp findOne(String piProperty);

	// [공통코드] 수정
	@Update("UPDATE pr_property SET          " +
            "  PIPropName = #{commonProp.piPropname},         " +
            "  PIActive = #{commonProp.piActive},       " +
            "  PIModUser = #{user.userId},                " +
            "  PIModDate = SYSDATE()              " +
            "WHERE PIProperty = #{commonProp.piProperty}	")
    void update(@RequestParam("commonProp") CommonProp commonProp, UserMain user);

}