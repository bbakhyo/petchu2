package com.example.dao;

import java.util.List;

import com.example.domain.UserVO;

public interface UserDAO {
	public void insert(UserVO vo);

	public UserVO read(String id);

	public List<UserVO> list();

	public void update(UserVO vo);

	public void updatepass(UserVO vo);
	
	public void userDelete(String id);
	
	public void updatePoint(int amount, String id);
 
	public int pointRead(String id);
	
	public String typechk(String id);
	
	public int cashRead(String id);
	
	public void updateCash(int amount, String id);
}