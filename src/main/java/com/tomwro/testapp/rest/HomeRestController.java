package com.tomwro.testapp.rest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

	@RestController()
	public class HomeRestController {
		
		@GetMapping("/api")
		public String sayHello()
		{
			return "Hello";
		}

	}

