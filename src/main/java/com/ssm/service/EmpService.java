package com.ssm.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.bean.Employee;
import com.ssm.mapper.EmployeeMapper;


@Service
public class EmpService {

	@Autowired
	EmployeeMapper empMapper;
	
	public List<Employee> getAll(){
		return empMapper.selectByExampleWithDept(null);
	}
}
