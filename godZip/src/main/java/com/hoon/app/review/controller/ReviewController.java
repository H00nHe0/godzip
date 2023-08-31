package com.hoon.app.review.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hoon.app.common.page.vo.PageVo;
import com.hoon.app.member.vo.MemberVo;
import com.hoon.app.product.service.ProductService;
import com.hoon.app.product.vo.ProductVo;
import com.hoon.app.review.service.ReviewService;
import com.hoon.app.review.vo.ReviewVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("review")
public class ReviewController {
	
	private ReviewService rs;
	private ProductService ps;
	
	@Autowired
	public ReviewController(ReviewService rs, ProductService ps) {
		this.rs = rs;
		this.ps = ps;
	}
	
	@GetMapping("write")
	public String reviewWrite(HttpSession session, Model model) {
		MemberVo mvo = (MemberVo)session.getAttribute("mvo");
		List<ProductVo> cList = ps.getCList();
		model.addAttribute("cList", cList);
		model.addAttribute("mvo", mvo);
		return "review/write";
	}
	
	@PostMapping("submitReview")
	public String submitReview(ReviewVo rvo, RedirectAttributes rttr) {
		log.info("rvo :"+rvo);
		int result = rs.submitReview(rvo);
		System.out.println("rvo :"+rvo);
		if(result != 1) {
			return "common/error-page";		
		}

		return "redirect:/review/board/"+ rvo.getSubCaNo();
	}
	
	
	@GetMapping("subCategory")
	@ResponseBody
	public List<ProductVo> subDivision(int caNo) {
		System.out.println("caNo : " +caNo);
		List<ProductVo> sList = ps.getSList(caNo);
		System.out.println("sList : " +sList);
		return sList;
	}
	
	@GetMapping("board/{subCaNo}")
	public String ReviewBoard(@PathVariable int subCaNo,@RequestParam(defaultValue = "1") int page ,@RequestParam Map<String , String> searchMap, Model model) {
		//페이징
		int listCount = rs.getCnt(subCaNo, searchMap);
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 10;
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);		
		log.info("listCount:"+listCount);
		log.info("pv:"+pv);		
		model.addAttribute("searchMap" , searchMap);
		model.addAttribute("pv" , pv);
		model.addAttribute("subCaNo" , subCaNo);
		List<ReviewVo> rvoList = rs.getRvoList(subCaNo,pv,searchMap);	
		model.addAttribute("rvoList", rvoList);
		log.info("rvoList:"+ rvoList);				
		return "review/board";
	}
	
	@GetMapping("board/detail/{no}")
	public String ReviewDetail(@PathVariable int no, Model model) {
		
		ReviewVo rvo = rs.getDetail(no);
		log.info("detail rvo : "+rvo);
		model.addAttribute("rvo", rvo);
		
		return "review/board/detail";
	}

}
