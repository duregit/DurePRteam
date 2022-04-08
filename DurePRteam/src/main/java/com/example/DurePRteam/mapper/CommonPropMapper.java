package com.example.DurePRteam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.DurePRteam.dto.CommonProp;
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

	// [공통코드] 수정 #{modUser}
	@Update("UPDATE pr_property SET          " +
            "  PIPropName = #{piPropname},         " +
            "  PIActive = #{piActive},       " +
            "  PIModUser = '장우진',                " +
            "  PIModDate = SYSDATE()              " +
            "WHERE PIProperty = #{piProperty}	")
    void update(CommonProp commonProp);

}