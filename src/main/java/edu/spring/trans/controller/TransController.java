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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Case;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

import edu.spring.trans.domain.Trans;

@RestController
@RequestMapping(value = "/transDetail")
public class TransController {
   private static final Logger log = LoggerFactory.getLogger(TransController.class);
   private static final String API_URL = "http://openapi.tago.go.kr/openapi/service/"; 
   private static final String SERVICE_KEY = "&ServiceKey=qRLgxrGXbMAS4kHs3H7QQnnkbOBpR6AFleTjqOPlp%2FXQOltZfLU2H7YFZfHA%2Fq2HLQOZvhC6LmsYw2%2BWdoDELg%3D%3D";
   private Trans requestData = new Trans();
   
   @RequestMapping(method = RequestMethod.GET)
   public ResponseEntity<List<List<Trans>>> getTransData(
         @RequestParam Map<String, String> request) { 
      log.info("getTransData() 호출");
      
      String depCity = request.get("depcity");
      log.info("depCity: {}", depCity);
      String arrCity = request.get("arrcity");
      log.info("arrCity: {}", arrCity);
      String depCityCode = request.get("depcitycode");
      log.info("depCityCode: {}", depCityCode);
      String arrCityCode = request.get("arrcitycode");
      log.info("arrCityCode: {}", arrCityCode);
      String depDate = request.get("dep_date");
      log.info("depDate: {}", depDate);
      String arrDate = request.get("arr_date");
      log.info("arrDate: {}", arrDate);
      
      try {
         requestData = new Trans(depDate, arrDate, depCity, arrCity);
         log.info("출발지 = {}", requestData.getDepCity());
         transParser(requestData, 1); // 1: 고속버스
         transParser(requestData, 2); // 2: KTX
         transParser(requestData, 3); // 3: 항공편
      } catch (Exception e) { 
           e.printStackTrace();
       }
      List<List<Trans>> result = new ArrayList<List<Trans>>();
      
      ResponseEntity<List<List<Trans>>> entity = new ResponseEntity<List<List<Trans>>>(result, HttpStatus.OK);
      
       return entity;
   }
   
   public List<List<Trans>> transParser(Trans requestData, int type) throws Exception {
      log.info("transParser(type = {})", type);
      List<Trans> depTerminal = new ArrayList<>(); // 출발도시 터미널 리스트
      List<Trans> arrTerminal = new ArrayList<>(); // 도착도시 터미널 리스트
      
      String depCity = requestData.getDepCity();
      log.info("depCity({})", depCity);
      String arrCity = requestData.getArrCity();
      String depCityC = trimString(depCity); // 출발도시명(필터링)
      String arrCityC = trimString(arrCity); // 도착도시명(필터링)
      
      String depURI = makeURL(depCityC); // 터미널ID 찾기 URL - with 도시코드 
      String arrURI = makeURL(arrCityC); // 터미널ID 찾기 URL - with 도시코드 
      
      switch (type) {
      case 1: // 고속버스
         depTerminal = searchTerminals(depCityC, depURI, type);
         arrTerminal = searchTerminals(arrCityC, arrURI, type);
         log.info("depCityCode: {}", depTerminal);
         log.info("arrCityCode: {}", arrTerminal);
         
         break;
      case 2:
         
         break;
      default:
         
         break;
      }
      
      List<Trans> bus_list = new ArrayList<Trans>();
      List<Trans> ktx_list = new ArrayList<Trans>();
      List<Trans> bhg_list = new ArrayList<Trans>();
   
       Trans e_sendTrans = new Trans("ExpBusInfoService", "getStrtpntAlocFndExpbusInfo", "NAEK010", "NAEK300", "20190730");
       Trans t_sendTrans = new Trans("TrainInfoService", "getStrtpntAlocFndTrainInfo", "NAT010000", "NAT011668", "20190730");
       Trans a_sendTrans = new Trans("DmstcFlightNvgInfoService", "getFlightOpratInfoList", "NAARKJJ", "NAARKPC", "20190730");
       //makeURL(1, requestData);
       try {
           //bus_list = getOpenApi(e_sendTrans);
           //ktx_list = getOpenApi(t_sendTrans);
           //bhg_list = getOpenApi(a_sendTrans);
        } catch (Exception e) { 
           e.printStackTrace();
        }
   
   
        List<List<Trans>> result = new ArrayList<List<Trans>>();
        result.add(bus_list);
        result.add(ktx_list);
        result.add(bhg_list);
   
           
        return result;
    }

   private String trimString(String str) {
      String result = str;
      result = str.substring(0, str.length() - 1);
      result = str.replace("특별", "");
      result = str.replace("광역", "");
      
      return result;
   }

   private String makeURL(String cityName) throws Exception {
      log.info("makeURL() 호출");
      StringBuilder urlBuilder = null;
         urlBuilder = new StringBuilder(API_URL + "ExpBusInfoService/getExpBusTrminlList");
         urlBuilder.append("?" + SERVICE_KEY);
         urlBuilder.append("&" + "numOfRows=50"); // 한 페이지 결과 수
         urlBuilder.append("&" + "terminalNm="); // query 도시코드 추가
         urlBuilder.append(cityName); // query 도시코드 추가
         log.info("urlBuilder = {}", urlBuilder);
      
      return urlBuilder.toString();
   }
   
   private List<Trans> searchTerminals(String cityName, String uri, int type) throws Exception {
      log.info("searchCityCode() 호출");
      BufferedInputStream bis = getOpenApi(uri);
      List<Trans> result = transXmlParser(null, bis, type);
      //List<String> cityCode = xmlData.get(xmlData.size() - 1).getCityCode();
      
      return result;
   }
   
   public BufferedInputStream getOpenApi(String uri) throws Exception {
      log.info("getOpenApi() 호출");
      URL url = new URL(uri);
      BufferedInputStream bis = new BufferedInputStream(url.openStream());
      
      return bis;
   }
   
   public List<Trans> transXmlParser(String cityName, BufferedInputStream bis, int type) throws Exception {

      List<Trans> res_list = new ArrayList<Trans>();
       XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
       factory.setNamespaceAware(true);
       XmlPullParser xpp = factory.newPullParser();
       xpp.setInput(bis, "utf-8");
       
       String keyTerminalId = "terminalId";
       String keyTerminalNm = "terminalNm";
       String keyCityName = "cityName";
       String keyCityCode = "cityCode";
       String keyArrTerminalId = "arrTerminalId";
       String keyValue1 = "";
       String keyValue2 = "";
       String keyValue3 = "";
       

      String tag = null;
      int event_type = xpp.getEventType();

       Trans tempMap = null;
       while (event_type != XmlPullParser.END_DOCUMENT) {
          if (event_type == XmlPullParser.START_TAG) {
               tag = xpp.getName();
               if (tag.equals("item")) {
                  tempMap = new Trans();
               }
          } else if (event_type == XmlPullParser.TEXT) {
             switch (type) {
              case 1:
                 keyValue1 = keyTerminalId;
                 keyValue2 = keyTerminalNm;
                 if (tag.equals(keyValue1)) {
                    tempMap.setTerminalId(xpp.getText());
                   } else if (tag.equals(keyValue2)) {
                      tempMap.setTerminalNm(xpp.getText());
                  }
                 break;
              case 2:
                 
                 break;
              default:
                 break;
              } // end switch
               
          } else if (event_type == XmlPullParser.END_TAG) {
             tag = xpp.getName();
               if (tag.equals("item")) {
                  res_list.add(tempMap);
               }
          }
          event_type = xpp.next();
       } // end while
         log.info("결과 = {}", res_list.toString());

         return res_list;
      }

   private String getApiUrl(Trans sendTrans) throws Exception{
         log.info("getApiUrl() 호출");

         String encodeResult1 = URLEncoder.encode(sendTrans.getDepTerminalId(), "UTF-8");
         log.info("Encoder: {}", encodeResult1);
         String encodeResult2 = URLEncoder.encode(sendTrans.getArrTerminalId(), "UTF-8");
         log.info("Encoder: {}", encodeResult2);

         String REQ_MESSAGE;
         String url = null;


         if (sendTrans.getInfoService().equals("ExpBusInfoService")) {
            REQ_MESSAGE = "?depTerminalId" + "=" + encodeResult1 + "&arrTerminalId" + "=" + encodeResult2 + "&depPlandTime=" + sendTrans.getDepPlandTime(); 
            url = API_URL + sendTrans.getInfoService() + "/" + sendTrans.getOper() + REQ_MESSAGE + SERVICE_KEY;

            log.info("url = {}", url);
         } else if (sendTrans.getInfoService().equals("TrainInfoService")) {
            REQ_MESSAGE = "?depPlaceId" + "=" + encodeResult1 + "&arrPlaceId" + "=" + encodeResult2 + "&depPlandTime=" + sendTrans.getDepPlandTime(); 
            url = API_URL + sendTrans.getInfoService() + "/" + sendTrans.getOper() + REQ_MESSAGE + SERVICE_KEY;

            log.info("url = {}", url);
         } else if (sendTrans.getInfoService().equals("DmstcFlightNvgInfoService")) {
            REQ_MESSAGE = "?depAirportId" + "=" + encodeResult1 + "&arrAirportId" + "=" + encodeResult2 + "&depPlandTime=" + sendTrans.getDepPlandTime(); 
            url = API_URL + sendTrans.getInfoService() + "/" + sendTrans.getOper() + REQ_MESSAGE + SERVICE_KEY;

            log.info("url = {}", url);
         }

         return url;
      }

      

      

   }