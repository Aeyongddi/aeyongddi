package com.web.tracerProject.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.tracerProject.mapper.G_Dao_Notice;
import com.web.tracerProject.vo.Notice;

@Service
public class G_Service_Notice {
	@Autowired(required=false)
    private G_Dao_Notice dao;
// 조회하는 코드
public List<Notice> getNoticeList(Notice sch) {
        return dao.getNoticeList();
    }

// 등록하는 코드
public int insertNotice(Notice ins) {
    if (ins.getContent() == null) {
        ins.setContent("");
    }
 // start_date와 end_date가 null인 경우 현재 날짜와 시간으로 설정
    if (ins.getStart_date() == null) {
        ins.setStart_date(new Date()); // 현재 날짜와 시간
    }

    if (ins.getEnd_date() == null) {
        ins.setEnd_date(new Date()); // 현재 날짜와 시간
    }
    
    if (ins.getDate_of_registration() == null) {
        ins.setDate_of_registration(new Date()); // 현재 날짜와 시간
    }
    if (ins.getLink() == null) {
        ins.setLink("");
    }
    
    return dao.insertNotice(ins);
}
  // 댓글 등록하는 코드
  public int insertcomm(Notice ins) {
	return dao.insertcomm(ins);
  }
  
  // 삭제하는 코드
  public int deleteNotice(String vid) {
	    return dao.deleteNotice(vid);
	}

  // 검색하는하는 코드
  public List<Notice> searchNotices(String searchText, String searchType) {
      return dao.search(searchText, searchType);
  }
  
  //공지사항 상세 조회
  public Notice getNoticeById(String vid) {
      return dao.getNoticeById(vid);
  }
}
