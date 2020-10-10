package com.FoodPlaza.Pojo;

public class Order
{
    private int orderId;
    private double totalBill;
    private String date,email;
    
    
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public double getTotalBill() {
		return totalBill;
	}
	public void setTotalBill(double totalBill) {
		this.totalBill = totalBill;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", totalBill=" + totalBill + ", date=" + date + ", email=" + email + "]";
	}
    
    
}
