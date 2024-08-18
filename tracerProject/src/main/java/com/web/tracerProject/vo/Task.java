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
public class Task {
    private String tkid;
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startDate;
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endDate;
    
    private String name;
    private String description;
    private String sid;
    private Boolean endYn;
    private String email;
    private String approvalStatus;
    
    // 포맷팅된 날짜 필드 추가
    private String formattedStartDate;
    private String formattedEndDate;
    
    // Approval 객체를 필드로 추가
    private Approval approval; 
}
