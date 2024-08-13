package com.web.tracerProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.tracerProject.vo.Task;

@Mapper
public interface G_Dao_task {
  
	@Select("SELECT * " +
	        "FROM TASK " +
	        "ORDER BY CASE " +
	        "             WHEN REGEXP_LIKE(SUBSTR(TKID, 3), '^[0-9]+$') THEN TO_NUMBER(SUBSTR(TKID, 3)) " +
	        "             ELSE NULL " +
	        "         END")
	List<Task> getTaskList();
     
	// 수정하는 코드
	@Update("UPDATE TASK SET name=#{name}, description=#{description}, sid=#{sid}, approvalStatus=#{approvalStatus} WHERE tkid=#{tkid}")
	int updateTask(Task task);

	
	// endYN DB에 바로 적용되는 코드
	@Update("UPDATE TASK SET endYN = #{endYN}, approvalStatus = #{approvalStatus} WHERE tkid = #{tkid}")
	int updateTaskStatus(@Param("tkid") String tkid, @Param("endYN") boolean endYN, @Param("approvalStatus") String approvalStatus);
	
    // 등록하는 코드 
	@Insert("INSERT INTO task (tkid, start_date, end_date, name, description, endYN, sid) " +
	        "VALUES (#{tkid}, #{start_date}, #{end_date},#{name}, #{description}, #{endYN}, #{sid})")
	int insertTask(Task task);
     
	 // 삭제하는 코드
	 @Delete("DELETE FROM TASK WHERE tkid = #{tkid}")
	 int deleteTask(@Param("tkid") String tkid);
     
	 // 전체 삭제 코드
	 @Delete({
	    "<script>",
	    "DELETE FROM TASK WHERE tkid IN",
	    "<foreach collection='tkids' item='tkid' open='(' separator=',' close=')'>",
	    "#{tkid}",
	    "</foreach>",
	    "</script>"
	 })
	 int deleteTasks(@Param("tkids") List<String> tkids);
     
	 // tkid 스퀀스 등록 하는 코드
	 @Select("SELECT 'tk' || TO_CHAR(task_seq.NEXTVAL) AS tkid FROM dual")
     String getTkid();
	 
	// 특정 tkid로 Task를 조회하는 메서드
	    @Select("SELECT * FROM TASK WHERE TKID = #{tkid}")
	    Task getTaskByTkid(@Param("tkid") String tkid);
	 
	 
	 


}
