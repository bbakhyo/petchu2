package com.example.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.ReserveVO;
import com.example.domain.ServiceVO;


@Repository
public class HoschoolDAOImpl implements HoschoolDAO{
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.HoschoolMapper";

//	@Override
//	public List<ServiceVO> list(Criteria cri) {
//		return session.selectList(namespace + ".list", cri);
//	}

	/*@Override
	public List<ReserveVO> list(Criteria cri,String checkin, String checkout) {
		HashMap<String, Object> map = new HashMap<>();

		map.put("cri", cri);
		map.put("checkin", checkin);
		map.put("checkout", checkout);
		System.out.println("..............tetetetest."+cri);
		return session.selectList(namespace + ".list", map);
	}*/
	@Override
	public ServiceVO read(int scno) {
		return session.selectOne(namespace + ".read", scno);
	}

	@Override
	public void insert(ServiceVO vo) {
		session.insert(namespace + ".insert", vo);
		
	}

	@Override
	public void update(ServiceVO vo) {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int scno) {
		session.update(namespace + ".serviceDelete", scno);
		
	}
	@Override
	public List<ServiceVO> myList(String id) {
		return session.selectList(namespace + ".myList", id);
	}
	@Override
	public void addinfo(int sno) {
		session.insert(namespace+".addinfo", sno);
	}
	@Override
	public int chkscno() {
		return session.selectOne(namespace + ".chkscno");
	}
	@Override
	public void userDelete(String id) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public List<ReserveVO> list(ReserveVO vo) {
		return session.selectList(namespace + ".list", vo);
	}

	

}
