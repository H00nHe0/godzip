package com.hoon.app.inquiry.vo;


import lombok.Data;

@Data
public class InquiryVo {

	private int no;
	private int rno;
	private String title;
	private String content;
	private String answer;
	private int memberNo;
	private int adminNo;
	private int count;
	private String enrollDate;
	private String answerDate;
	private String deleteYn;
	private String editDate;
	private String nick;
	private String type;
	private String answeredYn;
}
