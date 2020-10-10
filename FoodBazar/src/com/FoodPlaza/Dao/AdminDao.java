package com.FoodPlaza.Dao;


import com.FoodPlaza.Pojo.Admin;

public interface AdminDao
{
	    boolean addAdmin(Admin a);
	    boolean updateAdmin(Admin a);
	    boolean deleteAdmin(String adminEmail);
	    Admin getAdminById(String adminEmail);
	    Admin getAdminById(int adminId);
}
