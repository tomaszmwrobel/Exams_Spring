package com.tomwro.testapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@GetMapping("/")
	public String sayHello()
	{
		return "home";
	}
	
	@GetMapping("/test")
	public String testJsp()
	{
		return "test";
	}

}
