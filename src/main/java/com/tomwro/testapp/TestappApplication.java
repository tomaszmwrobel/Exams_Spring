package com.tomwro.testapp;



import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.PropertySource;


@SpringBootApplication
@ComponentScan("com.tomwro.testapp")
@PropertySource("classpath:application.properties")
public class TestappApplication 
{
	
	public static void main(String[] args) {
		SpringApplication.run(TestappApplication.class, args);
	}
	
	

}

