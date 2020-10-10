package com.FoodPlaza.Dao;

import java.util.List;

import com.FoodPlaza.Pojo.Order;

public interface OrderDao 
{
	boolean placeOrder(String email,String foodName,double price,int cartId);
	List<Order> showOrder(String email);

}
