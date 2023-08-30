package com.hoon.app.review.vo;

import lombok.Data;

@Data
public class ReviewVo {

	private int no;
	private int memberNo;
	private int categoryNo;
	private int subCaNo;
	private int shareCount;
	private int score;
	private int isLike;
	private int isUnlike;
	private int count;
	private String prodName;
	private String title;
	private String content;
	private String postDate;
	private String purchaseDate;
	private String isUpdateYn;
	private String deleteYn;
	private String attFile;
	
}
