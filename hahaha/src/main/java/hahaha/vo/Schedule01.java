package hahaha.vo;

import java.util.Date;

public class Schedule01 {
    private int scgedule_id;
    private String flight_number;
    private String departure;
    private String arrival;
    private Date departure_time;
    private Date arrival_time;
    private String departure_timeStr;
    private String arrival_timeStr;
   public Schedule01() {
      super();
      // TODO Auto-generated constructor stub
   }
   public Schedule01(int scgedule_id, String flight_number, String departure, String arrival, Date departure_time,
         Date arrival_time, String departure_timeStr, String arrival_timeStr) {
      super();
      this.scgedule_id = scgedule_id;
      this.flight_number = flight_number;
      this.departure = departure;
      this.arrival = arrival;
      this.departure_time = departure_time;
      this.arrival_time = arrival_time;
      this.departure_timeStr = departure_timeStr;
      this.arrival_timeStr = arrival_timeStr;
   }
   public int getScgedule_id() {
      return scgedule_id;
   }
   public void setScgedule_id(int scgedule_id) {
      this.scgedule_id = scgedule_id;
   }
   public String getFlight_number() {
      return flight_number;
   }
   public void setFlight_number(String flight_number) {
      this.flight_number = flight_number;
   }
   public String getDeparture() {
      return departure;
   }
   public void setDeparture(String departure) {
      this.departure = departure;
   }
   public String getArrival() {
      return arrival;
   }
   public void setArrival(String arrival) {
      this.arrival = arrival;
   }
   public Date getDeparture_time() {
      return departure_time;
   }
   public void setDeparture_time(Date departure_time) {
      this.departure_time = departure_time;
   }
   public Date getArrival_time() {
      return arrival_time;
   }
   public void setArrival_time(Date arrival_time) {
      this.arrival_time = arrival_time;
   }
   public String getDeparture_timeStr() {
      return departure_timeStr;
   }
   public void setDeparture_timeStr(String departure_timeStr) {
      this.departure_timeStr = departure_timeStr;
   }
   public String getArrival_timeStr() {
      return arrival_timeStr;
   }
   public void setArrival_timeStr(String arrival_timeStr) {
      this.arrival_timeStr = arrival_timeStr;
   }
   
   
}
