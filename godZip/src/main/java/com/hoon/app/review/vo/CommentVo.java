package com.hoon.app.review.vo;

import lombok.Data;

@Data
public class CommentVo {

	private int no;
	private int reviewNo;
	private int memberNo;
	private String postDate;
	private String isUpdateYn;
}
