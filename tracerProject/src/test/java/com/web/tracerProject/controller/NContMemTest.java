package com.web.tracerProject.controller;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.MockitoAnnotations;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;

import com.web.tracerProject.service.NSerMem;
import com.web.tracerProject.vo.User_info;

import jakarta.servlet.http.HttpSession;

@WebMvcTest(NContMem.class)
public class NContMemTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private NSerMem service;

    @MockBean(name = "httpSession")
    private HttpSession session;

    @InjectMocks
    private NContMem controller;

    private User_info userInfo;

    @BeforeEach
    public void setup() {
        MockitoAnnotations.openMocks(this);
        userInfo = new User_info();
        userInfo.setEmail("test@example.com");
    }

    @Test
    public void testSignupFrm() throws Exception {
        mockMvc.perform(get("/signup"))
                .andExpect(status().isOk())
                .andExpect(view().name("tracerPages/signup"));
    }

    @Test
    public void testSignupSuccess() throws Exception {
        when(service.insMember(any(User_info.class))).thenReturn("회원가입성공");

        mockMvc.perform(post("/signup")
                .flashAttr("user_info", userInfo))
                .andExpect(status().isOk())
                .andExpect(view().name("tracerPages/signupSuccess"))
                .andExpect(model().attribute("msg", "회원가입성공"));
    }

    @Test
    public void testSignupFailure() throws Exception {
        when(service.insMember(any(User_info.class))).thenReturn("회원가입실패");

        mockMvc.perform(post("/signup")
                .flashAttr("user_info", userInfo))
                .andExpect(status().isOk())
                .andExpect(view().name("tracerPages/signup"))
                .andExpect(model().attribute("msg", "회원가입실패"));
    }

    @Test
    public void testEmailDupChk() throws Exception {
        when(service.emailDupChk(anyString())).thenReturn("중복된 이메일");

        mockMvc.perform(post("/emailDupChk")
                .param("email", "test@example.com")
                .contentType(MediaType.APPLICATION_FORM_URLENCODED))
                .andExpect(status().isOk())
                .andExpect(content().string("중복된 이메일"));
    }

    @Test
    public void testLoginFrm() throws Exception {
        mockMvc.perform(get("/login"))
                .andExpect(status().isOk())
                .andExpect(view().name("tracerPages/login"));
    }

    @Test
    public void testLogout() throws Exception {
        mockMvc.perform(get("/logout"))
                .andExpect(status().isOk())
                .andExpect(view().name("tracerPages/login"));
    }

    @Test
    public void testResetPassword() throws Exception {
        mockMvc.perform(get("/reset_password"))
                .andExpect(status().isOk())
                .andExpect(view().name("tracerPages/reset-password"));
    }

    @Test
    public void testAccount() throws Exception {
        when(session.getAttribute("info")).thenReturn(userInfo);

        mockMvc.perform(get("/account"))
                .andExpect(status().isOk())
                .andExpect(view().name("tracerPages/account"))
                .andExpect(model().attribute("user_info", userInfo));
    }

    @Test
    public void testChgPwdFrm() throws Exception {
        mockMvc.perform(get("/chgPwd"))
                .andExpect(status().isOk())
                .andExpect(view().name("tracerPages/chgPwd"));
    }

    @Test
    public void testChgPwd() throws Exception {
        when(service.chgPwd(anyString(), anyString())).thenReturn("비밀번호 변경 성공");

        mockMvc.perform(post("/chgPwd")
                .param("password", "newpassword")
                .param("email", "test@example.com")
                .contentType(MediaType.APPLICATION_FORM_URLENCODED))
                .andExpect(status().isOk())
                .andExpect(content().string("비밀번호 변경 성공"));
    }
}
