package com.web.tracerProject.service;

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
        return dao.getBoardList();
    }

    public int insertBoard(Board ins) {
        // 시퀀스를 사용하여 bid와 cid 설정
        int nextBid = dao.getNextBid();
        int nextCid = dao.getNextCid();
        
        // 숫자를 문자열로 변환
        ins.setBid(String.valueOf(nextBid));
        ins.setCid(String.valueOf(nextCid));
        
        return dao.insertBoard(ins);
    }

    public int updateBoard(Board upt) {
        return dao.updateBoard(upt);
    }

    public int deleteBoard(int bid) {
        return dao.deleteBoard(bid);
    }
}
