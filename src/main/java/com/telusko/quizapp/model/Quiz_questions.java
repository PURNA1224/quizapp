package com.telusko.quizapp.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Quiz_questions {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer quiz_questions_pkey;
	private Integer quiz_id;
	private Integer questions_id;
	
	
	public Quiz_questions() {
		super();
	}
	public Quiz_questions(Integer quiz_questions_pkey, Integer quiz_id, Integer questions_id) {
		super();
		this.quiz_questions_pkey = quiz_questions_pkey;
		this.quiz_id = quiz_id;
		this.questions_id = questions_id;
	}
	public Integer getQuiz_questions_pkey() {
		return quiz_questions_pkey;
	}
	public void setQuiz_questions_pkey(Integer quiz_questions_pkey) {
		this.quiz_questions_pkey = quiz_questions_pkey;
	}
	public Integer getQuiz_id() {
		return quiz_id;
	}
	public void setQuiz_id(Integer quiz_id) {
		this.quiz_id = quiz_id;
	}
	public Integer getQuestions_id() {
		return questions_id;
	}
	public void setQuestions_id(Integer questions_id) {
		this.questions_id = questions_id;
	}
	
	
	
}
