package com.example.dao;

import java.util.List;

import com.example.domain.ServiceEstimateVO;

public interface ServiceEstimateDAO {
	//�ߺ�üũ
	public int overlabCheck(ServiceEstimateVO vo);
	
	public int overlabCheck2(ServiceEstimateVO vo);
	
	public int overlabCheck3(ServiceEstimateVO vo);
	
	//�̿�
	public void binsert(ServiceEstimateVO vo);
	
	public List<ServiceEstimateVO> blist(int scno);
	
	//Ȩ Ŭ����
	public void cinsert(ServiceEstimateVO vo);
	
	
	//����
	public void linsert(ServiceEstimateVO vo);
	
	//���� �� ������ ����
	
	public List<ServiceEstimateVO> beautyViewList(int scno);
	public ServiceEstimateVO beautyViewRead(ServiceEstimateVO vo);
	
	public List<ServiceEstimateVO> cleaningViewList(int scno);
	public ServiceEstimateVO cleaningViewRead(ServiceEstimateVO vo);
	
	public List<ServiceEstimateVO> lessonViewList(int scno);
	public ServiceEstimateVO lessonViewRead(ServiceEstimateVO vo);
}
