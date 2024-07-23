package com.web.tracerProject.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Team {
	private String nid;
	private boolean isread;
	private String title;
	private String content;
	private String email;
}
