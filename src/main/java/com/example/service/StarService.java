package com.example.service;

import java.util.HashMap;
import java.util.List;

import com.example.domain.StarVO;

public interface StarService {
	public void updatehelpcount(int rid);
	public void updatehelpcountcancel(int rid);
	public double helpcount(int rid);
	public void updateRatingAvg(int pno);
	
}
