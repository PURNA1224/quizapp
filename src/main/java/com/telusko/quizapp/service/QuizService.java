package com.telusko.quizapp.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.telusko.quizapp.dao.QuestionDao;
import com.telusko.quizapp.dao.QuizDao;
import com.telusko.quizapp.dao.QuizQuestionDao;
import com.telusko.quizapp.model.Question;
import com.telusko.quizapp.model.QuestionWrapper;
import com.telusko.quizapp.model.Quiz;
import com.telusko.quizapp.model.Response;

@Service
public class QuizService {
	
	@Autowired
	QuizDao quizDao;
	
	@Autowired
	QuestionDao questionDao;
	
	@Autowired
	QuizQuestionDao quizQuestionDao;

	public ResponseEntity<Integer> createQuiz(String category, Integer numQ, String title) {
		
		List<Question> questions = questionDao.findRandomQuestionsByCategory(category, numQ);
		
		Quiz quiz = new Quiz();
		quiz.setTitle(title);
		quiz.setQuestions(questions);
		int id = quizDao.save(quiz).getId();
		
		
		return new ResponseEntity<>(id, HttpStatus.CREATED);
	}

	public ResponseEntity<List<QuestionWrapper>> getQuizQuestions(Integer id) {
		Optional<Quiz> quiz = quizDao.findById(id);
		List<Question> questionsFromDB = quiz.get().getQuestions();
		List<QuestionWrapper> questionsForUser = new ArrayList<>();
		
		for(Question q: questionsFromDB) {
			QuestionWrapper qw = new QuestionWrapper(q.getId(), q.getQuestionTitle(), q.getOption1(), q.getOption2(), q.getOption3(), q.getOption4());
			questionsForUser.add(qw);
		}
		return new ResponseEntity<>(questionsForUser, HttpStatus.OK);
	}

	public ResponseEntity<Integer> calculateResult(Integer id, List<Response> responses) {
		Quiz quiz = quizDao.findById(id).get();
		List<Question> questions = quiz.getQuestions();
		int result = 0;
		int i = 0;
		
		for(Response r: responses) {
			if(r.getResponse().equals(questions.get(i).getRightAnswer()))
				result++;
			i++;
		}
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	public ResponseEntity<String> UpdateQuizQuestionNumbersFromQuestionService(int questionId) {
		List<Quiz> quiz = quizDao.findAll();
		if(!quiz.isEmpty()) {
			for(Quiz presentQuiz:quiz) {
				List<Question> presentQuizQuestions = presentQuiz.getQuestions();
				if(!presentQuizQuestions.isEmpty()) {
					for(Question presentQuizQuestion: presentQuizQuestions) {
						if(presentQuizQuestion.getId()==questionId) {
		//					quizQuestionDao.deleteByQQId(questionId, presentQuiz.getId());
							quizQuestionDao.deleteByQQId(presentQuiz.getId(), questionId);
							quizDao.deleteById(presentQuiz.getId());
		//					this.createQuiz(presentQuizQuestion.getCategory(), 5, presentQuiz.getTitle());
						}
					}
				}
			}
		}
		return new ResponseEntity<>("Success", HttpStatus.OK);
	}
}
