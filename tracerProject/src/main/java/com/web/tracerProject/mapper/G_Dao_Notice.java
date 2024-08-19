package com.web.tracerProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.web.tracerProject.vo.Notice;

@Mapper
public interface G_Dao_Notice {

	@Select("SELECT * FROM NOTICE ORDER BY vid")
	List<Notice> getNoticeList();

	@Insert("INSERT INTO NOTICE (vid, title, content, email, date_of_registration, start_date, end_date, nickname, link) "
			  + "VALUES ('b'||LPAD(vid_SEQ.NEXTVAL, 3, '0'), #{title}, #{content}, #{email}, SYSDATE, #{start_date}, #{end_date}, #{nickname} ,#{link})")
    int insertNotice(Notice notice);

	@Insert("INSERT INTO NOTICE (comments) VALUES('c' || LPAD(COMMENTS_SEQ.NEXTVAL, 3, '0')")
	int insertcomm(Notice notice);
	
	@Delete("DELETE FROM NOTICE WHERE vid = #{vid}")
	int deleteNotice(@Param("vid") String vid);
	

	@Select("<script>" +
            "SELECT * FROM NOTICE" +
            "<where>" +
            "<if test='searchType != null and searchText != null'>" +
            "  AND ${searchType} LIKE '%' || #{searchText} || '%'" +
            "</if>" +
            "</where>" +
            "ORDER BY vid	" +
            "</script>")
    List<Notice> search(@Param("searchText") String searchText, @Param("searchType") String searchType);
	
	@Select("SELECT * FROM NOTICE WHERE vid = #{vid}")
    Notice getNoticeById(@Param("vid") String vid);
}
	