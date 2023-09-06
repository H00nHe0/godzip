package com.hoon.app;




import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hoon.app.review.service.ReviewService;
import com.hoon.app.review.vo.ReviewVo;



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
	
}
