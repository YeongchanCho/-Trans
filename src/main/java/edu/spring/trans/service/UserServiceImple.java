package edu.spring.trans.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.trans.domain.User;
import edu.spring.trans.persistence.UserDao;


@Service
public class UserServiceImple implements UserService {

	private static final Logger log =
			LoggerFactory.getLogger(UserServiceImple.class);
	
	@Autowired private UserDao userDao;
	
	@Override
	public User signinCheck(User user) {
		log.info("signinCheck({})", user);
		
		return userDao.signinCheck(user);
	}
	
	@Override
	public int create(User user) {
		log.info("create({})", user);
		
		int result = userDao.create(user);
		
		return result;
	}
	
	@Override
	public int delete(String userid) {
		log.info("delete(bno={})", userid);
		
		return userDao.delete(userid);
	}
	
	@Override
	public User read(String userid) {
		log.info("read(bno={})", userid);
		return userDao.read(userid);
	}
	
	@Override
	public int update(User user) {
		log.info("update({})", user);
		return userDao.update(user);
	}

} // end class UserServiceImple

