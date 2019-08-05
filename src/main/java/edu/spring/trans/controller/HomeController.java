package edu.spring.trans.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.trans.domain.Board;
import edu.spring.trans.domain.User;
import edu.spring.trans.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired UserService userService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
			
		return "home_t1";
	}
	
	
	/*
	 * @RequestMapping(value = "/login", method = RequestMethod.GET) public void
	 * login() { logger.info("login() 호출");
	 * 
	 * }
	 */
	
	/*
	 * @RequestMapping(value = "/join", method = RequestMethod.GET) public void
	 * join() { logger.info("join() 호출");
	 * 
	 * //return "redirect:"; }
	 */
	
}
