package hahaha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import hahaha.service.BoardService;
import hahaha.vo.Board;

@Controller
public class BoardCt {
    @Autowired(required=false)
    private BoardService service;
    
    // http://localhost:7080/hahaha/boardList.do
    @RequestMapping("boardList.do")
    public String boardList(Board sch, Model d) {
        d.addAttribute("blist", service.getBoardList(sch));
        return "qnaList";
    }
    
    @RequestMapping("boardInsertFrm.do")
    public String boardInsertFrm(Board sch, Model d) {
    	d.addAttribute("board", service.getBoard(sch.getInquiry_id()));
        return "insertAnswer";
    }
    
    // http://localhost:7080/hahaha/boardInsert.do
    @RequestMapping("boardInsert.do")
    public String boardInsert(Board ins, Model d) {
        d.addAttribute("msg", service.boardInsert(ins));
        d.addAttribute("board", service.getBoardList(ins));
        return "insertAnswer";
    }
    
    // http://localhost:7080/hahaha/boardUpdate.do
    @RequestMapping("boardUpdate.do")
    public String boardUpdate(Board upt, Model d) {
        d.addAttribute("msg", service.updateBoard(upt));
        return "insertAnswer";
    }
}
