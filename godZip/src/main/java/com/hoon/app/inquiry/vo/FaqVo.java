package com.hoon.app.inquiry.vo;

import lombok.Data;

@Data
public class FaqVo {
	private int no;
	private String title;
	private String content;
	private int adminNo;
	private String deleteYn;
}
