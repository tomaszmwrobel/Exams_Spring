package com.tomwro.testapp.dao;

import java.util.List;

import com.tomwro.testapp.entity.Question;

public interface QuestionDAO {
	
	public List<Question> getQuestions();
	
	public void saveQuestion(Question theQuestion);
	
	public Question getQuestion(int theId);
	
	public void deleteQuestion(int theId);

}
