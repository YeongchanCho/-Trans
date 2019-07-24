package edu.spring.trans.controller;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.trans.domain.Board;
import edu.spring.trans.service.BoardService;
import edu.spring.trans.service.UserService;

@Controller
@RequestMapping(value = "/board")
public class BoardController {

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired BoardService boardservice;

	
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void main(Model model) {
		// BoardService의 메소드를 사용해서 DB 게시판 테이블 전체 검색
				// 검색 결과를 View(JSP)에 전달
		log.info("main() 호출");
		List<Board> list = boardservice.read();
		log.info(list.toString());
		model.addAttribute("boardList",list);
	}
	
	@RequestMapping(value="/detail", method =  RequestMethod.GET)
	public void main(int bno,Model model)	{
		log.info("detail(bno={})", bno);
		Board board = boardservice.read(bno);
		model.addAttribute("board", board);
		
	}
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public void update(int bno, Model model) {
		log.info("update(bno={})", bno);
		Board board = boardservice.read(bno);
		model.addAttribute("board", board);
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Board board) {
		log.info("update({})", board);
		// BoardService의 메소드를 사용해서 게시글을 수정(DB 테이블 수정)
		int result = boardservice.update(board);
		
		// 게시글 수정 이후에 상세보기 페이지로 이동(redirect)
		return "redirect:/board/detail?bno=" + board.getBno();

	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(int bno) {
		log.info("delete(bno={})", bno);
		// BoardService의 메소드를 사용해서, 게시글 번호 bno인 글을 테이블에서 삭제
		int result = boardservice.delete(bno);
		
		// 삭제 후 게시판 메인 페이지로 이동
		return "redirect:/board/main";
		
	}
	@RequestMapping(value = "/insert" , method = RequestMethod.GET)
	public void insert() {
		log.info("insert() GET 호출");
		// 새 글을 작성할 수 있는 페이지(JSP)로 이동
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(Board board) {
		log.info("insert({})", board);
		// BoardService의 메소드를 사용해서 사용자가 작성한 내용을 DB에 insert
		boardservice.create(board);
		// 서비스 처리가 끝난 후에 게시판 메인 페이지로 이동
		return "redirect:/board/main";
	}
	
}
