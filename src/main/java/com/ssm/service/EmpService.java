package com.ssm.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.bean.Employee;
import com.ssm.bean.EmployeeExample;
import com.ssm.bean.EmployeeExample.Criteria;
import com.ssm.mapper.EmployeeMapper;



@Service
public class EmpService {

	@Autowired
	EmployeeMapper empMapper;
	
	public List<Employee> getAll(){
//		return empMapper.selectByExampleWithDept(null);
		return empMapper.selectByExample(null);
	}
	
	public Employee getOne(Integer id) {
		return empMapper.selectByPrimaryKey(id);
	}
	
	
	public void addEmp(Employee employee) {
		empMapper.insertSelective(employee);
	}
	
	
	public boolean checkUser(String userName) {
		EmployeeExample example=new EmployeeExample();
		Criteria criteria=example.createCriteria();
		criteria.andEmpNameEqualTo(userName);
		long count=empMapper.countByExample(example);
		empMapper.countByExample(example);
//同名則count>0 
		return count==0;
	}
}
