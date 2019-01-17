package com.tomwro.testapp.service;

import java.util.List;

import com.tomwro.testapp.entity.Question;

public interface QuestionService {

	public List<Question> getQuestions();
	
	public void saveQuestion(Question theQuestion);
	
	public Question getQuestion(int theId);
	
	public void deleteQuestion(int theId);
}
