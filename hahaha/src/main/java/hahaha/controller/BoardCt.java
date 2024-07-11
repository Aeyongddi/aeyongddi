package hahaha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hahaha.service.BoardService;
import hahaha.vo.Board;
import hahaha.vo.Customer;

@Controller
public class BoardCt {
    @Autowired(required=false)
    private BoardService service;

    // http://localhost:7080/hahaha/boardList.do
    @RequestMapping("boardList.do")
    public String boardList(@RequestParam(value="customer_id", required=false, defaultValue="") String customer_id,
                            @RequestParam(value="status", required=false, defaultValue="") String status, 
                            Model d) {
        d.addAttribute("boardList", service.getBoardList(customer_id, status));
        return "qnaList";
    }

    @RequestMapping("boardInsertFrm.do")
    public String boardInsertFrm(@RequestParam(required = false) Integer inquiry_id, Model d) {
        if (inquiry_id != null) {
            Board board = service.getBoardById(inquiry_id);
            d.addAttribute("board", board);
            if (board != null) {
                Customer customer = service.getCustomer(board.getCustomer_id());
                d.addAttribute("customer", customer); // 작성자 정보를 JSP에 전달
            }
        }
        return "insertAnswer";
    }

    // http://localhost:7080/hahaha/boardInsert.do
    @RequestMapping("boardInsert.do")
    public String boardInsert(Board ins, Model d) {
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

    // http://localhost:7080/hahaha/boardDelete.do
    @RequestMapping("boardDelete.do")
    public String boardDelete(@RequestParam("inquiry_id") int inquiry_id, Model d) {
        d.addAttribute("msg", service.deleteBoard(inquiry_id));
        return "redirect:boardList.do"; // JSON 응답을 위한 뷰
    }
}
