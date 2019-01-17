package com.tomwro.testapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tomwro.testapp.dao.AnswerDAO;
import com.tomwro.testapp.entity.Answer;
@Service
public class AnswerServiceImpl implements AnswerService{

	@Autowired
	private AnswerDAO answerDAO;
	
	@Override
	@Transactional
	public List<Answer> getAnswers() {

		return answerDAO.getAnswers();
	}

	@Override
	@Transactional
	public void saveAnswer(Answer theAnswer) {
		answerDAO.saveAnswer(theAnswer);
		
	}

	@Override
	@Transactional
	public Answer getAnswer(int theId) {

		return answerDAO.getAnswer(theId);
	}

	@Override
	@Transactional
	public void deleteAnswer(int theId) {

		answerDAO.deleteAnswer(theId);
	}

}
