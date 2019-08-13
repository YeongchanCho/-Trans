package edu.spring.trans.domain;

public class Trans {
	private String infoService;
	private String oper;
	private String depTerminalId;
	private String arrTerminalId;
	private String depPlandTime;
	private String arrPlandTime;
	private String travelTime;
	private String price;
	private String depCity;
	private String arrCity;
	private String depCityCode;
	private String arrCityCode;
	private String terminalId;
	private String terminalNm;
	private String gradeNm;

	public Trans() {
	}

	public Trans(String depPlandTime, String arrPlandTime, String depCity, String arrCity) {
		this.depPlandTime = depPlandTime;
		this.arrPlandTime = arrPlandTime;
	}

	public Trans(String infoService, String oper, String depTerminalId, String arrTerminalId, String depPlandTime) {
		this.infoService = infoService;
		this.oper = oper;
		this.depTerminalId = depTerminalId;
		this.arrTerminalId = arrTerminalId;
		this.depPlandTime = depPlandTime;
	}

	public Trans(String depTerminalId, String arrTerminalId, String depPlandTime, String arrPlandTime,
			String travelTime, String price) {
		this.depTerminalId = depTerminalId;
		this.arrTerminalId = arrTerminalId;
		this.depPlandTime = depPlandTime;
		this.arrPlandTime = arrPlandTime;
		this.travelTime = travelTime;
		this.price = price;
	}

	public String getInfoService() {
		return infoService;
	}

	public void setInfoService(String infoService) {
		this.infoService = infoService;
	}

	public String getOper() {
		return oper;
	}

	public void setOper(String oper) {
		this.oper = oper;
	}

	public String getDepTerminalId() {
		return depTerminalId;
	}

	public void setDepTerminalId(String depTerminalId) {
		this.depTerminalId = depTerminalId;
	}

	public String getArrTerminalId() {
		return arrTerminalId;
	}

	public void setArrTerminalId(String arrTerminalId) {
		this.arrTerminalId = arrTerminalId;
	}

	public String getDepPlandTime() {
		return depPlandTime;
	}

	public void setDepPlandTime(String depPlandTime) {
		this.depPlandTime = depPlandTime;
	}

	public String getArrPlandTime() {
		return arrPlandTime;
	}

	public void setArrPlandTime(String arrPlandTime) {
		this.arrPlandTime = arrPlandTime;
	}

	public String getTravelTime() {
		return travelTime;
	}

	public void setTravelTime(String travelTime) {
		this.travelTime = travelTime;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getDepCity() {
		return depCity;
	}

	public void setDepCity(String depCity) {
		this.depCity = depCity;
	}

	public String getArrCity() {
		return arrCity;
	}

	public void setArrCity(String arrCity) {
		this.arrCity = arrCity;
	}

	public String getCityCode() {
		return depCityCode;
	}

	public void setCityCode(String cityCode) {
		this.depCityCode = cityCode;
	}

	public String getDepCityCode() {
		return depCityCode;
	}

	public void setDepCityCode(String depCityCode) {
		this.depCityCode = depCityCode;
	}

	public String getArrCityCode() {
		return arrCityCode;
	}

	public void setArrCityCode(String arrCityCode) {
		this.arrCityCode = arrCityCode;
	}

	public String getTerminalId() {
		return terminalId;
	}

	public void setTerminalId(String terminalId) {
		this.terminalId = terminalId;
	}

	public String getTerminalNm() {
		return terminalNm;
	}

	public void setTerminalNm(String terminalNm) {
		this.terminalNm = terminalNm;
	}

	public String getGradeNm() {
		return gradeNm;
	}

	public void setGradeNm(String gradeNm) {
		this.gradeNm = gradeNm;
	}

	@Override
	public String toString() {
		return "Trans [infoService=" + infoService + ", oper=" + oper + ", depTerminalId=" + depTerminalId
				+ ", arrTerminalId=" + arrTerminalId + ", depPlandTime=" + depPlandTime + ", arrPlandTime="
				+ arrPlandTime + ", travelTime=" + travelTime + ", price=" + price + ", depCity=" + depCity
				+ ", arrCity=" + arrCity + ", depCityCode=" + depCityCode + ", arrCityCode=" + arrCityCode
				+ ", terminalId=" + terminalId + ", terminalNm=" + terminalNm + ", gradeNm=" + gradeNm + "]";
	}

}