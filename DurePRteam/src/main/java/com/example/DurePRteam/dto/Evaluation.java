package com.example.DurePRteam.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Evaluation {
	// 평가서
	int evalNo;
	int planNo;
	
	// page1
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
	
	// page2
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
	
	// page3
	int totalScore;
	Double totalAVG;
	String totalText;
	
	// page4
	String p4Weather;
	String p4Setting;
	String p4Ment;
	String p4Support;
	String p4PRMethod;
	String p4GoodsSel;
	String p4Age;
	String p4Gender;
	String p4Response;
	String p4Time;
	int p4TotalScore;
	Double p4TotalAVG;
	
	// page5
	String salesTip;
	String guestOpinion;
	String requestList;
	String suggestion;
	
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