package com.example.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.dao.shopproductDAO;

@Controller
@RequestMapping("/temp")
public class TestController {
	
	@Autowired
	shopproductDAO dao;
	
	@RequestMapping("temp_page")
	public String developer(Model model) {
		model.addAttribute("pageName", "temp/temp_page.jsp");
		return "/home";
	}
	
	@RequestMapping("/api_search")
	public String api_search(Model model) {
		model.addAttribute("pageName", "temp/api_search.jsp");
		return "/home";
	}
	
	@RequestMapping("/list")
	public String list(Model model) {
		model.addAttribute("pageName", "temp/list.jsp");
		return "/home";
	}
	@RequestMapping("/shopping_cart")
	public String cart_page(Model model) {
		model.addAttribute("pageName", "temp/shopping_cart.jsp");
		return "/home";
	}
	@RequestMapping("/payment_request")
	public String payment_request(Model model) {
		model.addAttribute("pageName", "temp/payment_request.jsp");
		return "/home";
	}
	@RequestMapping("/register")
	public String register(Model model) {
		model.addAttribute("pageName", "temp/register.jsp");
		return "/home";
	}
	
	@RequestMapping("/checkout")
	public String checkout(Model model) {
		model.addAttribute("pageName", "temp/checkout.jsp");
		return "/home";
	}
	@RequestMapping("/agreement")
	public String agreement(Model model) {
		model.addAttribute("pageName", "temp/agreement.jsp");
		return "/home";
	}
	
	@RequestMapping("/news")
	public String news(Model model) {
		model.addAttribute("pageName","temp/news.jsp");
		return "/home";
	}
	@RequestMapping("/shop")
	public String shop(Model model) {
		model.addAttribute("pageName","temp/shop_test.jsp");
		return "/home";
	}
	@RequestMapping("/shopproduct")
	public String shopproduct(Model model, int pno, String selectCate, String selectCate2, String selectCate3, HttpSession session){
		session.setAttribute("cate", selectCate);
		session.setAttribute("cate2", selectCate2);
		session.setAttribute("cate3", selectCate3);
		model.addAttribute("vo", dao.read(pno));
		model.addAttribute("pageName","temp/shopproduct_read.jsp");
		return "/home";
	}
	@RequestMapping("/cart")
	public String cart(Model model) {
		model.addAttribute("pageName","temp/cart.jsp");
		return "/home";
	}
}
