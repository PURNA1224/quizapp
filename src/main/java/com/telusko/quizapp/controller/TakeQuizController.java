package com.telusko.quizapp.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.telusko.quizapp.dao.QuizDao;
import com.telusko.quizapp.model.Quiz;
import com.telusko.quizapp.model.Response;
import com.telusko.quizapp.service.QuizService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class TakeQuizController {
	
	@Autowired
	private QuizDao quizDao;
	
	@Autowired
	QuizService quizService;
	
	@GetMapping("/takeQuizById")
	public String takeQuizById(@RequestParam String participantName, @RequestParam String rollNumber, @RequestParam String collegeName, @RequestParam Integer quizId, Model m) {
		Quiz presentQuiz = quizDao.findById(quizId).get();
//		List<List<String>> options = null;
//		for(Question q: presentQuiz.getQuestions()) {
//			List<String> presentOptions = new ArrayList<>();
//			presentOptions.add(q.getOption1());
//			presentOptions.add(q.getOption2());
//			presentOptions.add(q.getOption3());
//			presentOptions.add(q.getOption4());
//			options.add(presentOptions);
//		}
		Integer numQ = presentQuiz.getQuestions().size();
		m.addAttribute("presentQuiz", presentQuiz);
		m.addAttribute("participantName", participantName);
		m.addAttribute("collegeName", collegeName);
		m.addAttribute("rollNumber", rollNumber);
		m.addAttribute("numQ", numQ);
		return "views/takeQuiz/FinalQuiz.jsp";
		
	}
	
	@PostMapping(value="/calculatingResult")
	public String calculateResult(HttpServletRequest request, Model m) {
		List<Response> responses = new ArrayList<>();
		String[] questionIds = request.getParameterValues("questionId");
		for(String qid: questionIds) {
			Response response = new Response();
			response.setId(Integer.parseInt(qid));
			response.setResponse(request.getParameter("q"+qid));
			responses.add(response);
		}
		Integer score = quizService.calculateResult(Integer.parseInt(request.getParameter("quizId")), responses).getBody();
		m.addAttribute("score", score);
		return "views/takeQuiz/QuizResultPage.jsp";
	}
}
