package test;

import org.junit.Before;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.portlet.MockActionRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;


@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations= {"classpath:applicationContext.xml","file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml"})
public class MVCTest2 {
	
	@Autowired
	WebApplicationContext context;
	
	MockMvc mockMvc;
	
	
	//junit的before 每次用都要先init
	@Before
	public void initMvc() {
		mockMvc=MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	public void testPage() {
//		mockMvc.perform(MockMvcRequestBuilders.get("/getAll"));
	}

}
