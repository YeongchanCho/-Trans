package edu.spring.trans.domain;

public class Tour {

	private String galPhotographyLocation;
	private String galTitle;
	private String galPhotographyMonth;
	private String galWebImageUrl;
	private String galSearchKeyword;
	
	public Tour() {}

	public Tour(String galPhotographyLocation, String galTitle, String galPhotographyMonth, String galWebImageUrl,
			String galSearchKeyword) {
		this.galPhotographyLocation = galPhotographyLocation;
		this.galTitle = galTitle;
		this.galPhotographyMonth = galPhotographyMonth;
		this.galWebImageUrl = galWebImageUrl;
		this.galSearchKeyword = galSearchKeyword;
	}

	public String getGalPhotographyLocation() {
		return galPhotographyLocation;
	}

	public void setGalPhotographyLocation(String galPhotographyLocation) {
		this.galPhotographyLocation = galPhotographyLocation;
	}

	public String getGalTitle() {
		return galTitle;
	}

	public void setGalTitle(String galTitle) {
		this.galTitle = galTitle;
	}

	public String getGalPhotographyMonth() {
		return galPhotographyMonth;
	}

	public void setGalPhotographyMonth(String galPhotographyMonth) {
		this.galPhotographyMonth = galPhotographyMonth;
	}

	public String getGalWebImageUrl() {
		return galWebImageUrl;
	}

	public void setGalWebImageUrl(String galWebImageUrl) {
		this.galWebImageUrl = galWebImageUrl;
	}

	public String getGalSearchKeyword() {
		return galSearchKeyword;
	}

	public void setGalSearchKeyword(String galSearchKeyword) {
		this.galSearchKeyword = galSearchKeyword;
	}

	@Override
	public String toString() {
		return "Tour [galPhotographyLocation=" + galPhotographyLocation + ", galTitle=" + galTitle
				+ ", galPhotographyMonth=" + galPhotographyMonth + ", galWebImageUrl=" + galWebImageUrl
				+ ", galSearchKeyword=" + galSearchKeyword + "]";
	}
	
	
	
}
