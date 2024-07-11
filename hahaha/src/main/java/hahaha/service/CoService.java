package hahaha.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hahaha.dao.CoDao;
import hahaha.vo.Reservation01;
import hahaha.vo.Schedule01;

@Service
public class CoService {

    @Autowired(required=false)
    private CoDao dao;

    public List<Reservation01> getReservationList(Reservation01 sch) {
        processNullFields(sch); // null 필드 처리

        return dao.getReservation01List(sch);
    }

    public List<Reservation01> getReservation01List(Reservation01 sch) {
        
        return dao.getReservation01List(sch);
    }


    private void processNullFields(Reservation01 sch) {
        // name 필드 처리
        if (sch.getName() == null) {
            sch.setName("");
        }
        // reservation 필드 처리
        if (sch.getReservation() == null) {
            sch.setReservation("");
        }
        // passport_number 필드 처리
        if (sch.getPassport_number() == null) {
            sch.setPassport_number("");
        }
        if (sch.getDeparture_dateStr() == null) {
           sch.setDeparture_dateStr("");
        }
        if (sch.getArrival_dateStr() == null) {
           sch.setArrival_dateStr("");
        }
        // 추가 필드가 있다면 비슷하게 처리 가능
       
    }
    public String uptReservation01(Reservation01 upt) {
       System.out.println(upt);
       
        return dao.uptReservation01(upt) > 0 ? "수정성공" : "수정실패";
    }
    
    
    public String delReservation01(int reservation) {
        return dao.delReservation01(reservation) > 0 ? "삭제성공" : "삭제실패";
    }
    
///////////////////////////////////////////////////////////////////////////////////   
 //List<Schedule> getScheduleList(); List<Schedule> getSchedule01List(@Param("sch") Schedule sch);
    public List<Schedule01> getScheduleList(Schedule01 sch) {
        NullFields(sch); // null 필드 처리

        return dao.getFullSchedule01List(sch);
    }

     public List<Schedule01> getSchedule01List(Schedule01 sch) {
        
        return dao.getFullSchedule01List(sch);
    }


    public void NullFields(Schedule01 sch) {
        if (sch.getFlight_number() == null) {
           sch.setFlight_number("");
        }
        if (sch.getDeparture_timeStr() == null) {
           sch.setDeparture_timeStr("");
        }
        if (sch.getArrival_timeStr() == null) {
           sch.setArrival_timeStr("");
        }
    }

   
    
  
}
    

