package com.telusko.quizapp.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.telusko.quizapp.model.Quiz_questions;

@Repository
public interface QuizQuestionDao extends JpaRepository<Quiz_questions, Integer>{

	@Modifying(clearAutomatically = true)
	@Transactional
	@Query(value="Delete from quiz_questions where quiz_id =:quizId and questions_id =:questionId;", nativeQuery= true)
	void deleteByQQId(Integer quizId, Integer questionId);
	
}
