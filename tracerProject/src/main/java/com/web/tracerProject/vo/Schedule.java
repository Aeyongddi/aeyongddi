package com.web.tracerProject.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Schedule {
	private String sid;
	private Date start_date;
	private Date end_date;
	private boolean is_end;
	private String title;
	private String description;
	private String email;
	private String pid;
}
