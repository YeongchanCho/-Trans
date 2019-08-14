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
import java.net.URLConnection;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.TreeMap;

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
   //private static final String SERVICE_KEY = "serviceKey=qRLgxrGXbMAS4kHs3H7QQnnkbOBpR6AFleTjqOPlp%2FXQOltZfLU2H7YFZfHA%2Fq2HLQOZvhC6LmsYw2%2BWdoDELg%3D%3D";
   //private static final String SERVICE_KEY = "serviceKey=dO2ePGmIl0dGNr0cnSQJSUqbD5C0gOm3RrF3VjHIJkgvDN9gPh6PRR4MHQKZAbrFGVoZ%2FLCHGXd2Hp1ygdk1Vw%3D%3D";
   private static final String SERVICE_KEY = "serviceKey=fxvu96zF2DmVmewwVNGBggD4TwFMXNj%2FeoBLL%2BhjQGSLKDg3I2bpRgYOJX%2Fru%2BdaSVVzVK%2FILWq0MKGEMCv77A%3D%3D";
   //private static final String SERVICE_KEY = "serviceKey=RAlsTVJZFcNfsDWCPPNGcNKEOZ2QCPnM3YhnyXLymNQpiuPmFoop2bfNl8OcptYeKZrfciRsAceW5WYXQ4wanw%3D%3D";
   private static final String SERVICE_KEY_CODE = SERVICE_KEY.replace("serviceKey", "");
   private Trans requestData = new Trans();
   private List<List<Trans>> responseData = new ArrayList<List<Trans>>();
   int count = 0;

   @RequestMapping(method = RequestMethod.GET)
   public ResponseEntity<List<List<Trans>>> getTransData(@RequestParam Map<String, String> request) {
      //log.info("getTransData() 호출");

      String depCity = request.get("depcity");
      String arrCity = request.get("arrcity");
      String depCityCode = request.get("depcitycode");
      String arrCityCode = request.get("arrcitycode");
      String depDate = request.get("dep_date");
      //      String arrDate = request.get("arr_date");

      try {
         requestData.setDepCity(depCity);
         requestData.setArrCity(arrCity);
         requestData.setDepPlandTime(depDate);
         requestData.setDepCityCode(depCityCode);
         requestData.setArrCityCode(arrCityCode);
         //log.info("requestData = {}", requestData);

		 transParser(requestData, 1); // 1: 고속버스
//		 log.info("버스-responseData = {}", responseData);
         transParser(requestData, 2); // 2: KTX
//         log.info("열차-responseData = {}", responseData);
         transParser(requestData, 3); // 3: 항공편
//         log.info("비행기-responseData = {}", responseData);
      } catch (Exception e) {
         e.printStackTrace();
      }

      log.info("responseData = {}", responseData);
      List<List<Trans>> result = new ArrayList<>(); 
      result = responseData;
      responseData = new ArrayList<List<Trans>>();
      ResponseEntity<List<List<Trans>>> entity = new ResponseEntity<>(result, HttpStatus.OK);

      return entity;
   }

   public List<Trans> transParser(Trans requestData, int type) throws Exception {
      //log.info("transParser(type = {})", type);
      List<Trans> depTerminal = new ArrayList<>(); // 출발도시 터미널 리스트
      List<Trans> arrTerminal = new ArrayList<>(); // 도착도시 터미널 리스트
      List<Trans> result = new ArrayList<>(); // 출.도착지 버스 정보 결과를 담을 변수

      String depCity = requestData.getDepCity();
      String arrCity = requestData.getArrCity();
      String depCityC = trimString(depCity); // 출발도시명(필터링)
      String arrCityC = trimString(arrCity); // 도착도시명(필터링)
      Trans sendTrans = new Trans(); // 출.도착지 버스 정보 추출을 위한 매개변수
      String depPTime = requestData.getDepPlandTime(); // 출발날짜
      sendTrans.setDepPlandTime(depPTime); // 매개변수(sendTrans)에 출발날짜 추가
      String chargeURL = null;

      switch (type) {
      case 1: // 고속버스
         String depURI = makeURL(depCityC, null, type); // 터미널ID 찾기 URL - with 도시코드
         String arrURI = makeURL(arrCityC, null, type); // 터미널ID 찾기 URL - with 도시코드
         depTerminal = searchTerminals(depCityC, depURI, type); // 출발도시 터미널 리스트
         arrTerminal = searchTerminals(arrCityC, arrURI, type); // 도착도시 터미널 리스트
         responseData.add(depTerminal); // 최종 리턴값에 출발도시 터미널 리스트 추가
         responseData.add(arrTerminal); // 최종 리턴값에 도착도시 터미널 리스트 추가

         //depPTime = requestData.getDepPlandTime(); // 출발날짜
         String depTID = null;
         String arrTID = null;
            for (Trans depT : depTerminal) {
               depTID = depT.getTerminalId(); // 출발지 터미널ID
               sendTrans.setDepTerminalId(depTID); // 매개변수(sendTrans)에 출발지 터미널ID 추가
               for (Trans arrT : arrTerminal) {
                  arrTID = arrT.getTerminalId(); // 도착지 터미널ID
                  sendTrans.setArrTerminalId(arrTID); // 매개변수(sendTrans)에 도착지 터미널ID 추가
                  chargeURL = makeURL(null, sendTrans, type); // 매개변수(sendTrans)를 이용한 출.도착지 버스 정보 URL 주소 추출
                  log.info("고속버스_chargeURL::: {}", chargeURL);
                  result = transXmlParser(null, getOpenApi(chargeURL), 11); // 출발지 터미널별 도착지 터미널들의 버스 정보(요금 포함)
                  //log.info("BusInfoList.Size::: {}", result.size());
                  if (result.size() != 0) { // 출발 터미널과 도착 터미널간의 버스 정보가 있다면 콘솔출력해서 확인
                     log.info("BusInfoURL::: {}", chargeURL);
                     String depTermNm = result.get(0).getDepCity(); // 출발터미널
                     String depPlandTime = result.get(0).getDepPlandTime(); // 출발시간
                     String arrPlaceNm = result.get(0).getArrCity(); // 도착터미널
                     String arrPlandTime = result.get(0).getArrPlandTime(); //도착시간
                     String charge = result.get(0).getPrice(); // 버스 요금
                     String grade = result.get(0).getGradeNm(); // 버스 등급
//                     log.info("depTermNm::: {}", depTermNm);
//                     log.info("depPlandTime::: {}", depPlandTime);
//                     log.info("arrPlaceNm::: {}", arrPlaceNm);
//                     log.info("arrPlandTime::: {}", arrPlandTime);
//                     log.info("charge::: {}", charge);
//                     log.info("grade::: {}", grade);
                     responseData.add(result);
                  }
               }
            }
         break;
      case 2:
         String depCityCode = requestData.getDepCityCode();
         String arrCityCode = requestData.getArrCityCode();
         if (depCityCode.length() > 2) {
            depCityCode = findState(depCityC);
         }
         if (arrCityCode.length() > 2) {
            arrCityCode = findState(arrCityC);
         }
         depURI = makeURL(depCityCode, null, type); // 출발역 ID 찾기 URL - with 도시코드
         arrURI = makeURL(arrCityCode, null, type); // 도착역 ID 찾기 URL - with 도시코드
         depTerminal = searchTerminals(depCityC, depURI, type); // 출발역 목록
         arrTerminal = searchTerminals(arrCityC, arrURI, type); // 도착역 목록
         responseData.add(depTerminal); // 최종 리턴값에 출발도시 기차역 리스트 추가
         responseData.add(arrTerminal); // 최종 리턴값에 도착도시 기차역 리스트 추가
            for (Trans depT : depTerminal) {
               depTID = depT.getTerminalId(); // 출발지 기차역ID
               sendTrans.setDepTerminalId(depTID); // 매개변수(sendTrans)에 출발지 기차역ID 추가
               for (Trans arrT : arrTerminal) {
                  arrTID = arrT.getTerminalId(); // 도착지 기차역ID
                  sendTrans.setArrTerminalId(arrTID); // 매개변수(sendTrans)에 도착지 기차역ID 추가
                  chargeURL = makeURL(null, sendTrans, type); // 매개변수(sendTrans)를 이용한 출.도착지 기차 정보 URL 주소 추출
                  log.info("열차_chargeURL::: {}", chargeURL);
                  result = transXmlParser(null, getOpenApi(chargeURL), 21); // 출발지 터미널별 도착지 터미널들의 버스 정보(요금 포함)
                  //log.info("BusInfoList.Size::: {}", result.size());
                  if (result.size() != 0) { // 출발 터미널과 도착 터미널간의 버스 정보가 있다면 콘솔출력해서 확인
                     log.info("TRAINInfoURL::: {}", chargeURL);
                     String depTermNm = result.get(0).getDepCity(); // 출발터미널
                     String depPlandTime = result.get(0).getDepPlandTime(); // 출발시간
                     String arrPlaceNm = result.get(0).getArrCity(); // 도착터미널
                     String arrPlandTime = result.get(0).getArrPlandTime(); //도착시간
                     String charge = result.get(0).getPrice(); // 버스 요금
                     String grade = result.get(0).getGradeNm(); // 버스 등급
//                     log.info("depTermNm::: {}", depTermNm);
//                     log.info("depPlandTime::: {}", depPlandTime);
//                     log.info("arrPlaceNm::: {}", arrPlaceNm);
//                     log.info("arrPlandTime::: {}", arrPlandTime);
//                     log.info("charge::: {}", charge);
//                     log.info("grade::: {}", grade);
                     responseData.add(result);
//                     break loop;
                  }
               }
            }
         break;
         
      case 3:
    	  depCityC = URLDecoder.decode(depCityC, "UTF-8"); // 찾고자 하는 출발지
          arrCityC = URLDecoder.decode(arrCityC, "UTF-8"); // 찾고자 하는 도착지
          
          String depAirportCode = getAirportCode(depCityC).get(0);
          String arrAirportCode = getAirportCode(arrCityC).get(0);
          String depAirportName = getAirportCode(depCityC).get(1);
          String arrAirportName = getAirportCode(arrCityC).get(1);
          Trans dterminal = new Trans();
          Trans aterminal = new Trans();
//          dterminal.setTerminalId(depAirportName);
//          aterminal.setTerminalId(arrAirportName);
//          depTerminal.add(dterminal); // 공항목록
//          arrTerminal.add(aterminal); // 공항목록
          
          String uri = API_URL + "DmstcFlightNvgInfoService/getArprtList?" + SERVICE_KEY;
          log.info("air_URL: " + uri);
          depTerminal = searchTerminals(depAirportName, uri, 3);
          arrTerminal = searchTerminals(arrAirportName, uri, 4);
          
          responseData.add(depTerminal);
          responseData.add(arrTerminal);
          
          sendTrans.setDepTerminalId(depAirportCode);
          sendTrans.setArrTerminalId(arrAirportCode);
         
          chargeURL = getApiUrl(sendTrans, "DmstcFlightNvgInfoService");
          
         result = transXmlParser(null, getOpenApi(chargeURL), 31);
         responseData.add(result);
      default:

         break;
      }

      return result;
   }

   private List<String> getAirportCode(String cityC) throws Exception {
	   List<String> getAirport = new ArrayList<>();
	   String airportCode = "";
	   String airportName = "";
	   String anotherCityCode = "";
	   if (cityC.equals("대구")) {
		   airportCode = "NAARKTN";
		   airportName = "대구";
       } else
       if (cityC.equals("울산")) {
    	   airportCode = "NAARKPU";
		   airportName = "울산";
       } else
       if (cityC.equals("광주")) {
    	   airportCode = "NAARKJJ";
		   airportName = "광주";
       } else
    	   if (cityC.equals("부산")) {
    		   airportCode = "NAARKPK";
    		   airportName = "김해";
       } else
       if (cityC.equals("제주")) {
    	   airportCode = "NAARKPC";
		   airportName = "제주";
       } else
       if (cityC.equals("서울") || cityC.equals("인천")) {
    	   airportCode = "NAARKSS";
		   airportName = "김포";
       } else
       if (cityC.equals("세종") || cityC.equals("대전")) {
    	   airportCode = "NAARKTU";
		   airportName = "청주";
       } else {
    	   anotherCityCode = findState(cityC);
    	   if (anotherCityCode.equals("31")) {
    		   airportCode = "NAARKSS";
    		   airportName = "김포";
    	   } else if (anotherCityCode.equals("32")) {
    		   airportCode = "NAARKNY";
    		   airportName = "양양";
    	   } else if (anotherCityCode.equals("33")) {
    		   airportCode = "NAARKTU";
    		   airportName = "청주";
    	   } else if (anotherCityCode.equals("34")) {
    		   airportCode = "NAARKTU";
    		   airportName = "청주";
    	   } else if (anotherCityCode.equals("35")) {
    		   airportCode = "NAARKJK";
    		   airportName = "군산";
    	   } else if (anotherCityCode.equals("36")) {
    		   airportCode = "NAARKJY";
    		   airportName = "여수";
    	   } else if (anotherCityCode.equals("37")) {
    		   airportCode = "NAARKPK";
    		   airportName = "김해";
    	   } else if (anotherCityCode.equals("38")) {
    		   airportCode = "NAARKPK";
    		   airportName = "김해";
    	   }
       }
    	   
	   getAirport.add(airportCode);
       getAirport.add(airportName);
	   
	return getAirport;
}

private String findState(String depCityC) throws Exception {
      String doc = null;
      String uri = "https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=" + depCityC;
      URL url = new URL(uri);
      URLConnection uc = url.openConnection();

      InputStreamReader input = new InputStreamReader(uc.getInputStream());
      BufferedReader in = new BufferedReader(input);
      String inputLine;
      StringBuilder documents = new StringBuilder();

      while ((inputLine = in.readLine()) != null) {
         documents.append(inputLine).append("\n");
      }
      doc = documents.toString().split("local_name nomore\"><h3>")[1].split(" ")[0];
      String cityCode = "";
      //System.out.println(doc);
      in.close();
      Map<String, String> state = new TreeMap<>();
      state.put("경기도", "31");
      state.put("강원도", "32");
      state.put("충정북도", "33");
      state.put("충청남도", "34");
      state.put("전라북도", "35");
      state.put("전라남도", "36");
      state.put("경상북도", "37");
      state.put("경상남도", "38");
      Iterator<String> iterator = state.keySet().iterator();
      while(iterator.hasNext()){
         String key = iterator.next();
         if(doc.equals(key)){
            cityCode = state.get(key);
         }
      }

      return cityCode;
   }

   private String trimString(String str) throws Exception {
      //log.info("trimString() 호출");
      str = str.substring(0, str.length() - 1);
      str = str.replace("특별", "");
      str = str.replace("광역", "");
      str = URLEncoder.encode(str, "UTF-8");

      return str;
   }

   private String makeURL(String cityName, Trans sendTrans, int type) throws Exception {
      //log.info("makeURL() 호출");
      String result = "";
      StringBuilder urlBuilder = null;

      switch (type) {
      case 1:
         urlBuilder = new StringBuilder(API_URL + "ExpBusInfoService/getExpBusTrminlList");
         urlBuilder.append("?" + SERVICE_KEY);

         if (cityName != null) {
            urlBuilder.append("&" + "numOfRows=50"); // 한 페이지 결과 수
            urlBuilder.append("&" + "terminalNm="); // query 도시코드 추가
            urlBuilder.append(cityName); // query 도시코드 추가
            result = urlBuilder.toString();
            log.info("버스_resultURL = {}", result);
         } else {
            result = getApiUrl(sendTrans, "ExpBusInfoService"); // 출.도착지 버스정보 추출용 URL
         }
         break;
      case 2:
         urlBuilder = new StringBuilder(API_URL + "TrainInfoService/getCtyAcctoTrainSttnList");
         urlBuilder.append("?" + SERVICE_KEY);

         if (cityName != null) {
            urlBuilder.append("&cityCode=" + cityName);
            urlBuilder.append("&" + "numOfRows=80");
            result = urlBuilder.toString();
            log.info("열차_resultURL = {}", result);
         } else {
            result = getApiUrl(sendTrans, "TrainInfoService");
         }
         break;
      
      }
      return result;
   }

   private List<Trans> searchTerminals(String cityName, String uri, int type) throws Exception {
      //log.info("searchTerminals() 호출");
      BufferedInputStream bis = getOpenApi(uri);
      List<Trans> result = transXmlParser(cityName, bis, type);

      return result;
   }

   public BufferedInputStream getOpenApi(String uri) throws Exception {
      //log.info("getOpenApi() 호출");
      URL url = new URL(uri);
      BufferedInputStream bis = new BufferedInputStream(url.openStream());

      return bis;
   }

   public List<Trans> transXmlParser(String cityName, BufferedInputStream bis, int type) throws Exception {
      log.info("transXmlParser() cityName = {}", cityName);

      List<Trans> res_list = new ArrayList<Trans>();
      XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
      factory.setNamespaceAware(true);
      XmlPullParser xpp = factory.newPullParser();
      xpp.setInput(bis, "utf-8");

      int type1 = 0;
      if (type == 11) {
         type = 1;
         type1 = 11;
      } else if (type == 21) {
         type = 2;
         type1 = 21;
      } else if (type == 31) {
         type = 3;
         type1 = 31;
      }

      String airportId = null;
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
               if (type1 != 11) {
                  if (tag.equals("terminalId")) {
                	 tempMap.setInfoService("BUS");
                     tempMap.setOper(cityName);
                     tempMap.setTerminalId(xpp.getText());
                  } else if (tag.equals("terminalNm")) {
                     tempMap.setTerminalNm(xpp.getText());
                  }
               } else {
                  if (tag.equals("arrPlaceNm")) {
                     tempMap.setArrCity(xpp.getText());
                     tempMap.setInfoService("bus");
                  } else if (tag.equals("arrPlandTime")) {
                     tempMap.setArrPlandTime(xpp.getText());
                  } else if (tag.equals("charge")) {
                     tempMap.setPrice(xpp.getText());
                  } else if (tag.equals("depPlaceNm")) {
                     tempMap.setDepCity(xpp.getText());
                  } else if (tag.equals("depPlandTime")) {
                     tempMap.setDepPlandTime(xpp.getText());
                  } else if (tag.equals("gradeNm")) {
                     tempMap.setGradeNm(xpp.getText());
                  } 
               }

               break;
            case 2:
               if (type1 != 21) {
                  if (tag.equals("nodeid")) {
                	 tempMap.setInfoService("TRAIN");
                     tempMap.setOper(cityName);
                     tempMap.setTerminalId(xpp.getText());
                  } else if (tag.equals("nodename")) {
                     tempMap.setTerminalNm(xpp.getText());
                  }
               } else {
                  if (tag.equals("arrplacename")) {
                     tempMap.setArrCity(xpp.getText());
                     tempMap.setInfoService("train");
                  } else if (tag.equals("arrplandtime")) {
                     tempMap.setArrPlandTime(xpp.getText());
                  } else if (tag.equals("adultcharge")) {
                     tempMap.setPrice(xpp.getText());
                  } else if (tag.equals("depplacename")) {
                     tempMap.setDepCity(xpp.getText());
                  } else if (tag.equals("depplandtime")) {
                     tempMap.setDepPlandTime(xpp.getText());
                  } else if (tag.equals("traingradename")) {
                     tempMap.setGradeNm(xpp.getText());
                  } 
               }

               break;
            case 3:
               if (type1 != 31) {
                  if (tag.equals("airportId")) {
                	 airportId = xpp.getText();
                  }
                  if (tag.equals("airportNm")) {
                	  //log.info("paser= {}", xpp.getText());
                	  if (xpp.getText().equals(cityName)) {
                		 log.info("sameV= {}", xpp.getText());
                 		 tempMap.setInfoService("AIRPLANE");
                 		 tempMap.setOper(URLEncoder.encode(cityName, "UTF-8"));
                 		 tempMap.setTerminalId(airportId);
                 		 tempMap.setTerminalNm(xpp.getText());
                 		 tempMap.setDepCity(cityName);
                 	 }
                  }
               } else {
                  if (tag.equals("arrAirportNm")) {
                     tempMap.setArrCity(xpp.getText());
                     tempMap.setInfoService("air");
                  } else if (tag.equals("arrPlandTime")) {
                     tempMap.setArrPlandTime(xpp.getText());
                  } else if (tag.equals("economyCharge")) {
                     tempMap.setPrice(xpp.getText());
                  } else if (tag.equals("depAirportNm")) {
                     tempMap.setDepCity(xpp.getText());
                  } else if (tag.equals("depPlandTime")) {
                     tempMap.setDepPlandTime(xpp.getText());
                  } else if (tag.equals("airlineNm")) {
                	  tempMap.setGradeNm(xpp.getText());
                  }
                  //log.info("tempMap = {}", tempMap);
               }
               break;
            default:
            	if (tag.equals("airportId")) {
               	 airportId = xpp.getText();
                 }
                 if (tag.equals("airportNm")) {
               	  //log.info("paser= {}", xpp.getText());
               	  if (xpp.getText().equals(cityName)) {
               		 log.info("sameV= {}", xpp.getText());
                		 tempMap.setInfoService("AIRPLANE");
                		 tempMap.setOper(URLEncoder.encode(cityName, "UTF-8"));
                		 tempMap.setTerminalId(airportId);
                		 tempMap.setTerminalNm(xpp.getText());
                		 tempMap.setArrCity(cityName);
                	 }
                 }
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
      log.info("타입: {}, 결과 = {}", type, res_list.toString());

      return res_list;
   }

   private String getApiUrl(Trans sendTrans, String infoServiceName) throws Exception {
      //log.info("getApiUrl() 호출");

      StringBuilder urlBuilder = null;
      if (sendTrans.getDepTerminalId() == null || sendTrans.getArrTerminalId() == null || sendTrans.getDepPlandTime() == null) {
    	  return "";
      }
      String encodeResult1 = URLEncoder.encode(sendTrans.getDepTerminalId(), "UTF-8"); // 출발지 터미널 ID
      String encodeResult2 = URLEncoder.encode(sendTrans.getArrTerminalId(), "UTF-8"); // 도착지 터미널 ID
      String encodeResult3 = URLEncoder.encode(sendTrans.getDepPlandTime(), "UTF-8"); // 출발 날짜

      String REQ_MESSAGE;
      String url = null;

      if (infoServiceName.equals("ExpBusInfoService")) {
         urlBuilder = new StringBuilder("http://openapi.tago.go.kr/openapi/service/ExpBusInfoService/getStrtpntAlocFndExpbusInfo"); /*URL*/
         urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + SERVICE_KEY_CODE); /* Service Key */
         urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /* 한 페이지 결과 수 */
         urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 페이지 번호 */
         urlBuilder.append("&" + URLEncoder.encode("depTerminalId", "UTF-8") + "=" + URLEncoder.encode(encodeResult1, "UTF-8")); /* 출발터미널ID */
         urlBuilder.append("&" + URLEncoder.encode("arrTerminalId", "UTF-8") + "=" + URLEncoder.encode(encodeResult2, "UTF-8")); /* 도착터미널ID */
         urlBuilder.append("&" + URLEncoder.encode("depPlandTime", "UTF-8") + "=" + URLEncoder.encode(encodeResult3, "UTF-8")); /* 출발일 */
         // urlBuilder.append("&" + URLEncoder.encode("busGradeId","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*버스등급ID*/
         count ++;
         log.info("BUS::API 접속 횟수 = {}", count);
      } else if (infoServiceName.equals("TrainInfoService")) {
         REQ_MESSAGE = "?depPlaceId" + "=" + encodeResult1 + "&arrPlaceId" + "=" + encodeResult2 + "&depPlandTime="
               + sendTrans.getDepPlandTime();
         url = API_URL + infoServiceName + "/" + "getStrtpntAlocFndTrainInfo" + REQ_MESSAGE + "&" + SERVICE_KEY;
         urlBuilder = new StringBuilder();
         urlBuilder.append(url);
         urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
         
         log.info("Train::url = {}", urlBuilder.toString());
      } else if (infoServiceName.equals("DmstcFlightNvgInfoService")) { 
         REQ_MESSAGE = "?depAirportId" + "=" + encodeResult1 + "&arrAirportId" + "=" + encodeResult2 + "&depPlandTime=" 
        		 + encodeResult3 + "&numOfRows=200&pageNo=1"; 
         url = API_URL + infoServiceName + "/" + "getFlightOpratInfoList" + REQ_MESSAGE + "&" + SERVICE_KEY;
         urlBuilder = new StringBuilder();
         urlBuilder.append(url);

         log.info("Air::url = {}", urlBuilder.toString());
      }

      return urlBuilder.toString();
   }

}