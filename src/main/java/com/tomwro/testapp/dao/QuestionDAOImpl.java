package com.tomwro.testapp.dao;

import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tomwro.testapp.entity.Question;

@Repository
public class QuestionDAOImpl implements QuestionDAO {

	private EntityManager entityManager;
	
	@Autowired
	QuestionDAOImpl(EntityManager theEntityManager)
	{
		this.entityManager = theEntityManager;
	}
	
	@Override
	public List<Question> getQuestions() {
		
		Session currentSession = entityManager.unwrap(Session.class);
		
		Query<Question> query =
				currentSession.createQuery("from Question",Question.class);
		
		List<Question> questions = query.getResultList();
		
		return questions;
	}

	@Override
	public void saveQuestion(Question theQuestion) {

		Session currentSession = entityManager.unwrap(Session.class);
		
		System.out.println("test");
		
		currentSession.saveOrUpdate(theQuestion);
	}

	@Override
	public Question getQuestion(int theId) {

		Session currentSession = entityManager.unwrap(Session.class);
		return currentSession.get(Question.class, theId);
	}

	@Override
	public void deleteQuestion(int theId) {
	
		Session currentSession = entityManager.unwrap(Session.class);
		
		@SuppressWarnings("rawtypes")
		Query theQuery = currentSession.createQuery("delete from Question where id=:questionId");
		
		theQuery.setParameter("questionId", theId);
		theQuery.executeUpdate();

	}

}
