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
import java.util.TreeMap;

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
   public ResponseEntity<List<Map<String, String>>> CitiesParser() {
      //log.info("CitiesParser() 호출");
      
      List<Map<String, String>> res_list = null;
        try {
           res_list = getOpenApi();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        ResponseEntity<List<Map<String, String>>> entity = 
            new ResponseEntity<>(res_list, HttpStatus.OK);

      return entity;
    }
   
   private String getApiUrl() throws Exception{
      //log.info("getApiUrl() 호출");
      
      String SERVICE_NAME = "ExpBusInfoService/"; 
      String OPERATION = "getCtyCodeList"; 
      String url = API_URL + SERVICE_NAME + OPERATION + SERVICE_KEY;
      
        //log.info("url = {}", url);
        
        return url;
    }
   
   
   
   public List<Map<String, String>> getOpenApi() throws Exception {
      //log.info("getOpenApi() 호출");
      
      URL url = new URL(getApiUrl());
      
      XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
      factory.setNamespaceAware(true);
      XmlPullParser xpp = factory.newPullParser();
      BufferedInputStream bis = new BufferedInputStream(url.openStream());
      xpp.setInput(bis, "utf-8");
      
      String tag = null;
      int event_type = xpp.getEventType();
      
      List<Map<String, String>> list = new ArrayList<>();
      Map<String, String> list1 = new TreeMap<>();
      Map<String, String> list2 = new TreeMap<>();
      
      String key = null;
      String value = null;
      while (event_type != XmlPullParser.END_DOCUMENT) {
         if (event_type == XmlPullParser.START_TAG) {
            tag = xpp.getName();
            //if (tag.equals("item")) {
               //tempMap = new HashMap<String, Object>();
            //}
         } else if (event_type == XmlPullParser.TEXT) {
            if (tag.equals("cityCode")) {
               key = xpp.getText();
            } else if (tag.equals("cityName")) {
               value = xpp.getText();
               //log.info("도시코드 {}", value);
               //log.info("도시명 {}", key);
               if (key.length() > 2) {
                  list2.put(value, key);
               } else {
                  list1.put(key, value);
               }
            } 
         } else if (event_type == XmlPullParser.END_TAG) {
            
         }
         event_type = xpp.next();
      }
      list.add(list1);
      list.add(list2);
      //log.info("결과 = {}", list);
      
      return list;
      
   }
}
