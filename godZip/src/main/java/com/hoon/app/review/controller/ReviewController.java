package com.hoon.app.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hoon.app.review.service.ReviewService;

@Controller
@RequestMapping("review")
public class ReviewController {
	
	private ReviewService rs;
	
	@Autowired
	public ReviewController(ReviewService rs) {
		this.rs = rs;
	}
	
	@GetMapping("write")
	public String reviewWrite() {
		
		return "review/write";
	}

}
