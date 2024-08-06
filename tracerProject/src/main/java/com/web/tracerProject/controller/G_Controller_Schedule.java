package com.web.tracerProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.web.tracerProject.service.G_Service_SCHEDULE;

@Controller
public class G_Controller_Schedule {
      @Autowired(required = false)
      private G_Service_SCHEDULE dao;
      
      
}
