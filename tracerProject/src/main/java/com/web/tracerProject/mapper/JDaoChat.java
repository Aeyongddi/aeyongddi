package com.web.tracerProject.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.web.tracerProject.vo.Chatting;

import java.util.List;

@Mapper
public interface JDaoChat {
    @Insert("INSERT INTO CHATTING (CHID, EMAIL, SENT_DATE, CONTENT) VALUES (#{chid}, #{email}, #{sent_date}, #{content})")
    void saveChatMessage(Chatting chatMessage);

    @Select("SELECT * FROM CHATTING ORDER BY SENT_DATE ASC")
    List<Chatting> getAllChatMessages();
    
    @Select("SELECT NICKNAME FROM USER_INFO WHERE EMAIL = #{email}")
    String getNicknameByEmail(@Param("email") String email);
}
