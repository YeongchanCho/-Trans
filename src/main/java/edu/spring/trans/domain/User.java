package edu.spring.trans.domain;

import java.util.Date;

public class User {
	private String userid, pwd, city, phone, email, gender, grade;
	private Date birth;
	
	public User() {}

	public User(String userid, String pwd, String city, String phone, String email, String gender, String grade,
			Date birth) {
		this.userid = userid;
		this.pwd = pwd;
		this.city = city;
		this.phone = phone;
		this.email = email;
		this.gender = gender;
		this.grade = grade;
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

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	@Override
	public String toString() {
		return "User [userid=" + userid + ", pwd=" + pwd + ", city=" + city + ", phone=" + phone + ", email=" + email
				+ ", gender=" + gender + ", grade=" + grade + ", birth=" + birth + "]";
	}

	
}
