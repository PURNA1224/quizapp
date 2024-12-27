package com.telusko.quizapp.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.telusko.quizapp.model.MyUser;


public interface MyUserRepository extends JpaRepository<MyUser, Long>{
	Optional<MyUser> findByUsername(String username);
}
