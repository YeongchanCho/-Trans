package edu.spring.trans.mappers;

import org.apache.ibatis.annotations.Select;

import edu.spring.trans.domain.User;

public interface UserMapper {
	String SQL_SIGNIN_CHECK = 
			"select * from ${tbl_users}"
			+ " where userid = #{userid} and pwd = #{pwd}";
	
	@Select(SQL_SIGNIN_CHECK)
	User signinCheck(User user);
}
