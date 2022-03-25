package com.example.DurePRteam.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CommonCodeDetail {
	// 공통코드 디테일
    String masterCode;
    String detailCode;
    String text;
    String remark;
    String activeYN;
    String addUser;
    Date addDate;
    String modUser;
    Date modDate;
}