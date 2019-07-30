package edu.spring.trans.controller;

import java.io.BufferedInputStream;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<List<List<Trans>>> ExpBusParser() {
		log.info("ExpBusParser() 호출");

		List<Trans> e_list = null;
		List<Trans> ktx_list = null;
		List<Trans> bhg_list = null;

		Trans e_sendTrans = new Trans("ExpBusInfoService", "getStrtpntAlocFndExpbusInfo", "NAEK010", "NAEK300", "20190730");
		Trans t_sendTrans = new Trans("TrainInfoService", "getStrtpntAlocFndTrainInfo", "NAT010000", "NAT011668", "20190730");
		Trans a_sendTrans = new Trans("DmstcFlightNvgInfoService", "getFlightOpratInfoList", "NAARKJJ", "NAARKPC", "20190730");


		try {
			e_list = getOpenApi(e_sendTrans);
			ktx_list = getOpenApi(t_sendTrans);
			bhg_list = getOpenApi(a_sendTrans);
		} catch (Exception e) { 
			e.printStackTrace();
		}


		List<List<Trans>> result = new ArrayList<List<Trans>>();
		result.add(e_list);
		result.add(ktx_list);
		result.add(bhg_list);

		ResponseEntity<List<List<Trans>>> entity = new ResponseEntity<List<List<Trans>>>(result, HttpStatus.OK);


		return entity;
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

	public List<Trans> getOpenApi(Trans sendTrans) throws Exception {
		log.info("getOpenApi() 호출");
		
		URL url;
		url = new URL(getApiUrl(sendTrans));
		XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
		factory.setNamespaceAware(true);
		XmlPullParser xpp = factory.newPullParser();
		BufferedInputStream bis = new BufferedInputStream(url.openStream());
		xpp.setInput(bis, "utf-8");
		
		if (sendTrans.getInfoService().equals("ExpBusInfoService")) {
			return busParser(xpp);
		} else if (sendTrans.getInfoService().equals("TrainInfoService")) {
			return trainParser(xpp);
		} else {
			return airParser(xpp);
		}
	}

	public List<Trans> busParser(XmlPullParser xpp) throws Exception {
		List<Trans> res_list = new ArrayList<Trans>();

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
			    if (tag.equals("depPlaceNm")) {
			    	tempMap.setDepTerminalId(xpp.getText());
			    } else if (tag.equals("arrPlaceNm")) {
			    	tempMap.setArrTerminalId(xpp.getText());
			    } else if (tag.equals("depPlandTime")) {
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
	}

	public List<Trans> trainParser(XmlPullParser xpp) throws Exception {
		List<Trans> res_list = new ArrayList<Trans>();

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
				if (tag.equals("depplacename")) {
			    	tempMap.setDepTerminalId(xpp.getText());
			    } else if (tag.equals("arrplacename")) {
			    	tempMap.setArrTerminalId(xpp.getText());
			    } else if (tag.equals("depplandtime")) {
					tempMap.setDepPlandTime(xpp.getText());
				} else if (tag.equals("arrplandtime")) {
					tempMap.setArrPlandTime(xpp.getText());
				} else if (tag.equals("adultcharge")) {
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
	}

	public List<Trans> airParser(XmlPullParser xpp) throws Exception {
		List<Trans> res_list = new ArrayList<Trans>();

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
				if (tag.equals("depAirportNm")) {
			    	tempMap.setDepTerminalId(xpp.getText());
			    } else if (tag.equals("arrAirportNm")) {
			    	tempMap.setArrTerminalId(xpp.getText());
			    } else if (tag.equals("depPlandTime")) {
					tempMap.setDepPlandTime(xpp.getText());
				} else if (tag.equals("arrPlandTime")) {
					tempMap.setArrPlandTime(xpp.getText());
				} else if (tag.equals("economyCharge")) {
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
	}

}
