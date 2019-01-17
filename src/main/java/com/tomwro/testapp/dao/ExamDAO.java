package com.tomwro.testapp.dao;

import java.util.List;

import com.tomwro.testapp.entity.Exam;


public interface ExamDAO {
	
	public List<Exam> getExams();

	public void saveExam(Exam theCustomer);

	public Exam getExam(int theId);

	public void deleteExam(int theId);


}
