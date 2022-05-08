package com.example.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.dao.ServiceEstimateDAO;
import com.example.dao.StarDAO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.ServiceEstimateVO;
import com.example.domain.StarVO;
import com.example.service.StarService;

@Controller
@RequestMapping("/star")
public class StarController { //���� ��Ʈ�ѷ�
	@Autowired
	StarDAO sdao;
	
	@Autowired
	StarService service;
		
	@Autowired
	ServiceEstimateDAO sedao;
	
	@RequestMapping(value = "/starinsert", method = RequestMethod.GET)
	public String slist(Locale locale, Model model) {
		return "star/starinsert";
	}
	
	@RequestMapping("/list")
	public String list(Locale locale, Model model) {
		return "star/list";
	}
	
	@RequestMapping("/list.json")
	@ResponseBody
	public HashMap<String, Object> listJson(){
		HashMap<String, Object> map=new HashMap<>();
		map.put("list", sdao.list());
		return map;
		
	}
	
	@RequestMapping(value="insert", method=RequestMethod.POST)
	@ResponseBody
	public void insert(StarVO vo){
		sdao.insert(vo);
		service.updateRatingAvg(vo.getPno());
	}
	
	@RequestMapping(value="delete", method=RequestMethod.POST)
	@ResponseBody
	public void delete(StarVO vo){
		sdao.delete(vo);
		service.updateRatingAvg(vo.getPno());
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	@ResponseBody
	public void update(StarVO vo){
		sdao.update(vo);
		service.updateRatingAvg(vo.getPno());
	}
	
	
	@RequestMapping(value="updatehelpcount", method=RequestMethod.POST)
	@ResponseBody
	public void updatehelpcount(int rid){
		sdao.updateHelpcount(rid);
	}
	
	@RequestMapping(value="updatehelpcountcancel", method=RequestMethod.POST)
	@ResponseBody
	public void updatehelpcountcancel(int rid){
		sdao.updateHelpcountCancel(rid);
	}
	
}
