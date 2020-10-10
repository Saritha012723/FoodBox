package com.FoodPlaza.Dao;


import java.util.List;

import com.FoodPlaza.Pojo.Food;


public interface FoodDao 
{
	boolean addFood(Food f);
	boolean updateFood(Food f);
	boolean updatePrice(String Foodname,double price);
	boolean deleteFoodById(int FoodId);
	Food getFoodById(int FoodId);
	
	List<Food> getAllFood();
	List<Food> getFoodByCategory(String FoodCategory);

}

