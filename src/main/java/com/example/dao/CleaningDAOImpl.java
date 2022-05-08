package com.example.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.CleaningRequestVO;

@Repository
public class CleaningDAOImpl implements CleaningDAO{

	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.CleaningRequestMapper";
	
	@Override
	public void cleangingInsert(CleaningRequestVO vo) {
		session.insert(namespace + ".cleanInsert", vo);
		
	}

	@Override
	public List<CleaningRequestVO> cleanList() {
		return session.selectList(namespace + ".cleanList") ;
	}

	@Override
	public CleaningRequestVO cleanRead(int crno) {
		return session.selectOne(namespace + ".cleanRead", crno);
	}

}
