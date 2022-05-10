package com.example.dao;

import java.util.List;

import com.example.domain.CleaningRequestVO;

public interface CleaningDAO {
	public void cleangingInsert(CleaningRequestVO vo);
	public List<CleaningRequestVO> cleanList();
	public CleaningRequestVO cleanRead(int crno);
}
