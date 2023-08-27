package com.hoon.app.product.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hoon.app.product.service.ProductService;
import com.hoon.app.product.vo.ProductVo;

@Controller
@RequestMapping("product")
public class ProductController {
	
	private ProductService ps;
	public ProductController(ProductService ps) {
		this.ps = ps;
	}
	
	@GetMapping("subDivision")
	@ResponseBody
	public List<ProductVo> subDivision() {
		List<ProductVo> pList = ps.getSubList();
		return pList;
	}
		
	
	

}
