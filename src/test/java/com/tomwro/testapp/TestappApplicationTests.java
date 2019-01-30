package com.tomwro.testapp;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.tomwro.testapp.controller.HomeController;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestappApplicationTests {

	@Test
	public void contextLoads() {
	}
	
	@Test
	public void testHomeController()
	{
		HomeController homeController = new HomeController();
		
		String result = homeController.homePage();
		
		assertEquals("home", result);
	}

}

