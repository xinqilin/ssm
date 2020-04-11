package com.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.bean.Employee;
import com.ssm.service.EmpService;

//@ResponseBody
@Controller
public class EmpController {

	
	@Autowired
	EmpService empService;

//	@GetMapping("/emp{id}")
//	public Employee getOneEmp(@PathVariable("id") Integer id) {
//		Employee e=empService.getOne(id);
//		return empService.getOne(id);
//	}
	
	@GetMapping("/getAll")
	public String getAll(@RequestParam(value="pn",defaultValue="1") Integer pn,Model model) {
		
		//每頁
		PageHelper.startPage(pn, 5);
		List<Employee> list=empService.getAll();
		
		//下標顯示多少頁
		PageInfo<Employee> pageInfo=new PageInfo<Employee>(list,3);
		model.addAttribute("pageInfo",pageInfo);
//		System.out.println("size:"+list.size()+",   list is empty?"+list.isEmpty());
//		System.out.println(pageInfo);
//		System.out.println("pageInfo: "+pageInfo.getNavigatepageNums());
		return "list";
	}


}
