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
	public String showFormForAdd(Model theModel)
	{
		Answer theAnswer = new Answer();
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
		return "redirect:/answers";
	}
	
	@GetMapping("/delete")
	public String deleteAnswer(@RequestParam("answerId") int theId)
	{
		answerService.deleteAnswer(theId);
		return "redirect:/answers";
	}
	
}
