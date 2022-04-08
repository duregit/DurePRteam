package com.example.DurePRteam.dto;

import java.util.Date;

import lombok.Data;

@Data
public class GoodsEval {
	// 생활재평가 구분별 항목
	int cgeNo;
    String gubunMCode;	// 구분_공통코드
    String gubunDCode;	// 구분_상세공통코드
    String gubunDText;	// 구분_상세공통코드명
    String itemMCode;	// 항목_공통코드
    String itemDCode;	// 항목_상세공통코드
    String itemDText;	// 항목_상세공통코드명
    String addUser;
    Date addDate;
    String modUser;
    Date modDate;
}