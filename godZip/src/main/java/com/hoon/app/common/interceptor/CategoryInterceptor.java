package com.hoon.app.common.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.hoon.app.product.service.ProductService;
import com.hoon.app.product.vo.ProductVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class CategoryInterceptor implements HandlerInterceptor{

	private ProductService ps;

    @Autowired
    public CategoryInterceptor(ProductService ps) {
        this.ps = ps;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response,
                           Object handler, ModelAndView modelAndView) throws Exception {
        if (modelAndView != null) {
            List<ProductVo> cList = ps.getCList();
            log.info("인터셉트 clist:"+cList);
            modelAndView.addObject("cList", cList);
        }
    }
}
