package com.web.tracerProject.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    @ResponseBody
    public String boardInsert(@RequestBody Board ins, Model d) {
        // 세션에서 이메일 가져오기 예시
        String email = "fixed_email@example.com"; // 실제로는 세션에서 가져와야 함
        ins.setEmail(email);
        
        int result = service.insertBoard(ins); // 한 번만 호출
        d.addAttribute("result", result);
        
        return result > 0 ? "등록성공" : "등록실패";
    }


//    @RequestMapping("/boardUpdate")
//    public String boardUpdate(Board upt, Model d) {
//        d.addAttribute("msg", service.updateBoard(upt));
//        return "tracerPages/board"; // 수정 후 리다이렉트
//    }

    @PostMapping("/boardDelete")
    public String boardDelete(@RequestBody Map<String, List<String>> payload, Model model) {
        List<String> titles = payload.get("ids");
        if (titles == null || titles.isEmpty()) {
            model.addAttribute("msg", "삭제할 항목이 없습니다.");
            model.addAttribute("proc", "삭제 실패");
            return "tracerPages/board";
        }

        int result = service.deleteBoards(titles);
        model.addAttribute("msg", result > 0 ? "삭제 성공" : "삭제 실패");
        model.addAttribute("proc", "삭제");
        return "tracerPages/board";
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
    
