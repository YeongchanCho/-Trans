package edu.spring.trans.service;

import java.util.List;

import edu.spring.trans.domain.Reply;

public interface ReplyService {

	int create(Reply reply);
	List<Reply> read(int bno);
	int update(Reply reply);
	int delete(int rno);
	
} // end interface ReplyService
