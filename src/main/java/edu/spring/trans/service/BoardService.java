package edu.spring.trans.service;

import java.util.List;

import edu.spring.trans.domain.Board;
import edu.spring.trans.domain.Criteria;



public interface BoardService {
	List<Board> read();// 전체검색
	Board read(int bno);//부분검색
	int create(Board board);//삽입
	int update(Board board);//수정
	int delete(int bno);//삭제
	
	// 목록 + 페이징
	List<Board> listPage(Criteria cri);
	// 게시물 총 갯수
	int listCount();
}
