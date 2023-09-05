package com.hoon.app.review.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hoon.app.common.page.vo.PageVo;
import com.hoon.app.member.vo.MemberVo;
import com.hoon.app.product.service.ProductService;
import com.hoon.app.product.vo.ProductVo;
import com.hoon.app.review.service.ReviewService;
import com.hoon.app.review.vo.CommentVo;
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
	
	@PostMapping("uploadSummernoteImage")
	@ResponseBody
	public Map<String, String> uploadSummerImg(@RequestParam MultipartFile file, HttpSession session) {
		Map<String, String> map = new HashMap<String, String>();
		String uploadFolder = "/resources/img/reviewImg/";
		String serverPath = session.getServletContext().getRealPath(uploadFolder);
		log.info("Uplodaed profile img :"+ file.getOriginalFilename());
		log.info("Uplodaed profile size :"+ file.getSize());
		String uploadedFileName = file.getOriginalFilename();
		uploadedFileName = uploadedFileName.substring(uploadedFileName.lastIndexOf("//")+1);
		log.info("only file name: "+uploadedFileName);
		//중복방지를 위한 UUID적용
		UUID uuid = UUID.randomUUID();
		uploadedFileName = uuid.toString()+"_"+uploadedFileName; // 저장 파일이름
		File targetFile = new File(serverPath,uploadedFileName);
		
		try {
			InputStream fileStream = file.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일저장
			map.put("url", "/app/resources/img/reviewImg/"+uploadedFileName);
			map.put("responseCode", "success");
		}catch (IOException e) {
			FileUtils.deleteQuietly(targetFile); //문제발생시 저장된 파일삭제
			map.put("responseCode", "error");
			e.printStackTrace();
		}
		return map;
	}
	
	@PutMapping("board/count/{no}")
	@ResponseBody
	public String growCnt(@PathVariable("no") int no) {

			int result = rs.growCnt(no);
			if(result != 1) {
			log.info("growing review count failed..");
			return "error";				
			}
			log.info("growing review count success!!");
			return "success";
		
	}
	
	@PostMapping("board/likeManage")
	@ResponseBody
	public ReviewVo likeManage(@RequestParam int no, HttpSession session) {
		MemberVo mvo = (MemberVo)session.getAttribute("mvo");
		int memberNo = mvo.getNo();
		int didLike =  rs.likeChk(no, memberNo);
		
		if(didLike == 1) {//좋아요 눌었으면 -> 좋아요 취소 작동
			int cancelLike = rs.cancelLike(no, memberNo);
			if(cancelLike != 1) {
				log.info("좋아요 취소중 에러 발생");
				return null;
			}else {
				rs.downLike(no);
				ReviewVo rvo = rs.getDetail(no);
				return rvo;
			}
		}else { //좋아요 안 눌렀으면
			int result = rs.likeManage(no,memberNo);
			
			
			if(result != 1) {//테이블에 안들어가면
				log.info("좋아요 테이블 insert 중에 에러발생");
				return null;
			}else {//review_like에 정보 insert완료 되면
				try {
					int addLike = rs.addLike(no);
					
					if(addLike != 1) {
						log.info("좋아요 증가 중에 에러발생");
						return null;
					}
					ReviewVo rvo = rs.getDetail(no);
					return rvo;
				} catch (Exception e) {
					e.printStackTrace();
					return null;
				}
			}
		}
		
	}
	
	@GetMapping("board/likeChk")
	@ResponseBody
	public String likeChk(@RequestParam int no, HttpSession session) {
		MemberVo mvo = (MemberVo)session.getAttribute("mvo");
		int memberNo = mvo.getNo();
		
		try {
			int didLike =  rs.likeChk(no, memberNo);
			if(didLike == 1) {
				System.out.println("좋아요 했음");
				//이미 좋아요 했음
				return "already";
			}else if(didLike == 0) {
				System.out.println("좋아요 안했음");
				//좋아요 안했음
				return "canLike";
			}else
				//카운트가 1혹은 0이 아님
			return "error";			
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}

	}
	
	@PostMapping("board/detail/{reviewNo}/comment")
	@ResponseBody
	public String insertComment(@PathVariable("reviewNo") int reviewNo,@RequestBody String content, HttpSession session) {
		MemberVo mvo = (MemberVo)session.getAttribute("mvo");
		int memberNo = mvo.getNo();
		int result = rs.insertComment(reviewNo,content, memberNo);
		
		if(result != 1) {
			log.info("댓글 db삽입중 문제");
			return "error";
		}else {
			log.info("댓글 db삽입성공!");
			List<CommentVo> cList = rs.getClist(reviewNo);
			return "success";
		}
	}
}
