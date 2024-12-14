package com.telusko.quizapp.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.telusko.quizapp.model.Question;

@Repository
public interface QuestionDao extends JpaRepository<Question, Integer>{
	List<Question> findByCategory(String category);
	
	@Modifying(clearAutomatically = true)
	@Transactional
	@Query(value="Update question set category=:category, difficultylevel =:difficultylevel, option1=:option1, option2=:option2, option3=:option3, option4=:option4, question_title=:questionTitle, right_answer=:rightAnswer  where id=:id", nativeQuery = true)
	void updateById(Integer id, String questionTitle, String option1, String option2, String option3, String option4,
			String rightAnswer, String category, String difficultylevel);
	
	@Query(value="SELECT * FROM question q where q.category=:category ORDER BY RANDOM() LIMIT :numQ", nativeQuery= true)
	List<Question> findRandomQuestionsByCategory(String category, Integer numQ);
}
