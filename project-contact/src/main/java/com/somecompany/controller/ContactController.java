package com.somecompany.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.somecompany.pojo.ContactBean;
import com.somecompany.service.ContactService;

@Controller
@SessionAttributes("loginvalid")
public class ContactController {
	@Autowired
	private ContactService contactService;
	
	
	@RequestMapping("/")
	public String mainCall(@ModelAttribute("newContactBean")@Valid ContactBean contactBean,BindingResult bindingResult,Model model, 
			HttpServletRequest request,HttpServletResponse response,HttpSession session){
		
		String sessionResult = (String) session.getAttribute("loginvalid");
		if(sessionResult.equals("uthenticateUser")){
			return "home";
		}
		else
		return "mainPage";
	}
	@RequestMapping("insert")
	public String insert(@ModelAttribute("newContactBean")@Valid ContactBean contactBean,BindingResult bindingResult,Model model, 
			HttpServletRequest request,HttpServletResponse response,HttpSession session){
		
		String sessionResult = (String) session.getAttribute("loginvalid");
		if(sessionResult.equals("uthenticateUser")){
			return "form";
		}
		else
		return "mainPage";
	}
	
	@RequestMapping(value="/insertNew", method=RequestMethod.POST)
	public String insertContact(@ModelAttribute("newContactBean")@Valid ContactBean contactBean,BindingResult bindingResult,Model model, 
			HttpServletRequest request,HttpServletResponse response,HttpSession session){
		
		if(bindingResult.hasErrors()){
			return "form";
		}
		
		String sessionResult = (String) session.getAttribute("loginvalid");
		if(sessionResult.equals("uthenticateUser")){
			int result=contactService.insertContact(contactBean);
			if(result==1){
				return "sucess";
			}
			else{
				return "fail";
			}
		}
		else
		return "mainPage";
	}
	
	@RequestMapping(value="/view")
	public String viewAllContact(Model model,ContactBean contactBean,String id,HttpSession session){
		String sessionResult = (String) session.getAttribute("loginvalid");
		if(sessionResult.equals("uthenticateUser")){
		List<ContactBean> contactList = contactService.allContact(contactBean);
		if(contactList.isEmpty()){
			return "fail";
		}
		else
		model.addAttribute("contactList", contactList);
		return "viewAllContact";
		}
		else
			return "mainPage";
	}
	
	@RequestMapping(value="/delete")
	public String deleteContact(Model model,@RequestParam("id")String id,HttpSession session){
		String sessionResult = (String) session.getAttribute("loginvalid");
		if(sessionResult.equals("uthenticateUser")){
			int result = contactService.deleteContact(id);
			if(result == 1){
			return "sucessdel";
			}
			else
				return "failDelete";
		}
		else
		return "mainPage";
	}
	
	@RequestMapping(value="/edit")
	public String editContact(Model model,@RequestParam("id")String id,HttpSession session,ContactBean contactBean,RedirectAttributes redirectAttributes){
		String sessionResult = (String) session.getAttribute("loginvalid");
		if(sessionResult.equals("uthenticateUser")){
			System.out.println("editcontact..");
			 contactBean = contactService.getContact(id);
			model.addAttribute("contactBean", contactBean);
			System.out.println("editcontact..return");
			return "editPage";
			}
		else
		return "mainPage";
	}
	
	@RequestMapping(value="/editPage")
	public String editContactAndUpdate(@ModelAttribute("contactBean")@Valid ContactBean contactBean,@RequestParam("id")String id,BindingResult bindingResult,Model model,HttpSession session){
		System.out.println(contactBean.getEmail()+""+1);
		System.out.println("editconted start");
		//session.setAttribute("loginvalid", "uthenticateUser");
		String sessionResult = (String) session.getAttribute("loginvalid");
		if(bindingResult.hasErrors()){
			System.out.println(contactBean.getId()+""+2);
			System.out.println("error");
			return "editPage";
		}
		if(sessionResult.equals("uthenticateUser")){
			System.out.println(contactBean.getId()+""+3);
			int result=contactService.updateContact(contactBean);
			System.out.println(contactBean.getId()+""+4);
			if(result==1){
				System.out.println(contactBean.getId()+""+5);
				System.out.println("Update...");
				return "sucessfullyUpdate";
			}
			else{
				System.out.println("update fail");
				return "failUpdate";
			}
		}
		else
		return "mainPage";
	}
	
	@RequestMapping(value="/search")
	public String search(@ModelAttribute("contactBean")ContactBean contactBean,Model model,HttpSession session){
		String sessionResult = (String) session.getAttribute("loginvalid");
		if(sessionResult.equals("uthenticateUser")){
			return "search";
		}
		else
			return "mainPage";
	}
	
	@RequestMapping(value="/searchContact")
	public String contactSearch(@ModelAttribute("contactBean")ContactBean contactBean,Model model,HttpSession session){
		String sessionResult = (String) session.getAttribute("loginvalid");
		if(sessionResult.equals("uthenticateUser")){
		List<ContactBean> contactList = contactService.searchContact(contactBean);
		if(contactList.isEmpty()){
			return "fail";
		}
		else
		model.addAttribute("contactList", contactList);
		return "viewAllContact";
		}
		else
			return "mainPage";
	}
	
	@RequestMapping(value="/sucess")
	public String sucess(Model model, 
			HttpServletRequest request,HttpServletResponse response,HttpSession session){
		
		String sessionResult = (String) session.getAttribute("loginvalid");
		if(sessionResult.equals("uthenticateUser")){
			return "home";
		}
		else
		return "mainPage";
	}
	
	@RequestMapping(value="/fail")
	public String fail(Model model, 
			HttpServletRequest request,HttpServletResponse response,HttpSession session){
		
		String sessionResult = (String) session.getAttribute("loginvalid");
		if(sessionResult.equals("uthenticateUser")){
			return "home";
		}
		else
		return "mainPage";
	}
	
	@RequestMapping(value="/sucessdel")
	public String sucessDelete(Model model, 
			HttpServletRequest request,HttpServletResponse response,HttpSession session){
		
		String sessionResult = (String) session.getAttribute("loginvalid");
		if(sessionResult.equals("uthenticateUser")){
			return "home";
		}
		else
		return "mainPage";
	}
	
	@RequestMapping(value="/failDelete")
	public String failDelete(Model model, 
			HttpServletRequest request,HttpServletResponse response,HttpSession session){
		
		String sessionResult = (String) session.getAttribute("loginvalid");
		if(sessionResult.equals("uthenticateUser")){
			return "home";
		}
		else
		return "mainPage";
	}
	
	@RequestMapping(value="/sucessfullyUpdate")
	public String sucessUpdate(Model model, 
			HttpServletRequest request,HttpServletResponse response,HttpSession session){
		
		String sessionResult = (String) session.getAttribute("loginvalid");
		if(sessionResult.equals("uthenticateUser")){
			return "home";
		}
		else
		return "mainPage";
	}
	
	@RequestMapping(value="/failUpdate")
	public String failUpdate(Model model, 
			HttpServletRequest request,HttpServletResponse response,HttpSession session){
		
		String sessionResult = (String) session.getAttribute("loginvalid");
		if(sessionResult.equals("uthenticateUser")){
			return "home";
		}
		else
		return "mainPage";
	}

}
