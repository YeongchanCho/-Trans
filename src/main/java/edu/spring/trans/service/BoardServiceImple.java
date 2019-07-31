package edu.spring.trans.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.trans.domain.Board;
import edu.spring.trans.domain.Criteria;
import edu.spring.trans.persistence.BoardDao;
import edu.spring.trans.persistence.UserDao;

@Service
public class BoardServiceImple implements BoardService {

	private static final Logger log =
			LoggerFactory.getLogger(BoardServiceImple.class);
	
	@Autowired BoardDao boarddao;
	@Autowired UserDao userdao;
	
	@Override
	public List<Board> read() {
		log.info("read");
		//전체 검색
		return boarddao.read();
	}

	@Override
	public Board read(int bno) {
		//부분검색
		log.info("read(bno={})", bno);
		return boarddao.read(bno); 
	}


	@Override
	public int update(Board board) {
		//수정
		log.info("update");
		return boarddao.update(board);
	}

	@Override
	public int delete(int bno) {
		//삭제
		log.info("delete");
		return boarddao.delete(bno);
	}

	@Override
	public int create(Board board) {
		//삽입
		log.info("create");
		
		return boarddao.create(board);
	}

	@Override
	public List<Board> listPage(Criteria cri) {
		// 목록 + 페이징
		return boarddao.listPage(cri);
	}

	@Override
	public int listCount() {		
		return boarddao.listCount();
	}

	

}
