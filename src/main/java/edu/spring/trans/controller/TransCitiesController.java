package edu.spring.trans.controller;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

@RestController
@RequestMapping(value = "/transCities")
public class TransCitiesController {
	private static final Logger log = LoggerFactory.getLogger(TransCitiesController.class);
	private static final String API_URL = "http://openapi.tago.go.kr/openapi/service/"; 
	private static final String SERVICE_KEY = "?ServiceKey=qRLgxrGXbMAS4kHs3H7QQnnkbOBpR6AFleTjqOPlp%2FXQOltZfLU2H7YFZfHA%2Fq2HLQOZvhC6LmsYw2%2BWdoDELg%3D%3D"; 

	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<List<String>> CitiesParser() {
		log.info("CitiesParser() 호출");
		
		List<String> res_list = null;
        try {
        	res_list = getOpenApi();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        ResponseEntity<List<String>> entity = 
				new ResponseEntity<List<String>>(res_list, HttpStatus.OK);

		return entity;
    }
	
	private String getApiUrl() throws Exception{
		log.info("getApiUrl() 호출");
		
		String SERVICE_NAME = "ExpBusInfoService/"; 
		String OPERATION = "getCtyCodeList"; 
		String url = API_URL + SERVICE_NAME + OPERATION + SERVICE_KEY;
		
        log.info("url = {}", url);
        
        return url;
    }
	
	
	
	public List<String> getOpenApi() throws Exception {
		log.info("getOpenApi() 호출");
		
		List<String> res_list = new ArrayList<String>();
		
		URL url = new URL(getApiUrl());
		
		XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
		factory.setNamespaceAware(true);
		XmlPullParser xpp = factory.newPullParser();
		BufferedInputStream bis = new BufferedInputStream(url.openStream());
		xpp.setInput(bis, "utf-8");
		
		String tag = null;
		int event_type = xpp.getEventType();
		
		List<String> list = new ArrayList<String>();
		
		String addr = null;
		while (event_type != XmlPullParser.END_DOCUMENT) {
			if (event_type == XmlPullParser.START_TAG) {
				tag = xpp.getName();
				//if (tag.equals("item")) {
					//tempMap = new HashMap<String, Object>();
				//}
			} else if (event_type == XmlPullParser.TEXT) {
				if (tag.equals("cityName")) {
					list.add(xpp.getText());
					log.info("도시명 {}", xpp.getText());
				} 
			} else if (event_type == XmlPullParser.END_TAG) {
				/*
				 * tag = xpp.getName(); if (tag.equals("item")) { res_list.add(tempMap); }
				 */
			}
			event_type = xpp.next();
		}
		log.info("결과 = {}", list);
		/*
		 * HttpHeaders responseHeaders = new HttpHeaders();
		 * responseHeaders.add("Content-Type", "application/json; charset=UTF-8");
		 */
		return list;
		
	}
}

