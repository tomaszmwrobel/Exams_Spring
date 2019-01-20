package com.tomwro.testapp.entity;


import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="questions")
public class Question {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="category")
	private String category;
	
	@Column(name="content")
	private String content;
	
	
	@ManyToOne//(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
	@JoinColumn(name="exams_id")
	private Exam exam;
	
	
	@OneToMany(mappedBy = "question",
			cascade= {CascadeType.DETACH,CascadeType.MERGE,
					CascadeType.PERSIST,CascadeType.REFRESH})
	private List<Answer> allAnswers;
	
	@Column(name="count_correct_answers")
	private int countCorrectAnswers;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Exam getExam() {
		return exam;
	}

	public void setExam(Exam exam) {
		this.exam = exam;
	}

	public List<Answer> getAllAnswers() {
		return allAnswers;
	}

	public void setAllAnswers(List<Answer> allAnswers) {
		this.allAnswers = allAnswers;
	}

	public int getCountCorrectAnswers() {
		return countCorrectAnswers;
	}

	public void setCountCorrectAnswers(int countCorrectAnswers) {
		this.countCorrectAnswers = countCorrectAnswers;
	}
	
	public List<Answer> clearAnswer()
	{
		this.setAllAnswers(null);
		return this.getAllAnswers();
	}
	
	public void setExamId(int theId)
	{
		if(this.exam==null)
		{
			this.exam= new Exam();
		}
		this.exam.setId(theId);
	}

}
