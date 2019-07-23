package edu.spring.trans.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.trans.service.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	private static final Logger log = LoggerFactory.getLogger(UserController.class);
	
	//@Autowired UserService userService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void login() {
		log.info("login() 호출");
	}

}
