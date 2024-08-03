package com.web.tracerProject.vo;

import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Gantt {
	private String id;
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private String start_date;
	private String duration;
	private String progress;
	private String sortorder;
	private String parent;
	private String open;
	private String text;
	private String users;
}
