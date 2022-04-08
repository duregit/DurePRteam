package com.example.DurePRteam.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Evaluation {
	// 평가서
	int evalNo;
	int planNo;
	String prName;
	String piproperty;	
	String pipropName;
	String suPIProperty;
	String suPIPropName;
	String prDate;
	String prDay;
	String gubun;	
	String reason;
	String weather;
	String temperatures;
	int orderCnt;
	int salesCnt;
	String startTime;
	String endTime;
	String linkedGoods;
	String prMethod;
	String prTools;
	String prMessage;
	String etc;
	String goodsEvalGubun;
	int TotalScore;
	Double totalAVG;
	String totalText;
	String addUser;
	Date addDate;
	String modUser;
	Date modDate;
	String state;
	String confirmUser;
	Date confirmDate;
	String comment;
	
	String gmDesc;
}