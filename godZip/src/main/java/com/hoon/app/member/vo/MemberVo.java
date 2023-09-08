package com.hoon.app.member.vo;

import lombok.Data;

@Data
public class MemberVo {

	private int no;
	private String gradeNo;
	private String id;
	private String pwd;
	private String nick;
	private String enrollDate;
	private String quitYn;
	private String isBlockedYn;
	private String email;
	private String lastVisit;
	private int visitedDays;
	private String loginType;
	private String profile;
	private String formatedToday;
	private String reviewCount;
	private String totalLikes;
	
}
