package com.tomwro.testapp.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	private DataSource securityDataSource;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {

		//use jdbc
		
		auth.jdbcAuthentication().dataSource(securityDataSource);
	}
	
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.authorizeRequests()
		.antMatchers("/exams/**").hasAnyRole("ADMIN","USER")
		.antMatchers("/exams/makeExam").anonymous()
		.antMatchers("/questions/**").hasAnyRole("ADMIN","USER")
		.antMatchers("/answers/**").hasAnyRole("ADMIN","USER")
		.antMatchers("/answers/check").anonymous()
		.antMatchers("/api/**").hasAnyRole("ADMIN")
		.and()
		.formLogin()
			.loginPage("/login-page")
			.loginProcessingUrl("/authenticateTheUser")
			.permitAll()
		.and()
			.logout()
			.permitAll()
		.and()
			.exceptionHandling().accessDeniedPage("/access-denied");
			
		
		
		//super.configure(http);
	}

}
