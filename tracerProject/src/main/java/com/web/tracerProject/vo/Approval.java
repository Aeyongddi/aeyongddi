package com.web.tracerProject.vo;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Approval {
    private String apid;
    private String content;
    private String email;
    private String approvalStatus;
    private String nickname;
    private String sid;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private LocalDateTime requestDateTime; // 결재 요청 날짜/시간
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private LocalDateTime statusUpdateDateTime; // 상태 변경 날짜/시간
    private String rejectReason;
    
    // 포맷된 날짜 시간 반환 메서드
    public String getFormattedRequestDateTime() {
        return requestDateTime != null ? requestDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")) : "";
    }

    public String getFormattedStatusUpdateDateTime() {
        return statusUpdateDateTime != null ? statusUpdateDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")) : "";
    }
}
