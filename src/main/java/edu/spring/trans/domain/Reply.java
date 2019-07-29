package edu.spring.trans.domain;

import java.util.Date;

public class Reply {
	private int rno;
	private String rtext;
	private String userid;
	private int bno;
	private Date regdate;
	
	public Reply() {}

	public Reply(int rno, String rtext, String userid, int bno, Date regdate) {
		super();
		this.rno = rno;
		this.rtext = rtext;
		this.userid = userid;
		this.bno = bno;
		this.regdate = regdate;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getRtext() {
		return rtext;
	}

	public void setRtext(String rtext) {
		this.rtext = rtext;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
