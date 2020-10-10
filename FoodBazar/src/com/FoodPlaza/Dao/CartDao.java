package com.FoodPlaza.Dao;

import java.util.List;

import com.FoodPlaza.Pojo.Cart;

public interface CartDao
{
    boolean addToCart(Cart c);
    List<Cart> showCart(String email);
    boolean deleteCartById(int CartId);
    boolean clearCart(String email);
    boolean getCartById(String email);
}
