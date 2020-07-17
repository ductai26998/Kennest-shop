package com.ductai.kennestshop.bo;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Order {
	private int id;
	private int productId;
	private int userId;
	private LocalDateTime time;
	private String payment;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public LocalDateTime getTime() {
		return time;
	}
	public void setTime(String time) {
		DateTimeFormatter myFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		this.time = LocalDateTime.parse(time, myFormat);
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	
}
