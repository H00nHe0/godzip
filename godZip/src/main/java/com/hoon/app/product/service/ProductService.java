package com.hoon.app.product.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.hoon.app.product.dao.ProductDao;
import com.hoon.app.product.vo.ProductVo;

@Service
public class ProductService {

	private final ProductDao pDao;
	private final SqlSessionTemplate sst;
	public ProductService(ProductDao pDao,SqlSessionTemplate sst) {
		this.pDao = pDao;
		this.sst = sst;
	}
	public List<ProductVo> getCList() {
		return pDao.getCList(sst);
	}
	public List<ProductVo> getSubList() {
		return pDao.getSubList(sst);
	}
	
	
}
