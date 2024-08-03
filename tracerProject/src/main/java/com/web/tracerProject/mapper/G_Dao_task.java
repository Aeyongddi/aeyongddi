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
  
	@Select("SELECT * FROM TASK ORDER BY TKID")
    List<Task> getTaskList();
     
	 // endYN DB에 바로 적용되는 코드
	 @Update("UPDATE TASK SET endYN = #{endYN} WHERE tkid = #{tkid}")
	 int updateTaskStatus(@Param("tkid") String tkid, @Param("endYN") boolean endYN);
	
     // 등록하는 코드 
	 @Insert("INSERT INTO task (tkid, start_date, end_date, name, description, endYN, sid) " +
	        "VALUES (#{tkid}, #{start_date}, #{end_date},#{name}, #{description}, #{endYN}, #{sid})")
	 int insertTask(Task task);
	
	
	
	
	
	@Delete("DELETE FROM TASK WHERE tkid = #{tkid}")
	int deleteTask(@Param("tkid") String tkid);
     
	@Delete({
	    "<script>",
	    "DELETE FROM TASK WHERE tkid IN",
	    "<foreach collection='tkids' item='tkid' open='(' separator=',' close=')'>",
	    "#{tkid}",
	    "</foreach>",
	    "</script>"
	})
	int deleteTasks(@Param("tkids") List<String> tkids);
    
	@Select("SELECT 'tk' || TO_CHAR(task_seq.NEXTVAL) AS tkid FROM dual")
    String getTkid();
}
