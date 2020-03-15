package com.ssm.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ssm.bean.Employee;


//spring 內建
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration()
public class DBTest {
 
	@Autowired
	Employee employee;
	
	@Test
	public void testCRUD() {
		ApplicationContext ioc=new ClassPathXmlApplicationContext("applicationContext.xml");
//		Emp bean=ioc.getBean();
	}
	
	
	
}
