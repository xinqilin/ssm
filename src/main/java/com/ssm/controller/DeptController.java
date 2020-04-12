package com.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.bean.Department;
import com.ssm.bean.Msg;
import com.ssm.mapper.DepartmentMapper;

@Controller
public class DeptController {
	
	@Autowired
	DepartmentMapper departmentMapper;
	
	
	@ResponseBody
	@GetMapping("/getDept")
	public Msg getDept() {
		List<Department> list=departmentMapper.selectByExample(null);
		return Msg.success().add("dept", list);
	}
	
}
