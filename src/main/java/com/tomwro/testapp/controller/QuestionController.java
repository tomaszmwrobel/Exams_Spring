package com.tomwro.testapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tomwro.testapp.entity.Question;
import com.tomwro.testapp.service.QuestionService;


@Controller()
@RequestMapping("/questions")
public class QuestionController {
	
	@Autowired
	private QuestionService questionService;
	
	@GetMapping()
	public String questionsList(Model theModel)
	{
		List<Question> questions = questionService.getQuestions();	
		
		theModel.addAttribute("questions",questions);
		
		return "questions-list";
	}
	
	@GetMapping("/showFormForAdd")
	public String showFormForAdd(
			@RequestParam(name="id" ,required=false)Integer theId,
			@RequestParam(name="name" ,required=false)String examName,
			Model theModel)
	{
		System.out.println(theId);
		Question theQuestion = new Question();
		if(theId!=null)
		{
			
			theQuestion.setExamId(theId);
			theModel.addAttribute("examId", theId);
		}
		
		if(examName!=null)
		{
			theModel.addAttribute("examName",examName);
		}
		theModel.addAttribute("question",theQuestion);
		
		return "question-form";
	}
	
	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate(
			@RequestParam("questionId") int theId,
			Model theModel
			)
	{
		Question theQuestion = questionService.getQuestion(theId);
	
		
		theModel.addAttribute("question",theQuestion);
		
		return"question-form";
	}
	@GetMapping("/showFormForUpdateBack")
	public String showFormForUpdateBack(
				@RequestParam ("question.id")int theId,
				Model theModel)
	{
		return"redirect:/questions/showFormForUpdate?questionId="+theId;
	}
	
	
	
	@PostMapping("/saveQuestion")
	public String saveExam(@ModelAttribute("question") Question theQuestion)
	{
		theQuestion.setCountCorrectAnswers(1); //static value = temporary
		questionService.saveQuestion(theQuestion);
		return "redirect:/exams/showFormForUpdate?examId="+theQuestion.getExam().getId();
	}
	
	@GetMapping("/delete")
	public String deleteExam(@RequestParam("questionId") int theId)
	{
		questionService.deleteQuestion(theId);
		return"redirect:/questions";
	}
	
	@GetMapping("/check")
	public String checkOne(Model theModel)
	{
		Question theQuestion = questionService.getQuestion(1);
		
		theModel.addAttribute("questions2",theQuestion);
		
		Question theQuestion3 = questionService.getQuestion(6);
		
		theModel.addAttribute("questions3",theQuestion3);

		return "answer-question";
	}
	
	@GetMapping("/check/send")
	public String checkAnswers(
			@RequestParam("questions") List<Question> questions,
			
			Model theModel)
	{
		
		return "redirect:/questions";
	}
	
	

}
