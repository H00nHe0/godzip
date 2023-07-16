package com.hoon.app.member.vo;

import lombok.Data;

@Data
public class MemberVo {

	private String no;
	private String gradeNo;
	private String id;
	private String pwd;
	private String nick;
	private String enrollDate;
	private String quitYn;
	private String isBlockedYn;
	private String tel;
	private String lastVisit;
	private int totalVisit;
	private String loginType;
}
