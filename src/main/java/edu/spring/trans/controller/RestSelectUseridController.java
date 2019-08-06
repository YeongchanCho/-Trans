package edu.spring.trans.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.spring.trans.domain.Board;
import edu.spring.trans.domain.Criteria;
import edu.spring.trans.domain.PageMaker;
import edu.spring.trans.domain.Reply;
import edu.spring.trans.service.BoardService;

@RestController
@RequestMapping(value = "/selectuserid")
public class RestSelectUseridController {
	@Autowired BoardService boardService;
	private static final Logger log =
			LoggerFactory.getLogger(RestSelectUseridController.class);

	@RequestMapping(value = "/boards/{userid}", method = RequestMethod.GET)
	public ResponseEntity<List<Board>> readAllReplies(
			@PathVariable(name = "userid") String userid) {
		log.info("readAllReply(userid={})", userid);
		
		  List<Board> list = boardService.selectbyuserid(userid);
		
		ResponseEntity<List<Board>> entity = 
				new ResponseEntity<List<Board>>(list, HttpStatus.OK);
		log.info("리턴하기전(bno={})");

		return entity;
	} // end readAllReplies()
}
