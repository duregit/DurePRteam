package com.example.DurePRteam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.DurePRteam.dto.UserList;
import com.example.DurePRteam.paging.Criteria;

@Mapper
public interface UserListMapper {

	// 전체조회
	@Select("SELECT A.PIProperty , B.PIPropName , A.SUPIProperty , C.SuPIPropName , A.UserID , A.UserName , A.UserActive "
			+ "FROM pr_usermaster A "
			+ "JOIN pr_property B ON A.PIProperty = B.PIProperty "
			+ "JOIN pr_subproperty C ON A.PIProperty = C.PIProperty AND A.SuPIProperty = C.SuPIProperty "
			+ "WHERE UserLevel = 'C' "
			+ "LIMIT #{pageStart}, #{perPageNum} ")
	List<UserList> findAll(Criteria cri);

	// 전체조회 count
	@Select("SELECT COUNT(*) FROM pr_usermaster")
	int findAllCount();

}
