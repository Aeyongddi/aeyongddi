package hahaha.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hahaha.dao.BoardDao;
import hahaha.vo.Board;
import hahaha.vo.Customer;

@Service
public class BoardService {
    @Autowired(required=false)
    private BoardDao dao;

    public List<Board> getBoardList(String customer_id, String status) {
        return dao.getBoardList(customer_id, status);
    }

    public Board getBoardById(int inquiry_id) {
        return dao.getBoard(inquiry_id);
    }

    public Customer getCustomer(String customer_id) {
        return dao.getCustomer(customer_id); // 작성자 정보를 가져오는 메서드
    }
    
    public String boardInsert(Board ins) {
        return dao.boardInsert(ins) > 0 ? "게시물 등록 성공" : "게시물 등록 실패";
    }
    
    public String updateBoard(Board upt) {
        return dao.updateBoard(upt) > 0 ? "수정 성공" : "수정 실패";
    }
    
    public String deleteBoard(int inquiry_id) {
        return dao.deleteBoard(inquiry_id) > 0 ? "삭제 성공" : "삭제 실패";
    }
}
