package com.example.DurePRteam.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CommonCodeDetail extends Common {
	// 공통코드 디테일
    private String masterCode;
    private String detailCode;
    private String text;
    private String remark;
    private String activeYN;
    private String addUser;
    private Date addDate;
    private String modUser;
    private Date modDate;
}