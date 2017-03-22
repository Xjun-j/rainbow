package com.rainbow.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rainbow.model.user.User;
import com.rainbow.service.user.UserService;

@Controller
@RequestMapping("/")
public class HomeController {
	
	@Autowired
	private UserService userService;
	
	
	//默认跳到登录页
    @RequestMapping("")
    public String home(){
        return "login";
    }
    
    @RequestMapping("/login")
    public String login(){
        return "login";
    }
    
    @RequestMapping("/saveUser")
    @ResponseBody
    public String saveUser(){
//        User user = new User();
//        user.setUsername("test002");
//        user.setEmail("test@12345.com");
//        user.setCreateTime(new Date());
//        int result = userService.save(user);
//        System.out.println("int："+result);
        return "index";
    }
    
    @RequestMapping("/updateUser")
    @ResponseBody
    public String updateUser(){
//        User user = new User();
//        user.setId(2);
//        user.setUsername("test002_update2");
//        user.setEmail("test@12345677.com");
//        user.setUpdateTime(new Date());
//        userService.update(user);
//        System.out.println("update success");
        return "index";
    }
    
    @RequestMapping("/userlist")
    @ResponseBody
    public List<User> userNames(){
    	return userService.getAllUsers();
    }
}