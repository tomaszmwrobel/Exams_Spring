package com.tomwro.testapp.dao;

import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import org.hibernate.Session;
import com.tomwro.testapp.entity.Answer;

@Repository
public class AnswerDAOImpl implements AnswerDAO {

	private EntityManager entityManager;
	
	
	@Autowired
	public AnswerDAOImpl(EntityManager theEntityManager)
	{
		this.entityManager=theEntityManager;
	}
	
	
	@Override
	public List<Answer> getAnswers() {
		Session currentSession = entityManager.unwrap(Session.class);
		
		Query<Answer> query
			= currentSession.createQuery("from Answer", Answer.class);
	
		List<Answer> answers = query.getResultList();
		
		return answers;
	}

	@Override
	public void saveAnswer(Answer theAnswer) {
		Session currentSession = entityManager.unwrap(Session.class);
		
		currentSession.saveOrUpdate(theAnswer);
		
	}

	@Override
	public Answer getAnswer(int theId) {
		
		Session currentSession = entityManager.unwrap(Session.class);
		
		return	currentSession.get(Answer.class,theId);
		
	}

	@Override
	public void deleteAnswer(int theId) {

		Session currentSession = entityManager.unwrap(Session.class);
		
		@SuppressWarnings("rawtypes")
		Query theQuery = currentSession.createQuery("delete from Answer where id=:answerId");
		theQuery.setParameter("answerId", theId);
		theQuery.executeUpdate();
		
	}

}
