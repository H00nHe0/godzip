package com.hoon.app.product.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hoon.app.product.vo.ProductVo;

@Repository
public class ProductDao {

	public List<ProductVo> getCList(SqlSessionTemplate sst) {
		return sst.selectList("product.getCList");
	}

	public List<ProductVo> getSubList(SqlSessionTemplate sst) {
		return sst.selectList("product.getSubList");
	}

}
