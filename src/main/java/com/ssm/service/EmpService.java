package com.ssm.service;
import java.util.List;

import org.springframework.stereotype.Service;

import com.ssm.bean.Employee;


@Service
public interface EmpService {

	public void addEmp(Employee employee);
	 
	 public Employee getOne(Integer id);
	 
	 public List<Employee> getAll();
	 
	 public void updateEmp(Employee employee);
	 
	 public void deleteEmp(Integer id);
}
