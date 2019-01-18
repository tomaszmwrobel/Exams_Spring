package com.tomwro.testapp.entity;


import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="exams")
public class Exam {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="user_id")
	private int userId;
	
	@Column(name="code")
	private String Code;
	
	@OneToMany(mappedBy = "exam",
			cascade= {CascadeType.DETACH,CascadeType.MERGE,
					CascadeType.PERSIST,CascadeType.REFRESH})
	private List<Question> questions;
	
	@Column(name="positive_result")
	private int positiveResult;
	
	@Column(name="name")
	private String name;
	
	@Column(name="description")
	private String description;
	
	public Exam()
	{
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getCode() {
		return Code;
	}

	public void setCode(String code) {
		Code = code;
	}

	public List<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}

	public int getPositiveResult() {
		return positiveResult;
	}

	public void setPositiveResult(int positiveResult) {
		this.positiveResult = positiveResult;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void clearQuestions() {
		this.questions.clear();
		
	}
	
	
	
	

}
