package edu.spring.trans.persistence;

import edu.spring.trans.domain.User;

public interface UserDao {
	
	User read(String userid);
	int create(User user);
	int update(User user);
	int delete(String userid);
	
	User signinCheck(User user);
}
