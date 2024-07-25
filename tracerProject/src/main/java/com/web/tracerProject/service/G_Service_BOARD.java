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
	   //   @Select("SELECT * FROM BOARD") List<Board> getBoardList(); null처리
	   
	   public List<Board> getBoardList(Board sch) {
		    processNullFields(sch);
		   
		   return dao.getBoardSearch(sch);
	   }
	   
	    public List<Board> getBoardSearch(Board sch) {
	   
     	   return dao.getBoardSearch(sch);
       }
	   
	   private void processNullFields(Board sch) {
	        // name 필드 처리
	        if (sch.getTitle() == null) {
	            sch.setTitle("");
	            }  
	        // reservation 필드 처리
	        if (sch.getBid() == null) {
	            sch.setBid("");
	        }
	        // 
	        if (sch.getContent() == null) {
	            sch.setContent("");
	        }
	        if (sch.getUpt_dateStr() == null) {
	            sch.setUpt_dateStr("");
	        }
	        if (sch.getBid() == null) {
	            sch.setBid("");
	        }
	        if (sch.getBid() == null) {
	            sch.setBid("");
	        }
	        if (sch.getBid() == null) {
	            sch.setBid("");
	        }
       }
	   
	   public String insertBoard(Board ins) {
			return dao.insertBoard(ins)>0?"등록성공":"등록실패";
		}
	   
	   public String updateBoard(Board upt) {
			return dao.updateBoard(upt)>0?"수정성공":"수정실패";
		}	
	   
}
