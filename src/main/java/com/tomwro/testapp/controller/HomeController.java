package com.tomwro.testapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@GetMapping("/")
	public String homePage()
	{
		return "home";
	}
	
	@GetMapping("/test")
	public String testJsp()
	{
		return "test";
	}
	
	@GetMapping("/admin")
	public String adminPanel()
	{
		return "admin-panel";
	}
	

}
