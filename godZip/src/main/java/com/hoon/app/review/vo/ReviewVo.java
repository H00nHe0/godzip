package com.hoon.app.review.vo;

import lombok.Data;

@Data
public class ReviewVo {

	private int no;
	private int memberNo;
	private int categoryNo;
	private String prodName;
	private String title;
	private String content;
	private String score;
	private String isLike;
	private String isUnlike;
	private String postDate;
	private String shareCount;
	private String isUpdateYn;
	private String deleteYn;
}
