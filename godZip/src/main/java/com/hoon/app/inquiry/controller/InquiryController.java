package com.hoon.app.inquiry.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hoon.app.inquiry.service.InquiryService;
import com.hoon.app.inquiry.vo.FaqVo;
import com.hoon.app.inquiry.vo.InquiryTypeVo;
import com.hoon.app.inquiry.vo.InquiryVo;

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
	public String inquiryBoard(Model model) {
		List<InquiryTypeVo> options =  is.selectType();
		model.addAttribute("options", options);
		log.info("options : "+options);
		return "inquiry/inquiryBoard";
	}
	//문의게시판 목록 불러오기
	@GetMapping("board")
	@ResponseBody
	public List<InquiryVo> getInquiryList(){
		List<InquiryVo> ivoList = is.getInquiryList();

		log.info("ivoList : "+ivoList);

		return ivoList;
	}
	
	//문의 게시판 작성하기 
	@PostMapping("newInquiry")
	@ResponseBody
	public String inquiryInsert(InquiryVo ivo) throws Exception {
		log.info("업데이트된 문의 ivo :"+ ivo );
		int result = is.inquiryInsert(ivo);
		if(result == 1) {
			log.info("insert inquiry to DB Done");
			return "success";
		}else {
			log.info("insert inquiry to DB fail..");
			return "error";
		}
	}
	
	//문의 게시판 내용 확인하기
	@GetMapping("board/{no}")
	@ResponseBody
	public InquiryVo inquiryContent(@PathVariable("no") int no) {
		InquiryVo ivo = is.inquiryContent(no);
		return ivo;
	}
	//게시판 클릭시 조회수 증가
	@ResponseBody
	@PutMapping("board/count/{no}")
	public InquiryVo growCnt(@PathVariable("no") int no) {
			is.growCnt(no); 
			InquiryVo ivo = is.inquiryContent(no);
			System.out.println(ivo);
			return ivo;
	}	
	//게시글 삭제하기
	@DeleteMapping("board/{no}")
	@ResponseBody
	public String inquiryDelete(@PathVariable("no") int no ) {
		int result = is.inquiryDelete(no);
		if(result == 1) {
			return "success";
		}else {
			return "error";
		}
	}
	//게시글 수정하기
	@PutMapping("board/edit")
	@ResponseBody
	public String boardEdit(@RequestBody InquiryVo ivo) {
		System.out.println(ivo);
		int result = is.boardEdit(ivo);
		
		if(result == 1) {
			return "success";
		}
		log.debug("수정 처리 완료");
		return "error";
	}
}
