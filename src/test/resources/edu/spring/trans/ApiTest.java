package edu.spring.trans;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" }
		)
@WebAppConfiguration
public class ApiTest {
	
	String url = "http://kosis.kr/kosisapi/service/IndicatorService/IndListSearchRequest?STAT_JIPYO_NM=%EA%B0%95%EC%88%98%EB%9F%89&ServiceKey="
			+ "qRLgxrGXbMAS4kHs3H7QQnnkbOBpR6AFleTjqOPlp%2FXQOltZfLU2H7YFZfHA%2Fq2HLQOZvhC6LmsYw2%2BWdoDELg%3D%3D";

}
