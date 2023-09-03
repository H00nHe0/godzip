package com.hoon.app.review.vo;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class LikeManageVo {

	private int likeno;
	private int memberNo;
	private int reviewNo;
	private String likeStatus;
	private String clickTime;
	
}
