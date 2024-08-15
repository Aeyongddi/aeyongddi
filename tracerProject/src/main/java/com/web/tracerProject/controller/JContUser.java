package com.web.tracerProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.web.tracerProject.service.JSerUser;
import com.web.tracerProject.vo.User_info;

import java.util.List;

@Controller
public class JContUser {
    @Autowired(required = false)
    private JSerUser service;

    // http://localhost:5656/users
    @GetMapping("/users")
    public String listUsers(Model model) {
        List<User_info> users = service.getAllUsers();
        model.addAttribute("users", users);
        return "tracerPages/hr_management";
    }

    @GetMapping("/users/{email}")
    public String getUser(@PathVariable String email, Model model) {
        User_info user = service.getUserById(email);
        model.addAttribute("user", user);
        return "user_detail";
    }

    @GetMapping("/users/new")
    public String createUserForm(Model model) {
        model.addAttribute("user", new User_info());
        return "user_form";
    }

    @PostMapping("/users")
    public String createUser(@RequestBody User_info user) {
        service.createUser(user);
        return "redirect:/users";
    }


    @GetMapping("/users/edit/{email}")
    public String editUserForm(@PathVariable String email, Model model) {
        User_info user = service.getUserById(email);
        model.addAttribute("user", user);
        return "user_form";
    }

    @PostMapping("/users/update")
    public String updateUser(@RequestBody User_info user) {
        service.updateUser(user);
        return "redirect:/users";
    }

    @GetMapping("/users/delete/{email}")
    public String deleteUser(@PathVariable String email) {
        service.deleteUser(email);
        return "redirect:/users";
    }
}
