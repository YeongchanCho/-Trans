package edu.spring.trans.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.trans.domain.Board;
import edu.spring.trans.domain.Criteria;

@Repository
public class BoardDaoImple implements BoardDao {
	// Board 테이블에 대한 SQL 문장들을 찾기 위한 이름 공간(namespace) - mapper.xml
	private static final String NAMESPACE = 
			"edu.spring.trans.mappers.BoardMapper";
	private static final Logger log =
			LoggerFactory.getLogger(BoardDaoImple.class);

	@Autowired SqlSession sqlSession;
	
	@Override
	public List<Board> read() {
		log.info("read() 호출");
		//계시판 전체화면 보이기
		return sqlSession.selectList(NAMESPACE + ".selectAll");

	}

	@Override
	public Board read(int bno) {
		//게시판 상세화면 보이기
		log.info("read(bno={})", bno);
		
		return sqlSession.selectOne(NAMESPACE+ ".selectByBno",bno);
	
	}
	@Override
	public int create(Board board) {
		//삽입
		// TODO Auto-generated method stub
		log.info("create() 호출");
		return sqlSession.insert(NAMESPACE + ".create",board);
	}

	@Override
	public int update(Board board) {
		//수정
		// TODO Auto-generated method stub
		log.info("update() 호출");
		return sqlSession.update(NAMESPACE + ".update",board);
	}

	@Override
	public int delete(int bno) {
		//삭제
		log.info("delete(bno={})", bno);
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE + ".delete", bno);
	}

	@Override
	public int update(int bno, int increase) {
		log.info("update(bno={}, increase={})", bno, increase);
		
		Map<String, Object> params = new HashMap<>();
		params.put("bno", bno);
		params.put("increase", increase);
		
		return sqlSession.update(NAMESPACE + ".updateReplyCnt", params);
	}

	@Override
	public List<Board> listPage(Criteria cri) {
		return sqlSession.selectList(NAMESPACE + ".listPage", cri);
	}

	@Override
	public int listCount() {
		return sqlSession.selectOne(NAMESPACE + ".listCount");
	}

	


}
