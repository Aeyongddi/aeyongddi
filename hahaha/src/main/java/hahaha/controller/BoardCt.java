package hahaha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    public String boardInsert(@RequestParam(defaultValue = "0") int inquiry_id,
                              @RequestParam String customer_id,
                              @RequestParam String title,
                              @RequestParam String content,
                              @RequestParam String response,
                              @RequestParam String status,
                              Model d) {
        Board ins = new Board();
        ins.setInquiry_id(inquiry_id);
        ins.setCustomer_id(customer_id);
        ins.setTitle(title);
        ins.setContent(content);
        ins.setResponse(response);
        ins.setStatus(status);

        String msg = service.boardInsert(ins);
        d.addAttribute("msg", msg);
        if ("게시물 등록 성공".equals(msg)) {
            return "redirect:boardList.do";
        } else {
            d.addAttribute("board", ins);
            return "insertAnswer";
        }
    }
    
    // http://localhost:7080/hahaha/boardUpdate.do
    @RequestMapping("boardUpdate.do")
    public String boardUpdate(Board upt, Model d) {
        d.addAttribute("msg", service.updateBoard(upt));
        return "insertAnswer";
    }
}
