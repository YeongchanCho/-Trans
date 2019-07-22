package edu.spring.trans.domain;

import java.util.Date;

public class User {
	private String userId, pwd, pwdCheck, city, phone, email, gender;
	private Date birth;
	
	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(String userId, String pwd, String pwdCheck, String city, String phone, String email, String gender,
			Date birth) {
		this.userId = userId;
		this.pwd = pwd;
		this.pwdCheck = pwdCheck;
		this.city = city;
		this.phone = phone;
		this.email = email;
		this.gender = gender;
		this.birth = birth;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", pwd=" + pwd + ", pwdCheck=" + pwdCheck + ", city=" + city + ", phone="
				+ phone + ", email=" + email + ", gender=" + gender + ", birth=" + birth + "]";
	}
	
}
