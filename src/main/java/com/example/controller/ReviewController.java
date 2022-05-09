package com.example.controller;

import java.io.Console;
import java.io.File;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.dao.OrderlistDAO;
import com.example.dao.ProductDAO;
import com.example.dao.ReviewDAO;
import com.example.dao.UserDAO;
import com.example.domain.Criteria;
import com.example.domain.OrderlistVO;
import com.example.domain.PageMaker;
import com.example.domain.ProductVO;
import com.example.domain.ReviewVO;
import com.example.domain.shopproductVO;

@Controller
@RequestMapping("/review")
public class ReviewController {
	@Autowired
	ReviewDAO dao;
	
	@Autowired
	OrderlistDAO odao;
	
	@Autowired
	UserDAO udao;
	
	@Autowired
	ProductDAO pdao;
	
	@Resource(name="uploadPath")
	String path;

	//���� �Է�������
		@RequestMapping("/insert")
		public String insert(Model model,int pno, int bno){
			model.addAttribute("vo",odao.read(pno,bno));
			model.addAttribute("rvo",dao.list(bno));
			model.addAttribute("pageName", "review/insert.jsp");
			return "/home";
		}
	//orderlist/review ��� json ������ ����
	@RequestMapping("/list.json")
	@ResponseBody //�����͸� ����
	public HashMap<String,Object> listJSON(Criteria cri, int bno){
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		cri.setPerPageNum(5);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(3);
		pm.setTotalCount(odao.count(cri));
		
		map.put("pm", pm);
		map.put("review", dao.list(bno));
		map.put("join", odao.join(cri));
		return map;

	}
	//���� ������
	//orderlist�� ���� user�� name�� �������� ����
	@RequestMapping("/list")
	public String list(Model model,Criteria cri){ //model�� ����ϰ����ϴ� �������� �����
		//model.addAttribute("name",udao.read(session.getAttribute("id").toString()));
		//session.setAttribute("username", "red"); //�α������α׷��ߴٰ� �����ߴ� �����ϰ�
		cri.setPerPageNum(5);
		//cri.setPage(1);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(5);
		pm.setTotalCount(odao.count(cri));

		
		model.addAttribute("pm", pm);
		model.addAttribute("page",cri.getPage());
		model.addAttribute("join" ,odao.join(cri));
		model.addAttribute("pageName", "review/list.jsp");
	
		return "/home";
	}
	//���� ������
		@RequestMapping("/reviewable")
		public String reviewable(Model model,int bno){
			
			model.addAttribute("list",dao.list(bno));
			model.addAttribute("pageName", "review/reviewable.jsp");
			return "/home";
		}
	
	
	//���Ͼ��ε�������
	@RequestMapping("/fileupload")
	public String fileupload(Model model){
		model.addAttribute("pageName", "review/fileupload.jsp");
		return "/home";
	}
	//�̰� �����ؾ���
	@ResponseBody
	@RequestMapping(value="/fileupload", method=RequestMethod.POST)
	public String fileuploadPost(@RequestParam("article_file")List<MultipartFile> multi,
	HttpServletRequest request){
		String strResult = "{\"result\":\"FAIL\"}";
		System.out.println(strResult+"..");
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot;
			try{
				if(multi.size()>0 && !multi.get(0).getOriginalFilename().equals("")){
					for(MultipartFile file:multi){
						fileRoot = path;
						System.out.println(fileRoot);
						String originFileName = file.getOriginalFilename();
						String extension = originFileName.substring(originFileName.lastIndexOf("."));
						//����� ���ϸ�
						String saveFileName ="review/" + System.currentTimeMillis() + "_" + file.getOriginalFilename();
						//�̰� ���ؾȵ�
						File targetFile = new File(fileRoot+saveFileName);
						try{
							InputStream fileStream = file.getInputStream();
							//��������
							FileUtils.copyInputStreamToFile(fileStream, targetFile);
						}catch(Exception e){
							//���� ����
							FileUtils.deleteQuietly(targetFile);
							//����� ���� ���� ����
							e.printStackTrace();
							break;
						}
					}
					strResult = "{\"result\" : \"OK\" }";
				}
				//���� ÷�� ������ ��
				else{
					strResult = "{\"result\" : \"OK\"}";
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		return strResult;
		
			
	}
	
	
}