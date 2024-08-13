package com.web.tracerProject.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
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
    // 등록하는 코드
    @PostMapping("/boardListInsert")
    @ResponseBody
    public String boardInsert(@RequestBody Board ins) {
        if (ins.getUpt_date() == null) {
            ins.setUpt_date(new Date()); // 현재 날짜로 기본값 설정
        }
        return service.insertBoard(ins) > 0 ? "등록성공" : "등록실패";
    }
    
    // 검색하는 코드
    @GetMapping("/search")
    public String search(@RequestParam(required = false, defaultValue = "") String searchText,
                         @RequestParam(required = false, defaultValue = "title") String searchType,
                         Model model) {
        List<Board> results = service.search(searchText, searchType);

        // 검색 결과를 모델에 추가
        model.addAttribute("boardList", results);
        model.addAttribute("searchText", searchText);
        model.addAttribute("searchType", searchType);

        // 결과를 보여줄 JSP 파일 경로 반환
        return "tracerPages/riskBoard"; // JSP 파일 경로를 반환합니다.
    }
    
    // 등록하는 코드
 // 단일 게시판 조회
    @GetMapping("/{bid}")
    @ResponseBody
    public String getBoardById(@PathVariable("bid") String bid) {
        Board board = service.getBoardById(bid);
        if (board != null) {
            // JSON 형태로 반환
            return "{ \"bid\": \"" + board.getBid() + "\", \"title\": \"" + board.getTitle() + "\", \"content\": \"" + board.getContent() + "\" }";
        } else {
            return "게시물 없음";
        }
    }

    @PostMapping("/boardUpdate")
    @ResponseBody
    public ResponseEntity<String> updateBoard(@RequestBody Board updatedBoard) {
        try {
            int result = service.updateBoard(updatedBoard);
            if (result > 0) {
                return ResponseEntity.ok("수정 성공");
            } else {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("수정 실패");
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("서버 오류: " + e.getMessage());
        }
    }

  

    @DeleteMapping("/delete/{bid}")
    @ResponseBody
    public ResponseEntity<String> deleteBoard(@PathVariable("bid") String bid) {
        int result = service.deleteBoard(bid); // 게시물 삭제 호출

        if (result > 0) {
            return ResponseEntity.ok("삭제 성공");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("삭제 실패");
        }
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
    
