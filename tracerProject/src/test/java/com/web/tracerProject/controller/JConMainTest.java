package com.web.tracerProject.controller;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.util.ArrayList;
import java.util.Date;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.servlet.LocaleResolver;

import com.web.tracerProject.service.JSerMain;
import com.web.tracerProject.vo.Project;
import com.web.tracerProject.vo.ProjectProgress;
import com.web.tracerProject.vo.Task;
import com.web.tracerProject.vo.User_info;

import jakarta.servlet.http.HttpSession;

@WebMvcTest(JContMain.class)
@ActiveProfiles("test")  // 'application-test.yml' 설정 파일을 사용하도록 프로필 설정
public class JConMainTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private JSerMain service;

    @MockBean
    private LocaleResolver localeResolver;

    @Mock
    @Qualifier("httpSession")
    private HttpSession session;

    @InjectMocks
    private JContMain controller;

    private User_info userInfo;
    private Task task;

    @BeforeEach
    public void setup() {
        MockitoAnnotations.openMocks(this);
        userInfo = new User_info();
        userInfo.setName("testUser");
        userInfo.setEmail("test@example.com");
        userInfo.setNickname("tester");

        task = new Task();
    }

    @Test
    public void testMainLoginSuccess() throws Exception {
        when(service.isMember(any(User_info.class))).thenReturn("로그인성공");
        when(service.getMember(any(User_info.class))).thenReturn(userInfo);
        when(service.getTodayDo(any(Task.class))).thenReturn(5);
        when(service.getWeekDo(any(Task.class))).thenReturn(10);
        when(service.getDueto(any(Task.class))).thenReturn(new Date());
        when(service.getDday(any(Task.class))).thenReturn("D-1");
        when(service.getCountPro(any(Task.class))).thenReturn(3);
        when(service.getTaskProgress(any(Task.class))).thenReturn(50);
        when(service.getProjectProgress()).thenReturn(new ArrayList<ProjectProgress>());
        when(service.getProjectList()).thenReturn(new ArrayList<Project>());

        mockMvc.perform(post("/index")
                .flashAttr("task", task)
                .flashAttr("user_info", userInfo))
                .andExpect(status().isOk())
                .andExpect(view().name("tracerPages/index"))
                .andExpect(model().attributeExists("todayDoCount"))
                .andExpect(model().attributeExists("thisWeekDo"))
                .andExpect(model().attributeExists("dueto"))
                .andExpect(model().attributeExists("dDay"))
                .andExpect(model().attributeExists("countPro"))
                .andExpect(model().attributeExists("taskPro"))
                .andExpect(model().attributeExists("projectProgressList"))
                .andExpect(model().attributeExists("projectList"))
                .andExpect(model().attributeExists("user_info"));
    }
}
