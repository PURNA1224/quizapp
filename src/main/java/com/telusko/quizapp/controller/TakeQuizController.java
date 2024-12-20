package com.telusko.quizapp.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.telusko.quizapp.dao.QuizDao;
import com.telusko.quizapp.model.ComparingResponse;
import com.telusko.quizapp.model.Question;
import com.telusko.quizapp.model.Quiz;
import com.telusko.quizapp.model.Response;
import com.telusko.quizapp.service.QuestionService;
import com.telusko.quizapp.service.QuizService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class TakeQuizController {
	
	@Autowired
	private QuizDao quizDao;
	
	@Autowired
	QuestionService questionService;
	
	@Autowired
	QuizService quizService;
	
	@GetMapping("/takeQuizById")
	public String takeQuizById(@RequestParam String participantName, @RequestParam String rollNumber, @RequestParam String collegeName, @RequestParam Integer quizId, Model m) {
		Quiz presentQuiz = quizDao.findById(quizId).get();
		Integer numQ = presentQuiz.getQuestions().size();
		m.addAttribute("presentQuiz", presentQuiz);
		m.addAttribute("participantName", participantName);
		m.addAttribute("collegeName", collegeName);
		m.addAttribute("rollNumber", rollNumber);
		m.addAttribute("numQ", numQ);
		m.addAttribute("quizTitle", presentQuiz.getTitle());
		m.addAttribute("timeValue", 120000);
		return "views/takeQuiz/FinalQuiz.jsp";
	}
	
	@PostMapping(value="/calculatingResult")
	public String calculateResult(HttpServletRequest request, Model m) {
		List<Response> responses = new ArrayList<>();
		List<ComparingResponse> cr = new ArrayList<>();
		
		String[] questionIds = request.getParameterValues("questionId");
		for(String qid: questionIds) {
			Response response = new Response();
			response.setId(Integer.parseInt(qid));
			response.setResponse(request.getParameter("q"+qid));
			responses.add(response);
			
			Question qu = questionService.getQuestionsById(Integer.parseInt(qid)).getBody();
			ComparingResponse presentResponse = new ComparingResponse();
			presentResponse.setTitle(qu.getQuestionTitle());
			presentResponse.setUserAnswer(request.getParameter("q"+qid));
			presentResponse.setCorrectAnswer(qu.getRightAnswer());
			cr.add(presentResponse);
		}
		
		
		
		Integer score = quizService.calculateResult(Integer.parseInt(request.getParameter("quizId")), responses).getBody();
		m.addAttribute("score", score);
		m.addAttribute("participantName", request.getParameter("participantName"));
		m.addAttribute("rollNumber", request.getParameter("rollNumber"));
		m.addAttribute("numQuestions", request.getParameter("numQuestions"));
		m.addAttribute("quizTitle", request.getParameter("quizTitle"));
		m.addAttribute("responses", cr);
		return "views/takeQuiz/QuizResultPage.jsp";
	}
}
