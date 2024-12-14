package com.telusko.quizapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.telusko.quizapp.dao.QuestionDao;
import com.telusko.quizapp.service.QuizService;



@Controller
public class CreateQuizController {
	
	@Autowired
	QuizService quizService;
	
	@Autowired
	QuestionDao questionDao;
	
	@RequestMapping("quizCreatedPage")
	public String quizCreatedPage(@RequestParam(required=false) Integer quizId, Model m) {
		m.addAttribute("quizId", quizId);
		return "views/createQuiz/QuizCreatedPage.jsp";
	}
	
	@RequestMapping("createQuizs")
	public String createQuiz(@RequestParam String quizTitle, @RequestParam String category, @RequestParam Integer numQuestions, Model m, RedirectAttributes redirectAttributes) {
		Integer quizId = quizService.createQuiz(category, numQuestions, quizTitle).getBody();
		redirectAttributes.addAttribute("quizId", quizId);
		return "redirect:/quizCreatedPage";
	}
	
	
}
