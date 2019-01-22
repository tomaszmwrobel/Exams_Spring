package com.tomwro.testapp.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
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
		.antMatchers("/exams/**","/questions/**","/answers/**").hasAnyRole("ADMIN","USER","TEST")
		.antMatchers("/api/**").hasAnyRole("ADMIN")
		.and()
		.csrf().ignoringAntMatchers("exams/makeExam")
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


	@Override
	public void configure(WebSecurity web) throws Exception {
		
		web.ignoring().antMatchers("/exams/makeExam", "/answers/check"); //Enable for testing app
	}

}
