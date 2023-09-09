package com.hoon.app;




import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hoon.app.common.page.vo.PageVo;
import com.hoon.app.review.service.ReviewService;
import com.hoon.app.review.vo.ReviewVo;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class HomeController {

	private ReviewService rs;
	
	@Autowired
	public HomeController(ReviewService rs) {
		this.rs = rs;
	}
	
	@RequestMapping("home")
	public String home(Model model) {

		List<ReviewVo> rvoList = rs.recentReview();
		model.addAttribute("rvoList", rvoList);
		return "home";
	}
	
	@GetMapping("home/search")
	public String homeSearch(@RequestParam(defaultValue = "1") int page ,@RequestParam String searchValue, Model model) {
		//페이징
		int listCount = rs.getTotalCnt(searchValue);
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 7;
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);		

		model.addAttribute("searchValue" , searchValue);
		model.addAttribute("pv" , pv);
		List<ReviewVo> rvoList = rs.searchList(pv, searchValue);
		log.info("rvoList : "+rvoList);
		model.addAttribute("rvoList", rvoList);
		return "review/board/searchBoard";
	}

}
