package edu.mum.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping({ "/", "/welcome" })
	public String welcome(Model model) {

		model.addAttribute("greeting", "Welcome to Appointment Management System");
		model.addAttribute("tagline", "Register your appointment");

		return "welcome";
	}

//	@ModelAttribute("homeTestOrder")
//	public String testOrder() {
//
//		// test interceptor Order
//		System.out.println("CONTROLLER @MODELATTRIBUTE PREHANDLE");
//
//		return "This is CONTROLLER ORDER!";
//	}

}
