package com.hoon.app.inquiry.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hoon.app.inquiry.service.InquiryService;
import com.hoon.app.inquiry.vo.FaqVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("inquiry")
@Controller
public class InquiryController {

	private InquiryService is;
	@Autowired
	public InquiryController(InquiryService is) {
		this.is = is;
	}
	
	//CS 화면
	@GetMapping("customerService")
	public String customerService(Model model) {
		List<FaqVo> faqList = is.getFAQList();
		model.addAttribute("faqList", faqList); // 모델에 데이터 추가
		log.info("faqList : "+faqList);
		return "inquiry/customerService";
	}
	//문의 게시판
	@GetMapping("inquiryBoard")
	public String inquiryBoard() {
		return "inquiry/inquiryBoard";
	}
	
	
}
