package com.FoodPlaza.Dao;

public interface loginDao 
{
    boolean CustomerLogin(String username,String password);
    boolean AdminLogin(String username,String password);
    
}
