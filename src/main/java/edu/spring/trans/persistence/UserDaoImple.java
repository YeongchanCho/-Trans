package edu.spring.trans.persistence;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.trans.domain.User;
import edu.spring.trans.mappers.UserMapper;

@Repository
public class UserDaoImple implements UserDao {
	private static final Logger log =
			LoggerFactory.getLogger(UserDaoImple.class);
	private static final String NAMESPACE = 
			"edu.spring.trans.mappers.UserMapper";

	@Autowired SqlSession sqlSession; 
		@Autowired private UserMapper mapper;

	@Override
	public User read(String userId) {
		log.info("read() 호출");

		return sqlSession.selectOne(NAMESPACE + ".selectByUserId", userId);
	}

	@Override
	public int create(User user) {
		log.info("create(user = {})", user);

		return sqlSession.insert(NAMESPACE + ".create", user);
	}

	@Override
	public int update(User user) {
		log.info("update(user = {})", user);

		return sqlSession.update(NAMESPACE + ".update", user);
	}

	@Override
	public int delete(String userId) {
		log.info("delete(user = {})", userId);

		return sqlSession.delete(NAMESPACE + ".delete", userId);
	}

	@Override
	public User signinCheck(User user) {
		log.info("signinCheck({})", user);

		return mapper.signinCheck(user);
	}

}
