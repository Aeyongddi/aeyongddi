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

    public List<Board> getBoardList(Board sch) {
    	processNullFields(sch);
        return dao.getBoardList();
    }

     
//    public int updateBoard(Board upt) {
//        return dao.updateBoard(upt);
//    }
    
    public int updateBoardStatus(String bid, boolean endYN) {
        return dao.updateBoardStatus(bid, endYN);
    }

    public int deleteBoard(String title) {
        return dao.deleteBoard(title);
    }

    public int deleteBoards(List<String> bids) {
        int totalDeleted = 0;
        for (String bid : bids) {
            totalDeleted += dao.deleteBoard(bid);
        }
        return totalDeleted;
    }
    
    private void processNullFields(Board sch) {
        // name 필드 처리
        if (sch.getBid() == null) {
            sch.setBid("");
        }
        // reservation 필드 처리
        if (sch.getTitle() == null) {
            sch.setTitle("");
        }
        // passport_number 필드 처리
        if (sch.getContent() == null) {
            sch.setContent("");
        }
        if (sch.getUpt_date() == null) {
            sch.setUpt_date(new Date()); // 현재 시간으로 기본값 설정
        }
        if (sch.getBtype() == null) {
        	sch.setBtype("");
        }
        if (sch.getCid() == null) {
        	sch.setCid("");
        }
        if (sch.getEmail() == null) {
        	sch.setEmail("");
        }
        if (sch.getSid() == null) {
        	sch.setSid("");
        } 
        
    }
   
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
        return dao.insertBoard(ins);
    }
}
