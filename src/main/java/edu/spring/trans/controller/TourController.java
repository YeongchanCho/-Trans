package edu.spring.trans.controller;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

import edu.spring.trans.domain.Criteria;
import edu.spring.trans.domain.PageMaker;
import edu.spring.trans.domain.Reply;
import edu.spring.trans.domain.Tour;

@Controller
@RequestMapping(value = "/tour")
public class TourController {
	private static final Logger log = 
			LoggerFactory.getLogger(TourController.class);
	private static final String API_URL = "http://api.visitkorea.or.kr/openapi/service/rest/";
	private static final String SERVICE_KEY = "?ServiceKey=qRLgxrGXbMAS4kHs3H7QQnnkbOBpR6AFleTjqOPlp%2FXQOltZfLU2H7YFZfHA%2Fq2HLQOZvhC6LmsYw2%2BWdoDELg%3D%3D";
	String arrange = "&arrange=A&MobileOS=ETC&MobileApp=AppTesting&numOfRows=8&pageNo=";
	String SERVICE_NAME = "PhotoGalleryService/"; 
	
	
	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public void tour(Model model, Tour tour)  {

		log.info("tour() 호출");

		List<Tour> tourList = null;
		try {
			tourList = getOpenApi(tour);
		} catch (Exception e) {			
			e.printStackTrace();
		}
		model.addAttribute("tour", tour);
		model.addAttribute("tourList", tourList);		
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public void searchTour(Model model, Tour tour)  {

		log.info("searchTour() 호출");
//		log.info("keyword={}", keyword);	
		List<Tour> tourList = null;
//		tour.setKeyword(keyword);
		try {
			tourList = getSearchOpenApi(tour);
		} catch (Exception e) {			
			e.printStackTrace();
		}
		model.addAttribute("tour", tour);
		model.addAttribute("tourList", tourList);	
	}
	

	private String getApiUrl(int pageNo) throws Exception{
		log.info("getApiUrl() 호출");
	
		String OPERATION = "galleryList"; 
		String url = API_URL + SERVICE_NAME + OPERATION + SERVICE_KEY + arrange + pageNo;
		
        log.info("url = {}", url);
        
        return url;
    }
	
	private String getSearchKeywordUrl(int pageNo, String keyword) throws Exception{
		log.info("getSearchKeywordUrl 호출");
		
		String key = "&keyword=";		
		String OPERATION = "gallerySearchList"; 
		String url = API_URL + SERVICE_NAME + OPERATION + SERVICE_KEY 
				+ arrange + pageNo + key + URLEncoder.encode(keyword, "UTF-8");
		
        log.info("keywordurl = {}", url);
        
        return url;
    }
	
	public List<Tour> getOpenApi(Tour tour) throws Exception {
		log.info("getOpenApi() 호출");
		
		List<Tour> tourList = new ArrayList<Tour>();		
		
		URL url = new URL(getApiUrl(tour.getPageNo()));
		
		xmlParsing(tourList, url);

		return tourList;
		
	}
	
	public List<Tour> getSearchOpenApi(Tour tour) throws Exception {
		log.info("getSearchOpenApi 호출");
		
		List<Tour> stourList = new ArrayList<Tour>();		
		
		URL url = new URL(getSearchKeywordUrl(tour.getPageNo(), tour.getKeyword()));
		
		xmlParsing(stourList, url);

		return stourList;
	}
		
	
	public void xmlParsing(List<Tour> tourList, URL url) throws Exception{
		XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
		factory.setNamespaceAware(true);
		XmlPullParser xpp = factory.newPullParser();
		BufferedInputStream bis = new BufferedInputStream(url.openStream());

		xpp.setInput(bis, "utf-8");
		
		String tag = null;
		int event_type = xpp.getEventType();
		
		String addr = null;
		Tour tour = null;
		String text = null;
		while (event_type != XmlPullParser.END_DOCUMENT) {
			if (event_type == XmlPullParser.START_TAG) {
				tag = xpp.getName();
				if(tag.equals("item")) {
					tour = new Tour();
				}
				
			} else if (event_type == XmlPullParser.TEXT) {
				text = xpp.getText();
				
			} else if (event_type == XmlPullParser.END_TAG) {
				tag = xpp.getName();
				if(tag.equals("galPhotographyLocation")) {
					tour.setGalPhotographyLocation(text);
				} else if(tag.equals("galTitle")) {
					tour.setGalTitle(text);
				} else if(tag.equals("galPhotographyMonth")) {
					tour.setGalPhotographyMonth(text);
				} else if(tag.equals("galWebImageUrl")) {
					tour.setGalWebImageUrl(text);
				} else if(tag.equals("galSearchKeyword")) {
					tour.setGalSearchKeyword(text);
				} else if(tag.equals("item")) {
					tourList.add(tour);
				} 
			
			}
			event_type = xpp.next();
		}
		log.info("결과 = {}", tourList);
	}
} 


