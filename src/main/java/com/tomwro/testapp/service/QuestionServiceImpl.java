package com.tomwro.testapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tomwro.testapp.dao.QuestionDAO;
import com.tomwro.testapp.entity.Question;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	private QuestionDAO questionDAO;
	
	@Override
	@Transactional
	public List<Question> getQuestions() {
		
		return questionDAO.getQuestions();
	}

	@Override
	@Transactional
	public void saveQuestion(Question theQuestion) {

		questionDAO.saveQuestion(theQuestion);
	}

	@Override
	@Transactional
	public Question getQuestion(int theId) {

		return questionDAO.getQuestion(theId);
	}

	@Override
	@Transactional
	public void deleteQuestion(int theId) {

		questionDAO.deleteQuestion(theId);
	}

}
