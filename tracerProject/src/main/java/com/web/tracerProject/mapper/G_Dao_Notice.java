package com.web.tracerProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.tracerProject.vo.Notice;
import com.web.tracerProject.vo.NoticeSch;

@Mapper
public interface G_Dao_Notice {

	@Select("SELECT * FROM NOTICE ORDER BY vid")
	List<Notice> getNoticeList();

	@Insert("INSERT INTO NOTICE (vid, title, content, email, date_of_registration, start_date, end_date, nickname, link) "
			  + "VALUES ('b'||LPAD(vid_SEQ.NEXTVAL, 3, '0'), #{title}, #{content}, #{email}, SYSDATE, #{start_date}, #{end_date}, #{nickname} ,#{link})")
    int insertNotice(Notice notice);

	
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
	
	@Update("UPDATE NOTICE SET title=#{title}, content=#{content}, link=#{link} WHERE vid=#{vid}")
    int updateNotice(Notice notice);
	
    // 공지사항의 총 개수를 조회하는 메서드
    @Select("SELECT count(*) FROM NOTICE "
            + "WHERE title LIKE '%' || #{subject} || '%' "
            + "AND nickname LIKE '%' || #{writer} || '%'")
    int getNoticeCount(NoticeSch sch);

    // 페이지네이션을 적용한 공지사항 목록을 가져오는 메서드
    @Select("SELECT * FROM ( "
            + "  SELECT rownum cnt, n.* "
            + "  FROM ( "
            + "    SELECT * "
            + "    FROM NOTICE "
            + "    WHERE title LIKE '%' || #{subject} || '%' "
            + "    AND nickname LIKE '%' || #{writer} || '%' "
            + "    ORDER BY date_of_registration DESC "
            + "  ) n "
            + ") "
            + "WHERE cnt BETWEEN #{start} AND #{end}")
    List<Notice> getNoticeListWithPagination(NoticeSch sch);
}
	
	


	

