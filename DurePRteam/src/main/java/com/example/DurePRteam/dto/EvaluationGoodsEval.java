package com.example.DurePRteam.dto;

import lombok.Data;

@Data
public class EvaluationGoodsEval {
	// 생활재평가
    int egeNo;
    int evalNo;
    String item;    
    String score;
    String text;
}