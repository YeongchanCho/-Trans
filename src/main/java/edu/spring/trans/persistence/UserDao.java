package edu.spring.trans.persistence;

import edu.spring.trans.domain.User;

public interface UserDao {
	
	User read(String userId);
	int create(User user);
	int update(User user);
	int delete(String userId);
	
	User signinCheck(User user);
}
