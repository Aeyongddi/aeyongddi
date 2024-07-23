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
public class Board {
	private String bid;
	private String title;
	private String content;
	private Date upt_date;
	private int views;
	private String btype;
	private String cid;
	private String email;
	private String sid;
}
