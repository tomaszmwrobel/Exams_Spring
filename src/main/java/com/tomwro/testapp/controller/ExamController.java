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
	
	@GetMapping("/showFormForAdd")
	public String showFormForAdd(Model theModel)
	{
		Exam theExam = new Exam();
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
	
	@PostMapping("/saveExam")
	public String saveExam(@ModelAttribute("exam") Exam theExam)
	{
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
	
	
	

}
