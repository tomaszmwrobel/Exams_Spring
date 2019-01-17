package com.tomwro.testapp.dao;

import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tomwro.testapp.entity.Exam;

@Repository
public class ExamDAOImpl implements ExamDAO {
	
	private EntityManager entityManager;
	
	@Autowired
	public ExamDAOImpl(EntityManager theEntityManager)
	{
		this.entityManager=theEntityManager;
	}

	@Override
	public List<Exam> getExams() {
		
		Session currentSession = entityManager.unwrap(Session.class);
		//Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Exam> query = 
				currentSession.createQuery("from Exam", Exam.class);
		
		List<Exam> exams = query.getResultList();
		return exams;
	}

	@Override
	public void saveExam(Exam theExam) {
		Session currentSession = entityManager.unwrap(Session.class);
		currentSession.saveOrUpdate(theExam);
		
	}

	@Override
	public Exam getExam(int theId) {

		Session currentSession = entityManager.unwrap(Session.class);
		return currentSession.get(Exam.class, theId);
	}

	@Override
	public void deleteExam(int theId) {
		Session currentSession = entityManager.unwrap(Session.class);
		
		@SuppressWarnings("rawtypes")
		Query theQuery = currentSession.createQuery("delete from Exam where id=:examId");
		
		theQuery.setParameter("examId", theId);
		theQuery.executeUpdate();
		
	}

	
	

}
