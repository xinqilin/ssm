package com.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.bean.Employee;
import com.ssm.service.EmpService;

@ResponseBody
@Controller
public class EmpController {

	
	@Autowired
	EmpService empService;
	

	
	

}
