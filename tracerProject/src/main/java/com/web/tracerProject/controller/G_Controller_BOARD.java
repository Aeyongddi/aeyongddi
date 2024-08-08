package com.web.tracerProject.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.tracerProject.service.G_Service_BOARD;
import com.web.tracerProject.vo.Board;

@Controller
public class G_Controller_BOARD {
     
    @Autowired(required=false)
    private G_Service_BOARD service;
     
 // http://localhost:5656/riskBoard
    @GetMapping("riskBoard")
    public String riskBoard(Board sch, Model d) {
        List<Board> boardList = service.getBoardList(sch);
         d.addAttribute("boardList", boardList);
       return "tracerPages/riskBoard";
    }

    @PostMapping("/boardListInsert")
    @ResponseBody
    public String boardInsert(@RequestBody Board ins) {
        if (ins.getUpt_date() == null) {
            ins.setUpt_date(new Date()); // 현재 날짜로 기본값 설정
        }
        return service.insertBoard(ins) > 0 ? "등록성공" : "등록실패";
    }



    @PostMapping("/boardUpdate")
    public String boardUpdate(Board upt, Model d) {
        d.addAttribute("msg", service.updateBoard(upt));
        return "tracerPages/riskBoard"; // 수정 후 리다이렉트
    }

//    @PostMapping("/boardDelete")
//    public String boardDelete(@RequestBody Map<String, List<String>> payload, Model model) {
//        List<String> bids = payload.get("bids");
//        if (bids == null || bids.isEmpty()) {
//            model.addAttribute("msg", "삭제할 항목이 없습니다.");
//            model.addAttribute("proc", "삭제 실패");
//            return "tracerPages/riskBoard";
//        }

        int result = service.deleteBoards(bids);
        model.addAttribute("msg", result > 0 ? "삭제 성공" : "삭제 실패");
        model.addAttribute("proc", "삭제");
        return "tracerPages/riskBoard";
    }
    
    @PostMapping("/updateBoardStatus")
    public ResponseEntity<String> updateBoardStatus(@RequestBody Map<String, Object> payload) {
        String bid = (String) payload.get("bid");
        boolean endYN = (Boolean) payload.get("endYN");
        
        int result = service.updateBoardStatus(bid, endYN);
        
        if (result > 0) {
            return ResponseEntity.ok("Status updated successfully");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to update status");
        }
    }
       
    
}
    
