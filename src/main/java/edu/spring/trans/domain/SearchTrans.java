package edu.spring.trans.domain;

import java.util.Date;

/*
 * 
 */

public class SearchTrans {
	private Date startDay, arrDay;
	private String startCity, arrCity;
	private Date startTime, arrTime, runTime;
	private String trans;
	private int coast, seats;
	private String purpose;
	
	public SearchTrans() {
		// TODO Auto-generated constructor stub
	}
	
	public SearchTrans(Date startDay, Date arrDay, String startCity, String arrCity, Date startTime, Date arrTime,
			Date runTime, String trans, int coast, int seats, String purpose) {
		this.startDay = startDay;
		this.arrDay = arrDay;
		this.startCity = startCity;
		this.arrCity = arrCity;
		this.startTime = startTime;
		this.arrTime = arrTime;
		this.runTime = runTime;
		this.trans = trans;
		this.coast = coast;
		this.seats = seats;
		this.purpose = purpose;
	}


	public Date getStartDay() {
		return startDay;
	}

	public void setStartDay(Date startDay) {
		this.startDay = startDay;
	}

	public Date getArrDay() {
		return arrDay;
	}

	public void setArrDay(Date arrDay) {
		this.arrDay = arrDay;
	}

	public String getStartCity() {
		return startCity;
	}

	public void setStartCity(String startCity) {
		this.startCity = startCity;
	}

	public String getArrCity() {
		return arrCity;
	}

	public void setArrCity(String arrCity) {
		this.arrCity = arrCity;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getArrTime() {
		return arrTime;
	}

	public void setArrTime(Date arrTime) {
		this.arrTime = arrTime;
	}

	public Date getRunTime() {
		return runTime;
	}

	public void setRunTime(Date runTime) {
		this.runTime = runTime;
	}

	public String getTrans() {
		return trans;
	}

	public void setTrans(String trans) {
		this.trans = trans;
	}

	public int getCoast() {
		return coast;
	}

	public void setCoast(int coast) {
		this.coast = coast;
	}

	public int getSeats() {
		return seats;
	}

	public void setSeats(int seats) {
		this.seats = seats;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	@Override
	public String toString() {
		return "SearchTrans [startDay=" + startDay + ", arrDay=" + arrDay + ", startCity=" + startCity + ", arrCity="
				+ arrCity + ", startTime=" + startTime + ", arrTime=" + arrTime + ", runTime=" + runTime + ", trans="
				+ trans + ", coast=" + coast + ", seats=" + seats + ", purpose=" + purpose + "]";
	}

	
}
