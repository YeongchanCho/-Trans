package edu.spring.trans.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import edu.spring.trans.domain.Board;
import edu.spring.trans.domain.Criteria;
import edu.spring.trans.domain.PageMaker;
import edu.spring.trans.service.BoardService;
import edu.spring.trans.service.UserService;
import edu.spring.trans.utils.UploadFileUtils;

@Controller
@RequestMapping(value = "/board")
public class BoardController {

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	BoardService boardservice;

	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void main(Criteria cri, Model model) {
		// BoardService의 메소드를 사용해서 DB 게시판 테이블 전체 검색
		// 검색 결과를 View(JSP)에 전달
		log.info("main() 호출");
//		List<Board> list = boardservice.read();
		List<Board> list = boardservice.listPage(cri);
		log.info(list.toString());
		model.addAttribute("boardList", list);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(boardservice.listCount());
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri", cri);
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public void main(int bno, Model model) {
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

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insert() {
		log.info("insert() GET 호출");
		// 새 글을 작성할 수 있는 페이지(JSP)로 이동
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(Board board, MultipartFile file) throws Exception {
		log.info("insert({})", board);
		// BoardService의 메소드를 사용해서 사용자가 작성한 내용을 DB에 insert
		String imgUploadPath = uploadPath + File.separator + "imgUpload"; // 이미지를 업로드할 폴더를 설정 = /uploadPath/imgUpload
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath); // 위의 폴더를 기준으로 연월일 폴더를 생성
		String fileName = null; // 기본 경로와 별개로 작성되는 경로 + 파일이름

		log.info("org file name: {}", file.getOriginalFilename());
		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			// 파일 인풋박스에 첨부된 파일이 없다면(=첨부된 파일이 이름이 없다면)

			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			log.info("fileName: {}", fileName);
			
			// gdsImg에 원본 파일 경로 + 파일명 저장
			board.setAttachment(File.separator + "imgUpload" + File.separator + ymdPath + File.separator + fileName);

			log.info(File.separator + "imgUpload" + File.separator + ymdPath + File.separator + fileName);

		} else { // 첨부된 파일이 없으면
			fileName = File.separator + "images" + File.separator + "none.jpg";
			// 미리 준비된 none.png파일을 대신 출력함

			board.setAttachment(fileName);
		}
		boardservice.create(board);

		// 서비스 처리가 끝난 후에 게시판 메인 페이지로 이동
		return "redirect:/board/main";
	}

}
