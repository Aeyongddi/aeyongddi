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

	@Update("UPDATE TASK SET isend = #{isend} WHERE tkid = #{tkid}")
	int updateTaskStatus(@Param("tkid") String tkid, @Param("isend") boolean isend);
	
//	@Insert("INSERT INTO TASK (TKID, START_DATE, END_DATE, ISEND, NAME, DESCRIPTION, SID)\r\n"
//			+ "VALUES (#{tkid}, #{start_dateStr}, #{end_dateStr}, #{isend}, #{name}, #{description}, #{sid})")
//	int insertTask(Task task);
	
//	@Insert("INSERT INTO TASK (TKID, START_DATE, END_DATE, ISEND, NAME, DESCRIPTION, SID) VALUES (#{tkid}, #{start_date}, #{end_date}, #{isend}, #{name}, #{description}, #{sid})")
//	int insertTask(Task task);

	@Insert("INSERT INTO tasks (tkid, start_date, end_date, name, description, isend, sid) " +
            "VALUES (#{tkid}, to_date('#{start_date}', 'YYYY-MM-DD'),to_date('#{end_date}', 'YYYY-MM-DD'), #{name}, #{description}, #{isend}, #{sid})")
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
