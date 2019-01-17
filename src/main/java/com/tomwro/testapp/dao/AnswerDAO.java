package com.tomwro.testapp.dao;

import java.util.List;

import com.tomwro.testapp.entity.Answer;

public interface AnswerDAO {
	
	public List<Answer> getAnswers();
	
	public void saveAnswer(Answer theAnswer);
	
	public Answer getAnswer(int theId);
	
	public void deleteAnswer(int theId);
	
	

}
