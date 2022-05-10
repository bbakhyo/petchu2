package com.example.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dao.UserDAO;
import com.example.dao.shopcartDAO;
import com.example.dao.shopproductDAO;
import com.example.domain.shopcartVO;
import com.example.domain.shopproductVO;

@Controller
@RequestMapping("/shopproduct")
public class shopproductController {
	@Autowired
	shopproductDAO dao;
	@Autowired
	shopcartDAO cartdao;
	@Autowired
	UserDAO userdao;
	
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	@ResponseBody
	public void delete(int cno){
		cartdao.cart_delete(cno);
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	@ResponseBody
	public int insert(shopcartVO vo){
		//System.out.println("...................."+vo);
		//System.out.println("\n\n��� : " + resutlCart);
		
		//vo�� uid�� pno�� ��Ƽ� check	
		shopcartVO resutlCart = cartdao.cart_check(vo);
		//if result�� null�̶�� ���
		if(resutlCart==null){
			//�ߺ����� ���� ��쿡�� ��� insert �۾� ����
			cartdao.cart_insert(vo);	
			return 1;
		}else{
			//�̹� ��ϵ� ��ǰ�� ���� ��� 0
			return 0;
		}
	}
	
	//��ٱ��� ��� JSON
	@RequestMapping("/cart_read.json")
	@ResponseBody
	public List<shopcartVO> cart(String uid){
		List<shopcartVO> clist=cartdao.cart_read(uid);
		return clist;
	}
	
	//��ٱ��� ��� - ��ٱ��� �������� �̵��ϴ� ȭ���� ������ ��.
	@RequestMapping("/cart_read")
	public String cart_list(Model model){
		model.addAttribute("pageName", "shopproduct/cart_read.jsp");
		return "/home";
	}
	
	//������ǰ ���Ž� ������
	@RequestMapping("/multi_buy")
	public String multi_buy(Model model, String uid){
		//user ���� �ҷ�����
		model.addAttribute("vo", userdao.read(uid));
		model.addAttribute("pageName", "shopproduct/multi_buy.jsp");
		return "/home";
	}
	
	//����� list JSON
	@RequestMapping("/multi_buy.json")
	@ResponseBody
	public List<shopcartVO> buy_list(String uid){
		List<shopcartVO> list=cartdao.cart_buy(uid);
		return list;
	}
	
	//����� list JSON
	@RequestMapping("/list.json")
	@ResponseBody
	public List<shopproductVO> list(){
		List<shopproductVO> list=dao.list();
		return list;
	}
	
	
	//����� list
	@RequestMapping("/list")
	public String list(Model model){
		model.addAttribute("pageName", "shopproduct/list.jsp");
		return "/home";
	}
	
	//���θ� ���� ������
	@RequestMapping("/main")
	public String main(Model model){
		List<shopcartVO> tvo=cartdao.today_best_items();
		List<shopcartVO> bvo=cartdao.best_items();
		model.addAttribute("tlist", tvo);
		model.addAttribute("blist", bvo);
		model.addAttribute("pageName", "shopproduct/main.jsp");
		return "/home";
	}
	//Shopproduct main에서 베스트/오늘의 상품 목록 출력
	@RequestMapping("/main.json")
	@ResponseBody
	public HashMap<String,Object> main_best(){
		HashMap<String,Object> map=new HashMap<String,Object>();
		List<shopcartVO> best1=cartdao.best_items();
		List<shopcartVO> today1=cartdao.today_best_items();
		map.put("best1", best1);
		map.put("today1", today1);
	return map;	
	}
	
	
	
	//������ ����Ʈ JSON
	@RequestMapping("/contents_list.json")
	@ResponseBody
	public List<shopproductVO> contents_list(String selectCate, String selectCate2, String selectCate3){
		List<shopproductVO> list=dao.contents_list(selectCate, selectCate2, selectCate3);
		return list;
	}

	//ī�װ��� ���͸� �� ��ǰ ���
	@RequestMapping("/contents_list")
	public String contents_list(Model model, String selectCate, String selectCate2, String selectCate3, HttpSession session){
		session.setAttribute("cate", selectCate);
		session.setAttribute("cate2", selectCate2);
		session.setAttribute("cate3", selectCate3);
		model.addAttribute("pageName", "shopproduct/contents_list.jsp");
		model.addAttribute("list", dao.contents_list(selectCate, selectCate2, selectCate3));
		model.addAttribute("list_", dao.list());
		return "/home";
	}
	
	//��ǰ ���� ������
	@RequestMapping("/buy")
	public String buy(Model model, int pno, int amount, HttpSession session, String uid){
		//user ���� �ҷ�����
		model.addAttribute("uvo", userdao.read(uid));	
		System.out.println("test............"+userdao.read(uid));
		//
		session.setAttribute("pno", pno);
		session.setAttribute("amount", amount);
		model.addAttribute("vo", dao.read(pno));
		model.addAttribute("pageName", "shopproduct/buy.jsp");
		return "/home";
	}

	
	//��ǰ ���� ��� (�� ������)
	@RequestMapping("/read")
	public String read(Model model, int pno, String selectCate, String selectCate2, String selectCate3, HttpSession session){
		session.setAttribute("cate", selectCate);
		session.setAttribute("cate2", selectCate2);
		session.setAttribute("cate3", selectCate3);
		model.addAttribute("vo", dao.read(pno));
		model.addAttribute("pageName", "shopproduct/read.jsp");
		return "/home";
	}
	
	//īƮ��� ������Ʈ
	@RequestMapping(value="/cart_update", method=RequestMethod.POST)
	@ResponseBody
	public void cart_update(int amount, int cno){
		cartdao.cart_update(amount, cno);	
	}
	
	//īƮchk ������Ʈ
		@RequestMapping(value="/cart_chk_update", method=RequestMethod.POST)
		@ResponseBody
		public void cart_chk_update(int chk, int cno){
			cartdao.cart_chk_update(chk, cno);	
		}
		
	//��ǰ ����
	@RequestMapping(value="/order_insert", method=RequestMethod.POST)
	@ResponseBody
	public void order_insert(shopcartVO vo){
		//���
		cartdao.order_insert(vo);
		//��ٱ���chk ��� ����
		cartdao.chk_delete(vo);
		//shopproduct ���ż��� �߰�
		cartdao.sell_update(vo.getAmount(), vo.getPno());
	}
	
	//��ٱ��� ��� JSON
	@RequestMapping("/order_list.json")
	@ResponseBody
	public List<shopcartVO> order_list(String uid){
		List<shopcartVO> olist=cartdao.order_list(uid);
		return olist;
	}
	
	//���Ÿ�� - �� ���� ������ �̵���� �޾ƾ� ��
	@RequestMapping("/order_list")
	public String order_list(Model model){
		model.addAttribute(	"pageName", "shopproduct/order_list.jsp");
		return "/home";
	}
	
	//read.json
	@RequestMapping("/read.json")
	@ResponseBody
	public shopproductVO read(int pno){
		shopproductVO vo=dao.read(pno);
		return vo;
	}
	
	//order_read.json
	@RequestMapping("/order_read.json")
	@ResponseBody
	public List<shopcartVO> order_read(int bno, String orno){
		//shopcartVO vo=cartdao.order_read(pno, orno);
		List<shopcartVO> elselist=cartdao.order_read_else(bno, orno);
		return elselist;
	}
	
	//�ֹ���� - read������
	@RequestMapping("/order_read")
	public String order_read(Model model, int bno){
		model.addAttribute("vo", cartdao.order_read(bno));
		model.addAttribute(	"pageName", "shopproduct/order_read.jsp");
		return "/home";
	}
	
	@RequestMapping("/phone_number")
	public String phone_format(String number) { 
		String regEx = "(\\d{3})(\\d{3,4})(\\d{4})"; 
		return number.replaceAll(regEx, "$1-$2-$3"); 
		}

	//��ǰ ���� ����
	@RequestMapping(value="/order_single_insert", method=RequestMethod.POST)
	@ResponseBody
	public void order_single_insert(shopcartVO vo){
		//���
		cartdao.order_insert(vo);
		//shopproduct ���ż��� �߰�
		cartdao.sell_update(vo.getAmount(), vo.getPno());
	}
}
