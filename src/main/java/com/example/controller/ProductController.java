package com.example.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.dao.ProductDAO;
import com.example.domain.Criteria;
import com.example.domain.NaverAPI;
import com.example.domain.PageMaker;
import com.example.domain.ProductVO;


@Controller
@RequestMapping ("/product")
public class ProductController {
	
	@Autowired
	ProductDAO dao;
	

	
	@RequestMapping(value="/qntUpdate", method=RequestMethod.POST)
	@ResponseBody
	public void qntUpdate(int code, int qnt){
		dao.qntUpdate(code, qnt);
	}
	
	@Resource(name="uploadPath")
	String path;
	
	@RequestMapping("/insert")
	public String insert(Model model){
		model.addAttribute("submenu", "submenu.jsp");
		model.addAttribute("pageName","product/insert.jsp");
		return "/home";
	}
	@RequestMapping("/read")
	public String read(Model model,int pno){
		model.addAttribute("vo",dao.read(pno));
		model.addAttribute("pageName","product/read.jsp");
		return "/home";
	}
	
	@RequestMapping("/list")
	public String list(Model model) {
		model.addAttribute("submenu", "submenu.jsp");
		model.addAttribute("pageName", "product/list.jsp");
		return "/home";
	}
	
	@RequestMapping("/shop.json")
	@ResponseBody
	public String shop(String query ,int page){
		return NaverAPI.connection(query,page);
	}
	
	@RequestMapping("/list.json")
	@ResponseBody
	public Map<String,Object> list(Criteria cri){
		Map<String,Object> map = new HashMap<>();
		cri.setPerPageNum(10);
		
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(dao.count());
		
		map.put("pm", pm);
		map.put("list", dao.list(cri));
		
		return map;
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	@ResponseBody
	public void insert(ProductVO vo){
		//�̹��� �� pc�� ī��
		/*
		String str = vo.getPimage();
		String fileName = str.substring(str.lastIndexOf("/")+1);
		
		try {
			URL url = new URL(str);
			InputStream in = url.openStream();
			OutputStream out = new FileOutputStream(path + "product/" + fileName);
			FileCopyUtils.copy(in, out);
			vo.setPimage("product/" + fileName);
			dao.insert(vo);
		} catch (Exception e) {
			System.out.println("����: " + e.toString());
		}
		*/
		dao.insert(vo);
	}
	@RequestMapping(value="/adminUpdate", method=RequestMethod.POST)
	public String adminUpdate(ProductVO vo, MultipartHttpServletRequest multi) throws Exception{
		MultipartFile file= multi.getFile("file");		
		/*
		if(!file.isEmpty()){		
			new File(path + vo.getPimage()).delete();
			String image = "product/" + System.currentTimeMillis() + "_" + file.getOriginalFilename();
			file.transferTo(new File(path + image));
			vo.setPimage(image);
		}
		*/
		dao.adminUpdate(vo);
		return "redirect:/product/list";
	}
}
