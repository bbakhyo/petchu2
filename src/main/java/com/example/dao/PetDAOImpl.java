package com.example.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.PetVO;

@Repository
public class PetDAOImpl implements PetDAO{
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.PetMapper";
	
	@Override
	public List<PetVO> readPetList(String id) {
		return session.selectList(namespace + ".readPetList", id);
	}

	@Override
	public PetVO readPet(int pno) {
		return session.selectOne(namespace + ".readPet", pno);
	}

	@Override
	public void insertPet(PetVO vo) {
		session.insert(namespace + ".insertPet", vo);
	}

	@Override
	public void deletePet(int pno) {
		session.delete(namespace + ".deletePet", pno);
	}

	@Override
	public void updatePet(PetVO vo) {
		session.update(namespace + ".updatePet", vo);
		
	}

}
