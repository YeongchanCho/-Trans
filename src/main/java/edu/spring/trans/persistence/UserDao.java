package edu.spring.trans.persistence;

import java.util.List;

import edu.spring.trans.domain.User;

public interface UserDao {
	
	List<User> read();
	User read(String userid);//회원정보 읽기
	int create(User user);// 회원정보 만들기
	int update(User user);//회원 정보수정
	int delete(String userid);//아이디 삭제
	User select(String userid);//아이디확인
	User signinCheck(User user);//로그인
}
