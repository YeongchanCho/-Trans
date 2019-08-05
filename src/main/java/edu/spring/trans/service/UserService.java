package edu.spring.trans.service;

import java.util.List;

import edu.spring.trans.domain.User;

public interface UserService {
	List<User> read();
	User signinCheck(User user);
	User read(String userid);
	int create(User user);
	int update(User user);
	int delete(String userid);
	User select(String userid);
}
