
package edu.spring.trans.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.spring.trans.domain.User;
import edu.spring.trans.service.UserService;



	@RestController
	@RequestMapping(value = "/user")
	public class IdCheckRestController {
		private static final Logger log =
				LoggerFactory.getLogger(IdCheckRestController.class);
			
	@Autowired UserService userService;
	@RequestMapping(value = "/checkid", method = RequestMethod.POST)
	public int checkid(HttpServletRequest req)  {
		String userid = req.getParameter("userid");
		
		log.info("join(POST) 호출",userid);
		User idCheck = userService.select(userid);
		int result = 0;
		if(idCheck != null){
			result =1;
		}
	
		
		return result;
	}

}
