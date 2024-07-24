package com.web.tracerProject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
		return "board";
	}
	
	@PostMapping("/boardListInsert.do")
	public String boardInsert100(Board ins, Model d) {
		d.addAttribute("result", service.insertBoard(ins));
		return "board1";
	}
	
	
}
