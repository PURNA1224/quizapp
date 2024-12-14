package com.telusko.quizapp.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import com.telusko.quizapp.dao.QuestionDao;
import com.telusko.quizapp.dao.QuizDao;
import com.telusko.quizapp.dao.QuizQuestionDao;
import com.telusko.quizapp.model.Question;
import com.telusko.quizapp.model.QuestionWrapper;

@Component
public class QuestionService {

	@Autowired
	QuestionDao questionDao;
	
	@Autowired
	QuizService quizService;
	
	@Autowired
	QuizQuestionDao quizQuestionDao;
	
	public List<Question> getAllQuestions() {
		try {
			return questionDao.findAll();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return new ArrayList<>();
	}

	public ResponseEntity<List<Question>> getQuestionsByCategory(String cat) {
		try {
			return new ResponseEntity<>(questionDao.findByCategory(cat), HttpStatus.OK);			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<>(new ArrayList<>(), HttpStatus.BAD_REQUEST);
	}
	
	public ResponseEntity<Question> getQuestionsById(Integer id) {
		try {
			return new ResponseEntity<>(questionDao.findById(id).get(), HttpStatus.OK);			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<>(new Question(), HttpStatus.BAD_REQUEST);
	}

	public ResponseEntity<String> addQuestion(Question question) {
		try {
			questionDao.save(question);
			return new ResponseEntity<>("Success", HttpStatus.CREATED);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<>("Failed", HttpStatus.BAD_REQUEST);
	}

	public ResponseEntity<String> removeQuestion(int questionId) {
		try {
			quizService.UpdateQuizQuestionNumbersFromQuestionService(questionId);
			questionDao.deleteById(questionId);
			return new ResponseEntity<>("Deleted", HttpStatus.NO_CONTENT);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<>("Failed", HttpStatus.BAD_REQUEST);
	}

	public ResponseEntity<String> updateQuestion(Integer questionId, Question question) {
		try {
//			quizQuestionDao.deleteByQQIds()
			questionDao.updateById(questionId, question.getQuestionTitle(), question.getOption1(), question.getOption2(), question.getOption3(), question.getOption4(), question.getRightAnswer(), question.getCategory(), question.getDifficultylevel());
			return new ResponseEntity<>("Updated", HttpStatus.CREATED);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<>("Failed", HttpStatus.BAD_REQUEST);
	}


}
