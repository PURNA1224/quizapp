package com.telusko.quizapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.telusko.quizapp.dao.QuestionDao;
import com.telusko.quizapp.model.Question;
import com.telusko.quizapp.service.QuestionService;

import ch.qos.logback.core.model.Model;

@RestController
@RequestMapping("question")
public class QuestionController {
	
//	@Autowired
//	QuestionService questionService;
//	
//	@Autowired
//	QuestionDao questionDao;
//	
//	@GetMapping("allQuestions")
//	public List<Question> getAllQuestions() {
//		return questionService.getAllQuestions();
//	}
//	
//	@GetMapping("category/{cat}")
//	public ResponseEntity<List<Question>> getQuestionsByCategory(@PathVariable("cat") String category){
//		return questionService.getQuestionsByCategory(category);
//	}
//	
//	@PostMapping("addQuestionFromUi") 
//	public ResponseEntity<String> addQuestion(@RequestParam String questionTitle, @RequestParam String options, @RequestParam String rightAnswer, @RequestParam String difficultyLevel, @RequestParam String category){
//		Question question = new Question();
//		question.setQuestionTitle(questionTitle);
//		String[] optionsList = options.split(",");
//		question.setOption1(optionsList[0]);
//		question.setOption2(optionsList[1]);
//		question.setOption3(optionsList[2]);
//		question.setOption4(optionsList[3]);
//		question.setRightAnswer(rightAnswer);
//		question.setDifficultylevel(difficultyLevel);
//		question.setCategory(category);
//		return questionService.addQuestion(question);
//		
//		
//	}
//	
//	@GetMapping("getQuestionById/{id}")
//	public ResponseEntity<Question> getQuestionById(@PathVariable Integer id){
//		return questionService.getQuestionsById(id);
//		
//	}
//	
//	
//	
//	@GetMapping("removeQuestion/{id}")
//	public ResponseEntity<String> removeQuestion(@PathVariable() Integer id) {
//		return questionService.removeQuestion(id);
//	}
//	
//	@PostMapping("updateQuestion/{id}")
//	public ResponseEntity<String> updateQuestion(@RequestBody Question question, @PathVariable() Integer id) {
//		return questionService.updateQuestion(id, question);
//	}
}
