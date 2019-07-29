package edu.spring.trans.controller;

import java.awt.Window;
import java.beans.PropertyEditorSupport;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.spring.trans.domain.User;
import edu.spring.trans.service.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	private static final Logger log = LoggerFactory.getLogger(UserController.class);

	@Autowired
	UserService userService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void login(String target, Model model) {
		log.info("login() 호출");
		if (target != null && !target.equals("")) {
			model.addAttribute("target", target);
			// 로그인 성공 후에 이동할 페이지를 저장해둠
			
		}
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void signin(User user, Model model) {
		log.info("signin({})", user);
		
		// UserService의 메소드를 사용해서 로그인 처리(성공/실패)
		User loginUser = userService.signinCheck(user);
		log.info("signinUser: {}", loginUser);
		
		// model 객체에 로그인 정보(signinId)를 attribute로 추가
		model.addAttribute("loginUser", loginUser);
		/* return "redirect:/"; */
	} // end signin(user)
	
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String signOut(HttpSession session) {
		log.info("signOut() 호출");
		session.removeAttribute("signinId");
		session.invalidate(); // 세션 객체 무효화(세션 객체 소멸, 새로 생성)
		
		
		return "redirect:/";
	}
	

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void join() {
		log.info("join() 호출");
		
	}
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(User user) {
		log.info("join(POST) 호출");
		
		userService.create(user);
		return "redirect:/";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) throws Exception {
	    binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {

	        public void setAsText(String text) throws IllegalArgumentException {
	            try {
	            	log.info("initBinder() 호출");
	                setValue(new SimpleDateFormat("yyyy-MM-dd").parse(text));
	            } catch (ParseException e) {
	                setValue(null);
	            }
	        }
	    });
	}

	
}
