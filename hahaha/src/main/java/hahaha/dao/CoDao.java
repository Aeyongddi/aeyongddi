package hahaha.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import hahaha.vo.Reservation01;
import hahaha.vo.Schedule01;

public interface CoDao {

    @Select("SELECT * FROM ge.RESERVATION01")
    List<Reservation01> getReservationList();
    
    @Select("SELECT * FROM ge.RESERVATION01 WHERE " +
            "name LIKE '%' || #{sch.name} || '%' " +
            "AND reservation LIKE '%' || #{sch.reservation} || '%' " +
            "AND passport_number LIKE '%' || #{sch.passport_number} || '%' " +
            "AND (#{sch.departure_dateStr} IS NULL OR departure_date BETWEEN TO_DATE(#{sch.departure_dateStr}, 'yyyy-MM-dd') " +
                "AND TO_DATE(#{sch.departure_dateStr}, 'yyyy-MM-dd') + 1) " +
            "AND (#{sch.arrival_dateStr} IS NULL OR arrival_date BETWEEN TO_DATE(#{sch.arrival_dateStr}, 'yyyy-MM-dd') " +
                "AND TO_DATE(#{sch.arrival_dateStr}, 'yyyy-MM-dd') + 1) ")
    List<Reservation01> getReservation01List(@Param("sch") Reservation01 sch);
    //TO_DATE('2024-07-18 18:32:00','YYYY-MM-DD HH24:MI:SS')   departure_dateStr
    @Update("UPDATE ge.RESERVATION01 " +
            "SET departure_date = to_date(#{departure_dateStr},'YYYY-MM-DD\"T\"HH24:MI'), " +
            "arrival = #{arrival}, " +
            "arrival_date = to_date(#{arrival_dateStr},'YYYY-MM-DD\"T\"HH24:MI:SS'), " +
            "seat_class = #{seat_class} " +
            "WHERE reservation = #{reservation}")
    int uptReservation01(Reservation01 upt);
   
    @Delete("DELETE FROM ge.RESERVATION01 WHERE reservation = #{reservation}")
    int delReservation01(@Param("reservation") int reservation);
    
    @Select("SELECT * FROM ge.Schedule01") 
    List<Schedule01> getScheduleList();
    
    @Select("SELECT * FROM ge.Schedule01 " +
            "WHERE flight_number LIKE '%' || #{sch.flight_number} || '%' " +
            "AND (#{sch.departure_timeStr} IS NULL OR "
            + "departure_time BETWEEN TO_DATE(#{sch.departure_timeStr}, 'yyyy-MM-dd') " +
            "AND TO_DATE(#{sch.departure_timeStr} , 'yyyy-MM-dd') + 1) " +
            "AND (#{sch.arrival_timeStr} IS NULL OR "
            + "arrival_time BETWEEN TO_DATE(#{sch.arrival_timeStr}, 'yyyy-MM-dd') " +
            "AND TO_DATE(#{sch.arrival_timeStr}, 'yyyy-MM-dd') + 1)")
    List<Schedule01> getFullSchedule01List(@Param("sch") Schedule01 sch);
}

