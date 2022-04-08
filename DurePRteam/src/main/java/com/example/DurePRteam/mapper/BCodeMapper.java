package com.example.DurePRteam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.DurePRteam.dto.BCode;

@Mapper
public interface BCodeMapper {

	// 전체조회
	@Select("SELECT * FROM pr_bank "
			+ "ORDER BY BCode" )
	List<BCode> findBCAll();

}
