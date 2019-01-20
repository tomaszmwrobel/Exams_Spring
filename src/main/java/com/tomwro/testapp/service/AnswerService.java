package com.tomwro.testapp.service;

import java.util.Collection;
import java.util.List;

import com.tomwro.testapp.entity.Answer;

public interface AnswerService {
	
	public List<Answer> getAnswers();
	
	public void saveAnswer(Answer theAnswer);
	
	public Answer getAnswer(int theId);
	
	public void deleteAnswer(int theId);

	public int checkAnswers(Collection<String> values);

}
