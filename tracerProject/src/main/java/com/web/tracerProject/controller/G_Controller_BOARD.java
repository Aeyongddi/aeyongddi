package com.web.tracerProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.web.tracerProject.service.G_Service_BOARD;
import com.web.tracerProject.vo.Board;

@Controller
public class G_Controller_BOARD {
     
	@Autowired(required=false)
    private G_Service_BOARD service;

	// http://localhost:5656/boardList
	@GetMapping("/boardList")
	public String boardList(Board sch, Model d) {
		d.addAttribute("board", service.getBoardList(sch));
		return "board";
	}
}
