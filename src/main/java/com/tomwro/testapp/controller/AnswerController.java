package com.tomwro.testapp.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tomwro.testapp.entity.Answer;
import com.tomwro.testapp.service.AnswerService;

@Controller
@RequestMapping("/answers")
public class AnswerController {
	
	@Autowired
	private AnswerService answerService;

	@GetMapping()
	public String getAllAnswers(Model theModel)
	{
		List<Answer> answers = answerService.getAnswers();
		
		theModel.addAttribute("answers",answers);
		
		return "answer-list";
	}
	
	@GetMapping("/showFormForAdd")
	public String showFormForAdd(
			@RequestParam(name="id" ,required=false)Integer theId,
			Model theModel
			)
	{	
		Answer theAnswer = new Answer();
		if(theId != null)
		{
			theAnswer.setQuestionId(theId);
		}
		
		theModel.addAttribute("answer",theAnswer);
		return "answer-form";
	}
	
	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate(
			@RequestParam("answerId") int theId,
			Model theModel
			)
	{
		Answer theAnswer = answerService.getAnswer(theId);
				
		theModel.addAttribute("answer",theAnswer);
				
		return "answer-form";
	}
	
	
	@PostMapping("/saveAnswer")
	public String saveAnswer(@ModelAttribute("answer") Answer theAnswer)
	{
		answerService.saveAnswer(theAnswer);
		return "redirect:/questions/showFormForUpdate?questionId=" +theAnswer.getQuestion().getId();
	}
	
	@GetMapping("/delete")
	public String deleteAnswer(@RequestParam("answerId") int theId)
	{
		answerService.deleteAnswer(theId);
		return "redirect:/answers";
	}
	
	
	@GetMapping("/check")
	public String checkAnswers(
			@RequestParam Map<String,String> allRequestParams, 
			ModelMap model)
	{
		System.out.println(allRequestParams.values());
		System.out.println(allRequestParams.keySet());
		
		Integer positiveAnswers = answerService.checkAnswers(allRequestParams.values());
		
		System.out.println(positiveAnswers);
		Integer max = 10;
		Double p = positiveAnswers.doubleValue();
		Double pr = (p/10)*100.0;
		model.addAttribute("result", positiveAnswers.toString());
		model.addAttribute("max", max.toString());
		model.addAttribute("pr", pr.toString());
		
		return "exam-result";
		

	}
	
	
}
