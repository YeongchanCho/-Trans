package edu.spring.trans.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import edu.spring.trans.domain.Reply;


public interface ReplyDao {
	int create(Reply reply);
	List<Reply> read(int bno);
	int update(Reply reply);
	int delete(int rno);
	Integer readBno(int rno);
}
