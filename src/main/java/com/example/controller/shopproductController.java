package com.example.controller;

import java.util.List;

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
		//System.out.println("\n\n결과 : " + resutlCart);
		
		//vo에 uid와 pno를 담아서 check	
		shopcartVO resutlCart = cartdao.cart_check(vo);
		//if result가 null이라면 등록
		if(resutlCart==null){
			//중복값이 없을 경우에만 등록 insert 작업 실행
			cartdao.cart_insert(vo);	
			return 1;
		}else{
			//이미 등록된 상품이 있을 경우 0
			return 0;
		}
	}
	
	//장바구니 목록 JSON
	@RequestMapping("/cart_read.json")
	@ResponseBody
	public List<shopcartVO> cart(String uid){
		List<shopcartVO> clist=cartdao.cart_read(uid);
		return clist;
	}
	
	//장바구니 목록 - 장바구니 페이지로 이동하는 화면을 만들어야 함.
	@RequestMapping("/cart_read")
	public String cart_list(Model model){
		model.addAttribute("pageName", "shopproduct/cart_read.jsp");
		return "/home";
	}
	
	//여러상품 구매시 페이지
	@RequestMapping("/multi_buy")
	public String multi_buy(Model model, String uid){
		//user 정보 불러오기
		model.addAttribute("vo", userdao.read(uid));
		model.addAttribute("pageName", "shopproduct/multi_buy.jsp");
		return "/home";
	}
	
	//실험용 list JSON
	@RequestMapping("/multi_buy.json")
	@ResponseBody
	public List<shopcartVO> buy_list(String uid){
		List<shopcartVO> list=cartdao.cart_buy(uid);
		return list;
	}
	
	//실험용 list JSON
	@RequestMapping("/list.json")
	@ResponseBody
	public List<shopproductVO> list(){
		List<shopproductVO> list=dao.list();
		return list;
	}
	
	
	//실험용 list
	@RequestMapping("/list")
	public String list(Model model){
		model.addAttribute("pageName", "shopproduct/list.jsp");
		return "/home";
	}
	
	//쇼핑몰 메인 페이지
	@RequestMapping("/main")
	public String main(Model model){
		List<shopcartVO> tvo=cartdao.today_best_items();
		List<shopcartVO> bvo=cartdao.best_items();
		model.addAttribute("tlist", tvo);
		model.addAttribute("blist", bvo);
		model.addAttribute("pageName", "shopproduct/main.jsp");
		return "/home";
	}
	
	//콘텐츠 리스트 JSON
	@RequestMapping("/contents_list.json")
	@ResponseBody
	public List<shopproductVO> contents_list(String selectCate, String selectCate2, String selectCate3){
		List<shopproductVO> list=dao.contents_list(selectCate, selectCate2, selectCate3);
		return list;
	}

	//카테고리로 필터링 된 상품 목록
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
	
	//상품 구매 페이지
	@RequestMapping("/buy")
	public String buy(Model model, int pno, int amount, HttpSession session, String uid){
		//user 정보 불러오기
		model.addAttribute("uvo", userdao.read(uid));	
		System.out.println("test............"+userdao.read(uid));
		//
		session.setAttribute("pno", pno);
		session.setAttribute("amount", amount);
		model.addAttribute("vo", dao.read(pno));
		model.addAttribute("pageName", "shopproduct/buy.jsp");
		return "/home";
	}

	
	//상품 정보 출력 (상세 페이지)
	@RequestMapping("/read")
	public String read(Model model, int pno, String selectCate, String selectCate2, String selectCate3, HttpSession session){
		session.setAttribute("cate", selectCate);
		session.setAttribute("cate2", selectCate2);
		session.setAttribute("cate3", selectCate3);
		model.addAttribute("vo", dao.read(pno));
		model.addAttribute("pageName", "shopproduct/read.jsp");
		return "/home";
	}
	
	//카트목록 업데이트
	@RequestMapping(value="/cart_update", method=RequestMethod.POST)
	@ResponseBody
	public void cart_update(int amount, int cno){
		cartdao.cart_update(amount, cno);	
	}
	
	//카트chk 업데이트
		@RequestMapping(value="/cart_chk_update", method=RequestMethod.POST)
		@ResponseBody
		public void cart_chk_update(int chk, int cno){
			cartdao.cart_chk_update(chk, cno);	
		}
		
	//상품 구매
	@RequestMapping(value="/order_insert", method=RequestMethod.POST)
	@ResponseBody
	public void order_insert(shopcartVO vo){
		//등록
		cartdao.order_insert(vo);
		//장바구니chk 목록 삭제
		cartdao.chk_delete(vo);
		//shopproduct 구매수량 추가
		cartdao.sell_update(vo.getAmount(), vo.getPno());
	}
	
	//장바구니 목록 JSON
	@RequestMapping("/order_list.json")
	@ResponseBody
	public List<shopcartVO> order_list(String uid){
		List<shopcartVO> olist=cartdao.order_list(uid);
		return olist;
	}
	
	//구매목록 - 상세 구매 페이지 이동기능 달아야 함
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
	
	//주문목록 - read페이지
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

	//상품 단일 구매
	@RequestMapping(value="/order_single_insert", method=RequestMethod.POST)
	@ResponseBody
	public void order_single_insert(shopcartVO vo){
		//등록
		cartdao.order_insert(vo);
		//shopproduct 구매수량 추가
		cartdao.sell_update(vo.getAmount(), vo.getPno());
	}
}
