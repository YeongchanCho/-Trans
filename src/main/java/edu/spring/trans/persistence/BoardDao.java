package edu.spring.trans.persistence;

import java.util.List;
import edu.spring.trans.domain.Board;
import edu.spring.trans.domain.Criteria;


public interface BoardDao {
	
	List<Board> read();
	Board read(int bno);
	int create(Board board);
	int update(Board board);
	int delete(int bno);	
	int update(int bno, int increase);
	List<Board> selectbyuserid(String userid);
	// 목록 + 페이징
	List<Board> listPage(Criteria cri);
	// 게시물 총 갯수
	
	int listCount();

}
