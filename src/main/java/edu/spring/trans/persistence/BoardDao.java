package edu.spring.trans.persistence;

import java.util.List;
import edu.spring.trans.domain.Board;


public interface BoardDao {
	
	List<Board> read();
	Board read(int bno);
	int create(Board board);
	int update(Board board);
	int delete(int bno);
	
}
