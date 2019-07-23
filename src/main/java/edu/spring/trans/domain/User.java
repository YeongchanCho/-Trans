package edu.spring.trans.domain;

import java.text.DateFormat;
import java.util.Date;

public class User {
	private String userid, pwd, pwdCheck, city, phone, email, gender;
	private Date birth;
	
	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(String userid, String pwd, String pwdCheck, String city, String phone, String email, String gender,
			Date birth) {
		this.userid = userid;
		this.pwd = pwd;
		this.pwdCheck = pwdCheck;
		this.city = city;
		this.phone = phone;
		this.email = email;
		this.gender = gender;
		this.birth = birth;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getPwdCheck() {
		return pwdCheck;
	}

	public void setPwdCheck(String pwdCheck) {
		this.pwdCheck = pwdCheck;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
		DateFormat df = DateFormat.getDateInstance();
		df.format(birth);
	}

	@Override
	public String toString() {
		return "User [userid=" + userid + ", pwd=" + pwd + ", pwdCheck=" + pwdCheck + ", city=" + city + ", phone="
				+ phone + ", email=" + email + ", gender=" + gender + ", birth=" + birth + "]";
	}
	
}
