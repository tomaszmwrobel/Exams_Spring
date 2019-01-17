package com.tomwro.testapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tomwro.testapp.dao.ExamDAO;
import com.tomwro.testapp.entity.Exam;

@Service
public class ExamServiceImpl implements ExamService {

	@Autowired
	private ExamDAO examDAO;

	@Override
	@Transactional
	public List<Exam> getExams() {
		
		return examDAO.getExams();
	}

	@Override
	@Transactional
	public void saveExam(Exam theExam) {
		examDAO.saveExam(theExam);
		
	}

	@Override
	@Transactional
	public Exam getExam(int theId) {

		return examDAO.getExam(theId);
	}

	@Override
	@Transactional
	public void deleteExam(int theId) {
		examDAO.deleteExam(theId);
		
	}
	
	

}
