package com.web.tracerProject.vo;

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
}
