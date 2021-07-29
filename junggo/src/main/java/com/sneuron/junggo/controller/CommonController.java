package com.sneuron.junggo.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login() {
		System.out.println("login");
		return "userLogin"; 
		//return "loginQueryAjax";
	}
 
	@RequestMapping("/userJoin.do")
	public String userJoin() {
		System.out.println("userJoin");
		return "userJoin";
	}
	
	@RequestMapping("/userLogout")
	public String userLogout() {
		System.out.println("userLogout");
		return "userLogout";
	}
	
	@RequestMapping("/loginCheck.do")
	public String loginCheck() {
		System.out.println("loginCheck");
		return "loginCheck";
	}
	
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {

		log.info("access Denied : " + auth);

		model.addAttribute("msg", "Access Denied");
	}

	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {

		log.info("error: " + error);
		log.info("logout: " + logout);

		if (error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}

		if (logout != null) {
			model.addAttribute("logout", "Logout!!");
		}
	}

	@GetMapping("/customLogout")
	public void logoutGET() {

		log.info("custom logout");
	}

	@PostMapping("/customLogout")
	public void logoutPost() {

		log.info("post custom logout");
	}

}//END
