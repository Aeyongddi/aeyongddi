package hahaha.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hahaha.service.CoService;
import hahaha.vo.Reservation01;
import hahaha.vo.Schedule01;

@Controller
public class CoCt {

    @Autowired(required=false)
    private CoService service;
 // http://localhost:7080/hahaha/ReservationList.do
    @RequestMapping("ReservationList.do")
    public String reservationList(Reservation01 sch, Model model) {
        List<Reservation01> reservationList = service.getReservationList(sch);
        model.addAttribute("reservationList", reservationList);
        return "coco"; // "coco"는 뷰의 이름입니다.
    }

    @RequestMapping("searchByParams.do")
    public String searchByParams(Reservation01 sch, Model model,
            @RequestParam(value = "departureDate", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date departureDate,
            @RequestParam(value = "arrivalDate", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date arrivalDate) {

        // 검색 조건에 날짜 정보 설정
        if (departureDate != null) {
            sch.setDeparture_date(departureDate);
        }
        if (arrivalDate != null) {
            sch.setArrival_date(arrivalDate);
        }
                
        List<Reservation01> reservationList = service.getReservation01List(sch);
        model.addAttribute("reservationList", reservationList);
        return "coco"; // "coco"는 뷰의 이름입니다.
    }
 // http://localhost:7080/hahaha/reservation01Update100.do
    @RequestMapping("reservation01Update100.do")
   public String Reservation01Update(Reservation01 upt, Model d) {
      
      d.addAttribute("msg", service.uptReservation01(upt));
      return "coco"; 
   }
    
    @RequestMapping("reservation01Delete100.do")
    public String reservation01Delete(@RequestParam("reservation") int reservation, Model d) {
        d.addAttribute("msg", service.delReservation01(reservation));
        d.addAttribute("proc", "삭제");
        return "coco"; 
    }
    
    // http://localhost:7080/hahaha/ScheduleList.do
    @RequestMapping("ScheduleList.do")
    public String scheduleList(Schedule01 sch, Model model) {
        List<Schedule01> scheduleList = service.getScheduleList(sch);
        model.addAttribute("scheduleList", scheduleList);
        return "jojo"; // "header"는 뷰의 이름입니다.
    }

    
    @RequestMapping("searchByScheduleParams2.do")
    public String searchByScheduleParams2(Schedule01 sch, Model model,
            @RequestParam(value = "departure_time", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date departureTime,
            @RequestParam(value = "arrival_time", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date arrivalTime) {

        // 검색 조건에 날짜 정보 설정
        if (departureTime != null) {
            sch.setDeparture_time(departureTime);
        }
        if (arrivalTime != null) {
            sch.setArrival_time(arrivalTime);
        }
      
        List<Schedule01> scheduleList = service.getSchedule01List(sch);
        model.addAttribute("scheduleList", scheduleList);
        return "jojo"; // "header"는 뷰의 이름입니다.
    }

}
