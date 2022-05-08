package com.example.dao;

import java.util.List;

import com.example.domain.LessonRequestVO;

public interface LessonDAO {
	public void lessonInsert(LessonRequestVO vo);
	public List<LessonRequestVO> lessonList();
	public LessonRequestVO lessonRead(int lrno);
}
