package com.somecompany.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.somecompany.pojo.Login;
import com.somecompany.service.ContactService;

@Controller
@SessionAttributes("loginvalid")
public class LoginController {
	@Autowired
	private ContactService contactService;
	
	@RequestMapping(value = "/authenticationPage", method = RequestMethod.GET)
	public String showLoginForm(@ModelAttribute("newLogin")Login login, Model model, 
			HttpServletRequest request, HttpServletResponse response) {
		
		return "mainPage";

	}

	@RequestMapping(value = "/authenticationPage", method = RequestMethod.POST)
	public String authenticationPost(@ModelAttribute("newLogin")@Valid Login login,BindingResult bindingResult,Model model, 
			HttpServletRequest request,HttpServletResponse response) {
		if(bindingResult.hasErrors()){
			System.out.println("main");
			return "mainPage";
		}
		int result = contactService.login(login);
		if(result==1){
			model.addAttribute("loginvalid", "uthenticateUser");
			return "home";
		}
		else{
			request.setAttribute("error", "Invalid UserName & Password..");
			return "mainPage";	
		}

	}

	
}

