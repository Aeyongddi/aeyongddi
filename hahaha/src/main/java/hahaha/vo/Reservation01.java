package hahaha.vo;

import java.util.Date;

public class Reservation01 {
    private String name;
    private String reservation;
    private String departure;
    private String arrival;
    private Date departure_date;
    private Date arrival_date;
    private String departure_dateStr;
    private String arrival_dateStr;
    private int passengers;
    private String seat_class;
    private String passport_number;
    private String customer_id;

    public Reservation01() {
        super();
    }

	public Reservation01(String name, String reservation, String departure, String arrival, Date departure_date,
			Date arrival_date, String departure_dateStr, String arrival_dateStr, int passengers, String seat_class,
			String passport_number, String customer_id) {
		super();
		this.name = name;
		this.reservation = reservation;
		this.departure = departure;
		this.arrival = arrival;
		this.departure_date = departure_date;
		this.arrival_date = arrival_date;
		this.departure_dateStr = departure_dateStr;
		this.arrival_dateStr = arrival_dateStr;
		this.passengers = passengers;
		this.seat_class = seat_class;
		this.passport_number = passport_number;
		this.customer_id = customer_id;
	}

	public Reservation01(String name, String reservation, String departure, String arrival, Date departure_date,
			Date arrival_date, int passengers, String seat_class, String passport_number, String customer_id) {
		super();
		this.name = name;
		this.reservation = reservation;
		this.departure = departure;
		this.arrival = arrival;
		this.departure_date = departure_date;
		this.arrival_date = arrival_date;
		this.passengers = passengers;
		this.seat_class = seat_class;
		this.passport_number = passport_number;
		this.customer_id = customer_id;
	}
    
	
	public Reservation01(String name, String reservation, Date departure_date, Date arrival_date,
			String departure_dateStr, String arrival_dateStr, String passport_number, String customer_id) {
		super();
		this.name = name;
		this.reservation = reservation;
		this.departure_date = departure_date;
		this.arrival_date = arrival_date;
		this.departure_dateStr = departure_dateStr;
		this.arrival_dateStr = arrival_dateStr;
		this.passport_number = passport_number;
		this.customer_id = customer_id;
	}

	public Reservation01(String name, String reservation, Date departure_date, Date arrival_date,
			String passport_number) {
		super();
		this.name = name;
		this.reservation = reservation;
		this.departure_date = departure_date;
		this.arrival_date = arrival_date;
		this.passport_number = passport_number;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getReservation() {
		return reservation;
	}

	public void setReservation(String reservation) {
		this.reservation = reservation;
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

	public Date getDeparture_date() {
		return departure_date;
	}

	public void setDeparture_date(Date departure_date) {
		this.departure_date = departure_date;
	}

	public Date getArrival_date() {
		return arrival_date;
	}

	public void setArrival_date(Date arrival_date) {
		this.arrival_date = arrival_date;
	}

	public String getDeparture_dateStr() {
		return departure_dateStr;
	}

	public void setDeparture_dateStr(String departure_dateStr) {
		this.departure_dateStr = departure_dateStr;
	}

	public String getArrival_dateStr() {
		return arrival_dateStr;
	}

	public void setArrival_dateStr(String arrival_dateStr) {
		this.arrival_dateStr = arrival_dateStr;
	}

	public int getPassengers() {
		return passengers;
	}

	public void setPassengers(int passengers) {
		this.passengers = passengers;
	}

	public String getSeat_class() {
		return seat_class;
	}

	public void setSeat_class(String seat_class) {
		this.seat_class = seat_class;
	}

	public String getPassport_number() {
		return passport_number;
	}

	public void setPassport_number(String passport_number) {
		this.passport_number = passport_number;
	}

	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
    
}
