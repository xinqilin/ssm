package test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ssm.bean.Employee;
import com.ssm.mapper.DepartmentMapper;
import com.ssm.mapper.EmployeeMapper;

//spring 內建
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class DBTest {

	@Autowired
	EmployeeMapper employeeMapper;
	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	SqlSession sqlsession;

	@Test
	public void testCRUD() {
		
//		ApplicationContext ioc=new ClassPathXmlApplicationContext("applicationContext.xml");
//		EmployeeMapper bean=(EmployeeMapper) ioc.getBean(EmployeeMapper.class);
//		System.out.println(bean);
//		employeeMapper.insertSelective(new Employee(null, "Jerry", 1, "Jerry@qq.com", 1001));
		
//		---above success---
		
		EmployeeMapper mapper = (EmployeeMapper) sqlsession.getMapper(EmployeeMapper.class);
		for (int i = 0; i < 20; i++) {
			String uid = UUID.randomUUID().toString().substring(0, 5) + i;
			mapper.insertSelective(new Employee(null,uid,0,uid+"@gmail.com",1000+i%6));
		}
		System.out.println("success");

	}
}
