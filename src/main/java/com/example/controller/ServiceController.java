package com.example.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.annotation.Nullable;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dao.BeautyDAO;
import com.example.dao.CleaningDAO;
import com.example.dao.LessonDAO;
import com.example.dao.ServiceCoDAO;
import com.example.dao.ServiceEstimateDAO;
import com.example.domain.BeautyRequestVO;
import com.example.domain.CleaningRequestVO;
import com.example.domain.LessonRequestVO;
import com.example.domain.ServiceCoVO;
import com.example.domain.ServiceEstimateVO;

@Controller
@RequestMapping("/service")
public class ServiceController {
	
	@Autowired
	BeautyDAO bdao;
	
	@Autowired
	CleaningDAO cdao;
	
	@Autowired
	LessonDAO ldao;
	
	@Autowired
	ServiceCoDAO scdao;
	
	@Autowired
	ServiceEstimateDAO sedao;
	
	@RequestMapping(value = "/request", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		model.addAttribute("pageName", "service/request.jsp");
		return "home";
	}
	
	//Beauty
	@RequestMapping(value ="/binsert", method = RequestMethod.POST)
	public String binsert(HttpSession session, Model model, BeautyRequestVO bvo){
		int count= bdao.beautyCount(session.getAttribute("id").toString());
		if(count >= 1){
			model.addAttribute("msg", "�̹� �ۼ��� ��û���� �ֽ��ϴ�. ����ó�� �� �ٽ� �õ����ּ���");
			model.addAttribute("pageName", "service/alert.jsp");
			return "/home";
		}else{
			bdao.beautyInsert(bvo);
		}
		return "redirect:request";
	}
	
	
	@RequestMapping("/blist.json")
	@ResponseBody
	public List<BeautyRequestVO> blistJson(){
		List<BeautyRequestVO> list=bdao.beautyList();
		return list;
	}
	
	@RequestMapping("/bread")
	public String beautyRead(Model model, int brno){
		model.addAttribute("bvo", bdao.beautyRead(brno));
		model.addAttribute("pageName", "service/beautyread.jsp");
		return "/home";
	}
	
	@RequestMapping("/bread.json")
	@ResponseBody
	public BeautyRequestVO beautyReadJson(int brno){
		BeautyRequestVO vo=bdao.beautyRead(brno);
		return vo;
	}
	
	
	//cleaning
	@RequestMapping(value ="/cinsert", method = RequestMethod.POST)
	public String cinsert(HttpSession session, Model model, CleaningRequestVO cvo){
		int count= cdao.cleaningCount(session.getAttribute("id").toString());
		if(count >= 1){
			model.addAttribute("msg", "�̹� �ۼ��� ��û���� �ֽ��ϴ�. ����ó�� �� �ٽ� �õ����ּ���");
			model.addAttribute("pageName", "service/alert.jsp");
			return "/home";
		}else{
			cdao.cleangingInsert(cvo);
			
		}
		
		return "redirect:request";
	}
	
	@RequestMapping("/clist.json")
	@ResponseBody
	public List<CleaningRequestVO> clistJson(){
		List<CleaningRequestVO> list=cdao.cleanList();
		return list;
	}
	
	@RequestMapping("/cread")
	public String cleanRead(Model model, int crno){
		model.addAttribute("cvo", cdao.cleanRead(crno));
		model.addAttribute("pageName", "service/cleaningread.jsp");
		return "/home";
	}
	
	@RequestMapping("/cread.json")
	@ResponseBody
	public CleaningRequestVO cleanReadJson(int crno){
		CleaningRequestVO vo=cdao.cleanRead(crno);
		return vo;
	}
	
	//lesson
	@RequestMapping(value ="/linsert", method = RequestMethod.POST)
	public String cinsert(HttpSession session, Model model, LessonRequestVO lvo){
		int count= ldao.lessonCount(session.getAttribute("id").toString());
		if(count >= 1){
			model.addAttribute("msg", "�̹� �ۼ��� ��û���� �ֽ��ϴ�. ����ó�� �� �ٽ� �õ����ּ���");
			model.addAttribute("pageName", "service/alert.jsp");
			return "/home";
		}else{
			ldao.lessonInsert(lvo);
			
		}
		
		return "redirect:request";
	}
	
	
	
	@RequestMapping("/llist.json")
	@ResponseBody
	public List<LessonRequestVO> llistJson(){
		List<LessonRequestVO> list=ldao.lessonList();
		return list;
	}
	
	@RequestMapping("/lread")
	public String lessonRead(Model model, int lrno){
		model.addAttribute("lvo", ldao.lessonRead(lrno));
		model.addAttribute("pageName", "service/lessonread.jsp");
		return "/home";
	}
	
	@RequestMapping("/lread.json")
	@ResponseBody
	public LessonRequestVO lessonReadJson(int lrno){
		LessonRequestVO vo=ldao.lessonRead(lrno);
		return vo;
	}
	
	//Estimate
	
	//�̿� ������
	@ResponseBody
	@RequestMapping(value ="/beinsert", method = RequestMethod.POST)
	public int beinsert1(ServiceEstimateVO vo){
		int count = sedao.overlabCheck(vo);
		System.out.print(count);
		if(count == 0){
			sedao.binsert(vo);
		}
		return count;
	}
	
	@RequestMapping("/beinsert")
	public String beinsert(HttpSession session, Model model){
		model.addAttribute("sc", scdao.partialbRead(session.getAttribute("id").toString()));
		model.addAttribute("pageName", "service/estimate.jsp");
		return "/home";
	}
	
	//Ȩ Ŭ���� ������
	@ResponseBody
	@RequestMapping(value ="/ceinsert", method = RequestMethod.POST)
	public int ceinsert1(ServiceEstimateVO vo){
		int count = sedao.overlabCheck2(vo);
		System.out.print(count);
		if(count == 0){
			sedao.cinsert(vo);
		}
		return count;
	
	}
	@RequestMapping("/ceinsert")
	public String ceinsert(HttpSession session, Model model){
		model.addAttribute("sc", scdao.partialbRead2(session.getAttribute("id").toString()));
		model.addAttribute("pageName", "service/estimate.jsp");
		return "/home";
	}
	
	//���� Ŭ���� ������
		@ResponseBody
		@RequestMapping(value ="/leinsert", method = RequestMethod.POST)
		public int leinsert1(ServiceEstimateVO vo){
			int count = sedao.overlabCheck3(vo);
			if(count == 0){
				sedao.linsert(vo);
			}
			return count;
		}
		@RequestMapping("/leinsert")
		public String leinsert(HttpSession session, Model model){
			model.addAttribute("sc", scdao.partialbRead3(session.getAttribute("id").toString()));
			model.addAttribute("pageName", "service/estimate.jsp");
			return "/home";
		}
		
	//���� �� ������
		
		//�̿�
		@RequestMapping("/beslist")
		public String beslist(HttpSession session, Model model){
			model.addAttribute("sideMenu", "mypageSidemenu.jsp");
			model.addAttribute("pageName", "myEstimate/bestimatelist.jsp");
			return "/home";
		}
		
		@RequestMapping("/beslist.json")
		@ResponseBody
		public List<ServiceEstimateVO> beslistjson(HttpSession session, Model model){
			ServiceCoVO vo=scdao.partialbRead(session.getAttribute("id").toString());
			List<ServiceEstimateVO> list=sedao.beautyViewList(vo.getScno());
			if(list.isEmpty()){
				list=null;
			}
			return list;	
		}
		
		@RequestMapping("/besread.json")
		@ResponseBody
		public ServiceEstimateVO besreadjson(ServiceEstimateVO vo){
			ServiceEstimateVO read=sedao.beautyViewRead(vo);
			return read;
		}
		
		//Ȩ Ŭ����
		@RequestMapping("/ceslist")
		public String ceslist(HttpSession session, Model model){
			model.addAttribute("sideMenu","mypageSidemenu.jsp");
			model.addAttribute("pageName", "myEstimate/cestimatelist.jsp");
			return "/home";
		}
		
		@RequestMapping("/ceslist.json")
		@ResponseBody
		public List<ServiceEstimateVO> ceslistjson(HttpSession session, Model model){
			ServiceCoVO vo=scdao.partialbRead2(session.getAttribute("id").toString());
			List<ServiceEstimateVO> list=sedao.cleaningViewList(vo.getScno());
			if(list.isEmpty()){
				list=null;
			}
			return list;	
		}
		
		@RequestMapping("/cesread.json")
		@ResponseBody
		public ServiceEstimateVO cesreadjson(ServiceEstimateVO vo){
			ServiceEstimateVO read=sedao.cleaningViewRead(vo);
			return read;
		}
		
		//����
		@RequestMapping("/leslist")
		public String leslist(HttpSession session, Model model){
			model.addAttribute("sideMenu","mypageSidemenu.jsp");
			model.addAttribute("pageName", "myEstimate/lestimatelist.jsp");
			return "/home";
		}
		
		@RequestMapping("/leslist.json")
		@ResponseBody
		public List<ServiceEstimateVO> leslistjson(HttpSession session, Model model){
			ServiceCoVO vo=scdao.partialbRead3(session.getAttribute("id").toString());
			List<ServiceEstimateVO> list=sedao.lessonViewList(vo.getScno());
			if(list.isEmpty()){
				list=null;
			}
			return list;	
		}
		
		@RequestMapping("/lesread.json")
		@ResponseBody
		public ServiceEstimateVO lesreadjson(ServiceEstimateVO vo){
			ServiceEstimateVO read=sedao.lessonViewRead(vo);
			return read;
		}
}
