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

import com.tomwro.testapp.entity.Exam;
import com.tomwro.testapp.service.ExamService;

@Controller
@RequestMapping("/exams")
public class ExamController {
	
	@Autowired
	private ExamService examService;
	
	
	@GetMapping()
	public String examslist(Model theModel)
	{
		List<Exam> exams = examService.getExams();
		
		
		
		theModel.addAttribute("exams",exams);
		
		return "exams-list";
	}
	@GetMapping("/examsUser")
	public String exmasListUser(Model theModel)
	{
		List<Exam> exams = examService.getExams();
		theModel.addAttribute("exams",exams);
		
		return "exams-users";
	}
	
	@GetMapping("/showFormForAdd")
	public String showFormForAdd(Model theModel)
	{
		Exam theExam = new Exam();
		
		theExam.setUserId(1); // default value for Admin // future development
		theExam.setCode("test");
		theModel.addAttribute("exam",theExam);
		
		return "exam-form";
	}
	
	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate(
			@RequestParam("examId") int theId,
			
			Model theModel
			)
	{
		Exam theExam = examService.getExam(theId);
		
		theModel.addAttribute("exam",theExam);
		
		
		
		return"exam-form";
	}
	@GetMapping("/showFormForUpdateId")
	public String showFormForUpdateBack(
				@RequestParam ("exam.id")int theId,
				Model theModel)
	{
		return"redirect:/exams/showFormForUpdate?examId="+theId;
	}
	
	
	@PostMapping("/saveExam")
	public String saveExam(@ModelAttribute("exam") Exam theExam)
	{
		
		theExam.setPositiveResult(5);
		examService.saveExam(theExam);
		return "redirect:/exams";
	}
	
	@GetMapping("/delete")
	public String deleteExam(@RequestParam("examId") int theId)
	{
		examService.deleteExam(theId);
		return"redirect:/exams";
	}
	
	@GetMapping("/makeExam")
	public String makeExam(
			@RequestParam("examId") int theId,
			Model theModel
			)
	{
		Exam theExam = examService.getExam(theId);
		
		theModel.addAttribute("exam",theExam);
		
		
		
		return "exam-make";
	}
	
	@GetMapping("questions/check")
	public String checkAnswers(
			@RequestParam Map<String,String> allRequestParams, 
			ModelMap model)
	{
		return "redirect:/questions";
	
		
	}
	
	
	

}
