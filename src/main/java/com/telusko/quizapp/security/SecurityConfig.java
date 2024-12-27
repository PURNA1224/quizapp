package com.telusko.quizapp.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	@Autowired
	private MyUserDetailService userDetailsService;
	
	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {
		return httpSecurity
				.csrf(httpSecurityCsrfConfigurer -> httpSecurityCsrfConfigurer.disable())
				.authorizeHttpRequests(registry -> {
					registry.requestMatchers("/register/**").permitAll();
					registry.requestMatchers("/**").hasRole("USER");
					registry.anyRequest().authenticated();
				})
				.formLogin(httpSecurityFormLoginConfigurer -> {
					httpSecurityFormLoginConfigurer.permitAll();
				})
				.build();
	}
	
//	@Bean
//	public UserDetailsService userDetailsService() {
//		UserDetails normalUser = User.builder()
//				.username("Purna")
//				.password("$2a$12$JgN2RVg4g2eBCAG3O/jiVuYK890o5ulAYUEhuXL0QArrrlyWKWHia")
//				.roles("USER")
//				.build();
//		
//		UserDetails adminUser = User.builder()
//				.username("admin")
//				.password("$2a$12$gEWb88AbvjX4Jd7xz6tK6.xN2S0jNtMWLkkjYQ691d68BTpKoG3PK")
//				.roles("ADMIN, USER")
//				.build();
//		return new InMemoryUserDetailsManager(normalUser, adminUser);
//	}
	
	@Bean
	public UserDetailsService userDetailsService() {
		return userDetailsService;
	}
	
	@Bean 
	public AuthenticationProvider authentiactionProvider() {
		DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
		provider.setUserDetailsService(userDetailsService);
		provider.setPasswordEncoder(passwordEncoder());
		return provider;
	}
	
	@Bean 
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
