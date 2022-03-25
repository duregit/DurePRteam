package com.example.DurePRteam.dto;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Planning {
	// 계획서
    int planNo;
    String prName;
    String piproperty;
    String suPIProperty;
    String pDate;
    String pDay;
    String gubun;
    String reason;
    String startTime;
    String endTime;
    String linkedGoods;
    String prMethod;
    String prTools;
    String prMessage;
    String etc;
    String addUser;
    Date addDate;
    String modUser;
    Date modDate;
    String state;
    String confirmUser;
    Date confirmDate;
    String comment;
    
    // 생활재정보
    List<PlanningGoodsInfo> goodsInfos;
}