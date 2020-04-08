package test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.ssm.bean.Employee;
import com.github.pagehelper.PageInfo;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = { "classpath:applicationContext.xml",
		"file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml" })
public class MVCTest {

	// 傳入springMVC ioc容器
	@Autowired
	WebApplicationContext context;

	// fake(virtual) MVC request
	MockMvc mocMvc;

	@Before
	public void initMoKcMvc() {
		mocMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}

	@Test
	@SuppressWarnings("unchecked")
	public void testPage() throws Exception {
		// 模擬拿到的return vale
		MvcResult result = mocMvc.perform(MockMvcRequestBuilders.get("/getAll").param("pageNumber", "1")).andReturn();
		// 請求成功後，會拿到pageInfo
		MockHttpServletRequest request = result.getRequest();
		PageInfo<Employee> page = (PageInfo<Employee>) request.getAttribute("pageInfo");
		System.out.println("當前頁碼" + page.getPageNum());
		System.out.println("總頁碼" + page.getPages());
		System.out.println("請筆數" + page.getTotal());
		System.out.println("在頁面需要連續顯示的頁碼");
		for (int i : page.getNavigatepageNums()) {
			System.out.println(" " + i);
		}

//	 		get employee info
		List<Employee> emps = page.getList();
		for (Employee emp : emps) {
			System.out.println("id:" + emp.getEmpId() + "==>name:" + emp.getEmpName());
		}
	}
}
