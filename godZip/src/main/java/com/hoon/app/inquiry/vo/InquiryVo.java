package com.hoon.app.inquiry.vo;


import lombok.Data;

@Data
public class InquiryVo {

	private int no;
	private String title;
	private String content;
	private String answer;
	private int memberNo;
	private int adminNo;
	private String qDate;
	private String aDate;
	private String deleteYn;
	private String editDate;
}
