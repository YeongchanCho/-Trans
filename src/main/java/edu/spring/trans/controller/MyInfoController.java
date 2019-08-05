package edu.spring.trans.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.trans.domain.User;
import edu.spring.trans.service.UserService;

@Controller
@RequestMapping(value = "/myinfo")
public class MyInfoController {
	private static final Logger log = LoggerFactory.getLogger(HomeController.class);

	@Autowired UserService userService;
	
	
	
	
}
