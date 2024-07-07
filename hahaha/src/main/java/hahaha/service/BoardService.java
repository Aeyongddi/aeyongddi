package hahaha.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hahaha.dao.BoardDao;
import hahaha.vo.Board;

@Service
public class BoardService {
    @Autowired(required=false)
    private BoardDao dao;

    public List<Board> getBoardList(Board sch) {
        return dao.getBoardList(sch);
    }

    public Board getBoard(int inquiry_id) {
        return dao.getBoard(inquiry_id);
    }

    public String boardInsert(Board ins) {
        return dao.boardInsert(ins) > 0 ? "게시물 등록 성공" : "게시물 등록 실패";
    }
    
    public String updateBoard(Board upt) {
    	return dao.updateBoard(upt)>0?"수정성공":"수정실패";
	}
}
