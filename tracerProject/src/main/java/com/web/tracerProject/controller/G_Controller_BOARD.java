package com.web.tracerProject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.tracerProject.service.G_Service_BOARD;
import com.web.tracerProject.vo.Board;

@Controller
public class G_Controller_BOARD {
     
	@Autowired(required=false)
    private G_Service_BOARD service;

	// http://localhost:5656/boardList
	// http://localhost:5656/boardList?title=first&bid=B001
	 @GetMapping("/boardList")
	    public String boardList(Board sch, Model d) {
	        List<Board> boardList = service.getBoardList(sch);
	        d.addAttribute("boardList", boardList);
	        return "tracerPages/board";
	    }

	    @RequestMapping("/boardListInsert")
	    public String boardInsert(Board ins, Model d) {
	        d.addAttribute("result", service.insertBoard(ins));
	        return "tracerPages/board"; // 등록 후 리다이렉트
	    }    

	    @RequestMapping("/boardUpdate")
	    public String boardUpdate(Board upt, Model d) {
	        d.addAttribute("msg", service.updateBoard(upt));
	        return "tracerPages/board"; // 수정 후 리다이렉트
	    }
	    
	    @RequestMapping("/boardDelete")
	    public String boardDelete(@RequestParam("bid") int bid, Model d) {
	    	d.addAttribute("msg", service.deleteBoard(bid));
	        d.addAttribute("proc", "삭제");
			return "tracerPages/board";
	    }
	
	}
