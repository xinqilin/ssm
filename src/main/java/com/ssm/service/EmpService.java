package com.ssm.service;
import java.util.List;

import com.ssm.bean.Employee;

public interface EmpService {

	public void addEmp(Employee employee);
	 
	 public Employee getOne(Integer id);
	 
	 public List<Employee> getAll();
	 
	 public void updateEmp(Employee employee);
	 
	 public void deleteEmp(Integer id);
}
