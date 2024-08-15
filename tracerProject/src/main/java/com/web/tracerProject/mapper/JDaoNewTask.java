package com.web.tracerProject.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.Delete;
import java.util.List;
import com.web.tracerProject.vo.Task;

@Mapper
public interface JDaoNewTask {

    @Select("SELECT * FROM TASK") 
    List<Task> findAllTasks();

    /*
     * @Select("SELECT * FROM \"C##JH\".\"TASK\"")
     * List<Task> findAllTasks();
     */
    
    @Insert("INSERT INTO TASK (TKID, START_DATE, END_DATE, NAME, DESCRIPTION, SID, ENDYN) " +
            "VALUES (#{tkid}, #{startDate}, #{endDate}, #{name}, #{description}, #{sid}, #{endYn})")
    void insertTask(Task task);

    /*
     * @Insert("INSERT INTO \"C##JH\".\"TASK\" (\"TKID\", \"START_DATE\", \"END_DATE\", \"NAME\", \"DESCRIPTION\", \"SID\", \"ENDYN\") " +
     *         "VALUES (#{tkid}, #{startDate}, #{endDate}, #{name}, #{description}, #{sid}, #{endYn})")
     */

    @Update("UPDATE TASK SET START_DATE = #{startDate}, END_DATE = #{endDate}, " +
            "NAME = #{name}, DESCRIPTION = #{description}, SID = #{sid}, ENDYN = #{endYn} " +
            "WHERE TKID = #{tkid}")
    void updateTask(Task task);

    /*
     * @Update("UPDATE \"C##JH\".\"TASK\" SET \"START_DATE\" = #{startDate}, \"END_DATE\" = #{endDate}, " +
     *         "\"NAME\" = #{name}, \"DESCRIPTION\" = #{description}, \"SID\" = #{sid}, \"ENDYN\" = #{endYn} " +
     *         "WHERE \"TKID\" = #{tkid}")
     */

    @Delete("DELETE FROM TASK WHERE TKID = #{tkid}")
    void deleteTask(String tkid);

    /*
     * @Delete("DELETE FROM \"C##JH\".\"TASK\" WHERE \"TKID\" = #{tkid}")
     */

    @Select("SELECT * FROM TASK WHERE TKID = #{tkid}") 
    Task findTaskById(String tkid);

    /*
     * @Select("SELECT * FROM \"C##JH\".\"TASK\" WHERE \"TKID\" = #{tkid}")
     * Task findTaskById(String tkid);
     */
}
