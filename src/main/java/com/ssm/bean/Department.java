package com.ssm.bean;

public class Department {
    private Integer Id;

    private String departmentName;
    
    public Department() {
		// TODO Auto-generated constructor stub
	}
    
    

	public Department(Integer id, String departmentName) {
		super();
		Id = id;
		this.departmentName = departmentName;
	}



	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}




}