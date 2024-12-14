package com.telusko.quizapp.model;

public class Response {
	
	private Integer id;
	private String response;
	
	public Response() {
		super();
	}
	public Response(Integer id, String right_response) {
		super();
		this.id = id;
		this.response = right_response;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getResponse() {
		return response;
	}
	public void setResponse(String right_response) {
		this.response = right_response;
	}
}
