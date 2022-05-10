package com.example.dao;

import java.util.Date;
import java.util.List;

import com.example.domain.ReserveVO;

public interface ReserveDAO {
	public List<ReserveVO> list(String id);
	public List<ReserveVO> oldlist(String id);
	public void insert(ReserveVO vo);
	public ReserveVO read(int rno);
	public List<ReserveVO> checkDateList(String checkin, String checkout);
	public void updateReserve(ReserveVO vo);
	public List<ReserveVO> comList(String id);
	public List<ReserveVO> comOldlist(String id);
}
