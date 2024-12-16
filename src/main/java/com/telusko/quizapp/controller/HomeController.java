package com.telusko.quizapp.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.telusko.quizapp.dao.QuestionDao;
import com.telusko.quizapp.model.Question;
import com.telusko.quizapp.service.QuestionService;

@Controller
public class HomeController {
	
	@Autowired
	QuestionDao questionDao;
	
	@Autowired
	QuestionService questionService;
	
	
	@GetMapping("/")
	public String home() {
		return "views/HomePage.html";
	}
	
	@RequestMapping("createQuestion")
	public String addME() {
		return "views/CreateQuestion.html";
	}
	
	@RequestMapping("readQuestion")
	public String readQuestions() {
		return "views/ReadQuestions.html";
	}
	
	
	@RequestMapping(value="readQuestionByFilter")
	public String readQuestionsByFilter(@RequestParam(required=false) String category, Model m) {
		List<Question> questionsList = questionService.getAllQuestions();
		List<Question> questions= null;
		if(category != null && !category.isEmpty()) {
			questions = questionsList.stream()
			.filter(q -> q.getCategory()!= null && q.getCategory().equalsIgnoreCase(category))
			.collect(Collectors.toList());
		}
		m.addAttribute("questions",questions);
		return "views/ReadQuestionJsp.jsp";
	}
	
	@GetMapping(value="addQuestionToDB")
	public String addQuestionToDB(@ModelAttribute Question q, Model m) {
		questionService.addQuestion(q);
		return "views/AddQuestionSuccessPage.jsp";
	}
	
	@GetMapping("updateQuestion")
	public String updateQuestion(@RequestParam int id, Model m) {
		m.addAttribute("question", questionService.getQuestionsById(id).getBody());
		return "views/QuestionUpdatePage.jsp";
	}
	
	@RequestMapping("updateQuestionToDB")
	public String updateQuestionToDB(@ModelAttribute Question q, Model m) {
		questionService.updateQuestion(q.getId(), q);
		m.addAttribute("questions", questionService.getQuestionsByCategory(q.getCategory()).getBody());
		return "views/ReadQuestionJsp.jsp";
	}
	
	@GetMapping("deleteQuestion")
	public String deleteQuestion(@RequestParam("id") int questionId, @RequestParam String category, RedirectAttributes redirectAttributes) {
		questionService.removeQuestion(questionId);
		redirectAttributes.addAttribute("category", category);
		return "redirect:/readQuestionByFilter";
	}
	
//	@GetMapping("/checkForValidCategory")
//	public String validCategoryOrNot(@RequestParam String category, Model model) {
//		if(questionService.getQuestionsByCategory(category)!=null) {
//			model.addAttribute("checkCat", 1);
//		}
//		else {
//			model.addAttribute("checkCat", 0);
//		}
//		return "
//	}
	
}
