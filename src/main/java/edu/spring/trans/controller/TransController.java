package edu.spring.trans.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TransController {
	private static final Logger log = LoggerFactory.getLogger(TransController.class);
	
	@RequestMapping(value = "/transDetail", method = RequestMethod.POST)
	public String searchTrans(Model model) {
		log.info("searchTrans(model={})", model);
		
		return "redirect:/transDetail";
	}

}
