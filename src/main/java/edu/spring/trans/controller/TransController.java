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
import java.util.Locale;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import edu.spring.trans.domain.Trans;

@RestController
@RequestMapping(value = "/transDetail")
public class TransController {
	private static final Logger log = LoggerFactory.getLogger(TransController.class);
<<<<<<< HEAD
//	private static final String API_URL = "http://openapi.tago.go.kr/openapi/service/"; 
//	private static final String SERVICE_KEY = "&ServiceKey=qRLgxrGXbMAS4kHs3H7QQnnkbOBpR6AFleTjqOPlp%2FXQOltZfLU2H7YFZfHA%2Fq2HLQOZvhC6LmsYw2%2BWdoDELg%3D%3D"; 

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String trans(Locale locale, Model model) {
		
			
		return "";
=======
	private static final String API_URL = "http://openapi.tago.go.kr/openapi/service/"; 
	private static final String SERVICE_KEY = "&ServiceKey=qRLgxrGXbMAS4kHs3H7QQnnkbOBpR6AFleTjqOPlp%2FXQOltZfLU2H7YFZfHA%2Fq2HLQOZvhC6LmsYw2%2BWdoDELg%3D%3D"; 
														   
	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<List<Map<String, Object>>> ExpBusParser(
			@RequestParam Map<String, String> request) {
	log.info("ExpBusParser() 호출");
	log.info("depDate: {}", request.get("dep_date"));
	log.info("arrDate: {}", request.get("arr_date"));
	log.info("depCity: {}", request.get("depcity"));
	log.info("arrCity: {}", request.get("arrcity"));
	
	String city = request.get("arrcity");
	city = city.substring(0, city.length() - 1);
	
	log.info("도시이름: {}", city);
	
		List<Map<String, Object>> res_list = null;
        try {
        	//res_list = getOpenApi();
        } catch (Exception e) {
			/*
			 * public ResponseEntity<List<List<Trans>>> ExpBusParser() {
			 * log.info("ExpBusParser() 호출");
			 * 
			 * List<Trans> s_list = null; List<Trans> e_list = null; List<Trans> ktx_list =
			 * null; List<Trans> bhg_list = null; String oper1 = "SuburbsBusInfoService";
			 * String oper2 = "ExpBusInfoService"; Trans s_sendTrans = new
			 * Trans("SuburbsBusInfoService", "getStrtpntAlocFndSuberbsBusInfo",
			 * "NAI104600001", "NAI252600075", "20190730"); Trans e_sendTrans = new
			 * Trans("ExpBusInfoService", "getStrtpntAlocFndExpbusInfo", "NAEK010",
			 * "NAEK300", "20190730"); Trans t_sendTrans = new Trans("TrainInfoService",
			 * "getStrtpntAlocFndTrainInfo", "NAT010000", "NAT011668", "20190730"); Trans
			 * a_sendTrans = new Trans("DmstcFlightNvgInfoService",
			 * "getFlightOpratInfoList", "NAARKJJ", "NAARKPC", "20190730");
			 * 
			 * 
			 * try { s_list = getOpenApi(s_sendTrans); e_list = getOpenApi(e_sendTrans);
			 * ktx_list = getOpenApi(t_sendTrans); bhg_list = getOpenApi(a_sendTrans); }
			 * catch (Exception e) { >>>>>>> branch 'master' of
			 * https://github.com/YeongchanCho/Trans.git
			             e.printStackTrace();*/
        }
        List<List<Trans>> result = null;
		/*
		 * result.add(s_list); result.add(e_list); result.add(ktx_list);
		 * result.add(bhg_list);
		 */
        
        ResponseEntity<List<List<Trans>>> entity = new ResponseEntity<List<List<Trans>>>(result, HttpStatus.OK);
       
        
		return null;
    }

	private String getApiUrl(Trans sendTrans) throws Exception{
		log.info("getApiUrl() 호출");
		
		String encodeResult1 = URLEncoder.encode(sendTrans.getDepTerminalId(), "UTF-8");
		log.info("Encoder: {}", encodeResult1);
		String encodeResult2 = URLEncoder.encode(sendTrans.getArrTerminalId(), "UTF-8");
		log.info("Encoder: {}", encodeResult2);

		//String SERVICE_NAME = oper; 
		//String OPERATION = "getExpBusTrminlList"; 
		//String OPERATION = meth; 
		//String REQ_MESSAGE = "?terminalNm="; 
		//String REQ_MESSAGE = "?terminalNm=%EC%9D%B8%EC%B2%9C"; 
		String REQ_MESSAGE = "?depTerminalId" + "=" + encodeResult1 + "&arrTerminalId" + "=" + encodeResult2 + "&depPlandTime=" + sendTrans.getDepPlandTime(); 
		String url = API_URL + sendTrans.getInfoService() + "/" + sendTrans.getOper() + REQ_MESSAGE + SERVICE_KEY;
		
        log.info("url = {}", url);
        
        return url;
    }
	
	
//  String oper, String meth, String dep, String arr, String dTime
	public List<Trans> getOpenApi(Trans sendTrans) throws Exception {
		log.info("getOpenApi() 호출");
		
		List<Map<String, Object>> res_list = new ArrayList<Map<String, Object>>();
		
		URL url = null;
		if (sendTrans.getInfoService().equals("SuburbsBusInfoService")) {
			url = new URL(getApiUrl(sendTrans));
		} else if (sendTrans.getInfoService().equals("ExpBusInfoService")) {
			url = new URL(getApiUrl(sendTrans));
		} else if (sendTrans.getInfoService().equals("TrainInfoService")) {
			url = new URL(getApiUrl(sendTrans));
		} else if (sendTrans.getInfoService().equals("DmstcFlightNvgInfoService")) {
			url = new URL(getApiUrl(sendTrans));
		}
		
		XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
		factory.setNamespaceAware(true);
		XmlPullParser xpp = factory.newPullParser();
		BufferedInputStream bis = new BufferedInputStream(url.openStream());
		xpp.setInput(bis, "utf-8");
		
		return xmlparser(xpp);
		
		
		
	}
	
	public List<Trans> xmlparser(XmlPullParser xpp) throws Exception {
		
		List<Trans> res_list = new ArrayList<Trans>();
		
		String tag = null;
		int event_type = xpp.getEventType();
		
		String addr = null;
		Trans tempMap = null;
		while (event_type != XmlPullParser.END_DOCUMENT) {
			if (event_type == XmlPullParser.START_TAG) {
				tag = xpp.getName();
				if (tag.equals("item")) {
					tempMap = new Trans();
				}
			} else if (event_type == XmlPullParser.TEXT) {
				if (tag.equals("depPlandTime")) {
					tempMap.setDepPlandTime(xpp.getText());
				} else if (tag.equals("arrPlandTime")) {
					tempMap.setArrPlandTime(xpp.getText());
				} else if (tag.equals("charge")) {
					tempMap.setPrice(xpp.getText());
				}
			} else if (event_type == XmlPullParser.END_TAG) {
				tag = xpp.getName();
				if (tag.equals("item")) {
					res_list.add(tempMap);
				}
			}
			event_type = xpp.next();
		}
		log.info("결과 = {}", res_list.toString());
		
		return res_list;
>>>>>>> branch 'master' of https://github.com/YeongchanCho/Trans.git
	}
<<<<<<< HEAD
//	@RequestMapping(method = RequestMethod.GET)
//	public ResponseEntity<List<Map<String, Object>>> ExpBusParser() {
//		log.info("ExpBusParser() 호출");
//		
//		List<Map<String, Object>> res_list = null;
//        try {
//        	res_list = getOpenApi();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        
//        ResponseEntity<List<Map<String, Object>>> entity = 
//				new ResponseEntity<List<Map<String, Object>>>(res_list, HttpStatus.OK);
//
//		return entity;
//    }
//	
//	private String getApiUrl(String requestMessage) throws Exception{
//		log.info("getApiUrl() 호출");
//		
//		String encodeResult1 = URLEncoder.encode("NAEK010", "UTF-8");
//		log.info("Encoder: {}", encodeResult1);
//		String encodeResult2 = URLEncoder.encode("NAEK300", "UTF-8");
//		log.info("Encoder: {}", encodeResult2);
//
//		String SERVICE_NAME = "ExpBusInfoService/"; 
//		//String OPERATION = "getExpBusTrminlList"; 
//		String OPERATION = "getStrtpntAlocFndExpbusInfo"; 
//		//String REQ_MESSAGE = "?terminalNm="; 
//		//String REQ_MESSAGE = "?terminalNm=%EC%9D%B8%EC%B2%9C"; 
//		String REQ_MESSAGE = "?depTerminalId=" + encodeResult1 + "&arrTerminalId=" + encodeResult2 + "&depPlandTime=20190726"; 
//		String url = API_URL + SERVICE_NAME + OPERATION + REQ_MESSAGE + SERVICE_KEY;
//		
//		
//        if(requestMessage != null){
//        	url = url + requestMessage;
//        }
//        log.info("url = {}", url);
//        return url;
//    }
//	
//	
//	
//	public List<Map<String, Object>> getOpenApi() throws Exception {
//		log.info("getOpenApi() 호출");
//		
//		List<Map<String, Object>> res_list = new ArrayList<Map<String, Object>>();
//		
//		URL url = new URL(getApiUrl(null));
//		
//		XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
//		factory.setNamespaceAware(true);
//		XmlPullParser xpp = factory.newPullParser();
//		BufferedInputStream bis = new BufferedInputStream(url.openStream());
//		xpp.setInput(bis, "utf-8");
//		
//		String tag = null;
//		int event_type = xpp.getEventType();
//		
//		List<String> list = new ArrayList<String>();
//		
//		String addr = null;
//		Map<String, Object> tempMap = null;
//		while (event_type != XmlPullParser.END_DOCUMENT) {
//			if (event_type == XmlPullParser.START_TAG) {
//				tag = xpp.getName();
//				if (tag.equals("item")) {
//					tempMap = new HashMap<String, Object>();
//				}
//			} else if (event_type == XmlPullParser.TEXT) {
//				if (tag.equals("terminalId")) {
//					tempMap.put("terminalId", xpp.getText());
//					log.info("GET TEXT: {}", xpp.getText());
//				} else if (tag.equals("terminalNm")) {
//					tempMap.put("terminalNm", xpp.getText());
//				}
//			} else if (event_type == XmlPullParser.END_TAG) {
//				tag = xpp.getName();
//				if (tag.equals("item")) {
//					res_list.add(tempMap);
//				}
//			}
//			event_type = xpp.next();
//		}
//		log.info("결과 = {}", res_list);
//		/*
//		 * HttpHeaders responseHeaders = new HttpHeaders();
//		 * responseHeaders.add("Content-Type", "application/json; charset=UTF-8");
//		 */
//		return res_list;
//		
//	}
//	
	
	//@RequestMapping(method = RequestMethod.GET)
	/*public ResponseEntity<String> readAllReplies(HttpServletResponse response)
			throws XmlPullParserException, IOException {
		log.info("ResponseEntity() 호출");
		

		String apiUrl = "http://openapi.tago.go.kr/openapi/service/ExpBusInfoService/getExpBusTrminlList?terminalNm=%EC%9D%B8%EC%B2%9C&ServiceKey="
				+ "qRLgxrGXbMAS4kHs3H7QQnnkbOBpR6AFleTjqOPlp%2FXQOltZfLU2H7YFZfHA%2Fq2HLQOZvhC6LmsYw2%2BWdoDELg%3D%3D";

		URL url = new URL(apiUrl);

		//url = null;
		HttpURLConnection urlconnection = null;
		int responseCode = 0;
		BufferedReader br = null;
		String result = "";
		
		try {
			//url = new URL(apiUrl);
			urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			urlconnection.connect();

			// br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),
			// "UTF-8"));
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
			
			String line;
			while ((line = br.readLine()) != null) {
				result = result + line + "\n";
			}
			log.info("DATA: " + result);
			responseCode = urlconnection.getResponseCode();
			log.info("응답코드: " + responseCode);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 인터넷에 한글 안 깨지게 해주는 것
	      HttpHeaders responseHeaders = new HttpHeaders();
	      responseHeaders.add("Content-Type", "application/json; charset=UTF-8");
	      

		ResponseEntity<String> entity = new ResponseEntity<String>(result, HttpStatus.OK);

		return entity;
	}
*/
=======
>>>>>>> branch 'master' of https://github.com/YeongchanCho/Trans.git
}
