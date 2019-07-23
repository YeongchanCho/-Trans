package edu.spring.trans.service;

import edu.spring.trans.domain.User;

public interface UserService {
	User signinCheck(User user);
	User read(String userId);
	int create(User user);
	int update(User user);
	int delete(String userId);
}
