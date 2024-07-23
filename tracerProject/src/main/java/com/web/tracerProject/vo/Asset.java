package com.web.tracerProject.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Asset {
	private String aid;
	private String atype;
	private int cost;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date adate;
	private String pid;
}
