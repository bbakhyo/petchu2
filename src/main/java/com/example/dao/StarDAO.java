package com.example.dao;

import java.util.List;

import com.example.domain.RatingAvgDTO;
import com.example.domain.StarVO;

public interface StarDAO {
	public List<StarVO> list();
	public void insert(StarVO vo);
	public double helpcount(int rid);
	public void updateHelpcount(int rid);
	public void updateHelpcountCancel(int rid);
	public double RatingAvg(int pno);
	public int updateRating(StarVO vo);
	public void delete(StarVO vo);
	public void update(StarVO vo);
}
