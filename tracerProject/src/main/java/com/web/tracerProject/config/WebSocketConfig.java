package com.web.tracerProject.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.web.tracerProject.util.ChatHandler;



@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer{

	private final ChatHandler chagHandler;
	
	
	public WebSocketConfig(ChatHandler chagHandler) {
		this.chagHandler = chagHandler;
	}


	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(chagHandler, "/chat").setAllowedOrigins("*");
		
	
	}

	
}