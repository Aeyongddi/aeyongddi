package com.web.tracerProject.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.tracerProject.service.G_Service_Notice;
import com.web.tracerProject.vo.Notice;
import com.web.tracerProject.vo.User_info;

import jakarta.servlet.http.HttpSession;

@Controller
public class G_Controller_Notice extends NContBase{
	@Autowired(required=false)
	private G_Service_Notice service;
	 
	// http://localhost:5656/Notice
	@GetMapping("Notice")
	public String Notice(Notice sch, Model d, HttpSession session) {
	    List<Notice> NoticeList = service.getNoticeList(sch);
	    d.addAttribute("NoticeList", NoticeList);
	    
	    // 세션에서 User_info 객체 가져오기
	    User_info user_info = (User_info) session.getAttribute("user_info");
	    if (user_info != null) {
	        d.addAttribute("user_info", user_info);
	    }
	    return "tracerPages/notice";
	}
	
	 // 공지사항 상세 페이지
	@GetMapping("/noticeDetail")
    public String getNoticeDetail(@RequestParam("vid") String vid, Model model) {
        // 공지사항 정보 조회
        Notice notice = service.getNoticeById(vid);
        // 모델에 공지사항 객체 추가
        model.addAttribute("notice", notice);
        // 뷰 이름 반환
        return "noticeDetail"; // JSP 파일 이름
    }
	 
	@PostMapping("/noticeListInsert")
	public ResponseEntity<String> noticeInsert(@RequestBody Notice ins, HttpSession session) {
	    try {
	        User_info user_info = (User_info) session.getAttribute("user_info");
	        if (user_info != null) {
	            ins.setEmail(user_info.getEmail());
	        }
	        
	        if (ins.getDate_of_registration() == null) {
	            ins.setDate_of_registration(new Date()); // 현재 날짜로 기본값 설정
	        }
	        
	        int result = service.insertNotice(ins);
	        if (result > 0) {
	            return ResponseEntity.ok("등록성공");
	        } else {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("등록실패");
	        }
	    } catch (Exception e) {
	        // 예외를 로그에 기록
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("등록 실패: " + e.getMessage());
	    }
	}
    
	@PostMapping("/delete")
	@ResponseBody
	public ResponseEntity<String> deleteNotice(@RequestParam("vid") String vid) {
	    try {
	        int result = service.deleteNotice(vid);
	        if (result > 0) {
	            return ResponseEntity.ok("삭제 성공");
	        } else {
	            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("삭제 실패: 게시물이 없습니다.");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("삭제 실패: " + e.getMessage());
	    }
	}
	
	 // 검색 요청 처리
	// 검색 요청 처리
    @RequestMapping("/searchNotices")
    public String searchNotices(@RequestParam("searchText") String searchText, @RequestParam("searchType") String searchType, Model model) {
        List<Notice> notices = service.searchNotices(searchText, searchType);
        model.addAttribute("NoticeList", notices);
        return "tracerPages/notice";
    }
}

