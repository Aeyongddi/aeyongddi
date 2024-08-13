package com.web.tracerProject.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.tracerProject.mapper.G_Dao_BOARD;
import com.web.tracerProject.vo.Board;

@Service
public class G_Service_BOARD {
     
    @Autowired(required=false)
    private G_Dao_BOARD dao;
    // 리스트 조회
    public List<Board> getBoardList(Board sch) {
    	
        return dao.getBoardList();
    }
    
    // 검색 메서드
    public List<Board> search(String searchText, String searchType) {
        return dao.search(searchText, searchType);
    }
    
 // 단일 게시판 조회
    public Board getBoardById(String bid) {
        return dao.getBoardById(bid);
    }

    // 게시판 수정
    public int updateBoard(Board updatedBoard) {
        // 기존 데이터 가져오기
        Board existingBoard = dao.getBoardById(updatedBoard.getBid());

        if (existingBoard != null) {
            // 기존 데이터 유지
            if (updatedBoard.getTitle() != null) {
                existingBoard.setTitle(updatedBoard.getTitle());
            }
            if (updatedBoard.getContent() != null) {
                existingBoard.setContent(updatedBoard.getContent());
            }
            if (updatedBoard.getUf() != null) {
                existingBoard.setUf(updatedBoard.getUf());
            }
            // 상태를 업데이트
            existingBoard.setEndYN(updatedBoard.isEndYN());

            // 업데이트
            return dao.updateBoard(existingBoard);
        }
        return 0; // 수정 실패
    }
    // boolean 실시간으로 값 이동
    public int updateBoardStatus(String bid, boolean endYN) {
        return dao.updateBoardStatus(bid, endYN);
    }
    
    // 삭제하는 코드
    public int deleteBoard(String bid) {
        return dao.deleteBoard(bid);
    }

    // 등록할때 null 처리
    public int insertBoard(Board ins) {
    	if (ins.getTitle() == null) {
    		ins.setTitle("");
        }
    	
    	if (ins.getUpt_date() == null) {
            ins.setUpt_date(new Date()); // 현재 날짜로 기본값 설정
        }
    	if (ins.getContent() == null) {
    		ins.setContent("");
        }
    	if (ins.getBtype() == null) {
    		ins.setBtype("");
        }
        if (!ins.isEndYN()) {
            ins.setEndYN(false); // 기본값 설정
        }
        if (ins.getUf() == null) {
    		ins.setUf("");
        }
        if (ins.getName() == null) {
    		ins.setName("");
        }
        return dao.insertBoard(ins);
    }
}
