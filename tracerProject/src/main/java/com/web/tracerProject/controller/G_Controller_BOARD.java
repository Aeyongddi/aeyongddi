package com.web.tracerProject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.web.tracerProject.service.G_Service_BOARD;
import com.web.tracerProject.vo.Board;

@Controller
public class G_Controller_BOARD {
     
    @Autowired(required=false)
    private G_Service_BOARD service;

    // http://localhost:5656/boardList
    @GetMapping("/boardList")
    public String boardList(Board sch, Model d) {
        List<Board> boardList = service.getBoardList(sch);
        d.addAttribute("boardList", boardList);
        return "tracerPages/board";
    }

    @PostMapping("/boardListInsert")
    public String boardInsert(@RequestBody Board ins, Model d) {
        // 세션에서 이메일 가져오기 예시
        String email = "fixed_email@example.com"; // 실제로는 세션에서 가져와야 함
        ins.setEmail(email);
        d.addAttribute("result", service.insertBoard(ins));
        return "redirect:/board"; // 등록 후 리다이렉트
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