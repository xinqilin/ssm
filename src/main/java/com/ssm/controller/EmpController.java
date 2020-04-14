package com.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.bean.Employee;
import com.ssm.bean.Msg;
import com.ssm.service.EmpService;

//@ResponseBody
@Controller
public class EmpController {

	@Autowired
	EmpService empService;

	@ResponseBody
	@PostMapping("/checkUserName")
	public Msg checkUserName(@RequestParam("userName") String userName) {
		boolean b = empService.checkUser(userName);
		return b ? Msg.success() : Msg.fail();
	}

//	@RequestMapping(value="/addEmp",method=RequestMethod.POST)
	@ResponseBody
	@PostMapping("/addEmp")
	public Msg addEmp(Employee employee) {
		System.out.println(" enter controller");
		empService.addEmp(employee);
		System.out.println(" add done!");
		return Msg.success();
	}

//	ajax寫法
	@ResponseBody
	@GetMapping("/getAllReturnJson")
	public Msg getAllReturnJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {

		// 每頁
		PageHelper.startPage(pn, 5);
		List<Employee> list = empService.getAll();

		// 下標顯示多少頁
		PageInfo<Employee> pageInfo = new PageInfo<Employee>(list, 3);
//		model.addAttribute("pageInfo", pageInfo);
		return Msg.success().add("pageInfo", pageInfo);
	}

//	頁面跳轉
//	@GetMapping("/getAll")
	public String getAll(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {

		// 每頁
		PageHelper.startPage(pn, 5);
		List<Employee> list = empService.getAll();

		// 下標顯示多少頁
		PageInfo<Employee> pageInfo = new PageInfo<Employee>(list, 3);
		model.addAttribute("pageInfo", pageInfo);
//		System.out.println("size:"+list.size()+",   list is empty?"+list.isEmpty());
//		System.out.println(pageInfo);
//		System.out.println("pageInfo: "+pageInfo.getNavigatepageNums());
		return "list";
	}

}
