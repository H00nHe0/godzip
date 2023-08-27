package com.hoon.app;


import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hoon.app.product.service.ProductService;
import com.hoon.app.product.vo.ProductVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	
	private ProductService ps;
	public HomeController(ProductService ps) {
		this.ps = ps;
	}
	
	@RequestMapping("home")
	public String home(Model model) {
		List<ProductVo> cList = ps.getCList();
		log.info("cList :"+cList);
		model.addAttribute("cList", cList);
		return "home";
	}
	
}
