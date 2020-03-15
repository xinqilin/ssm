package com.ssm.bean;



public class Employee {
	private Integer id;
	private String lastName;
	private String email;
	private Integer gender;
	private Integer did;
	private Department department;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getGender() {
		return gender;
	}
	public void setGender(Integer gender) {
		this.gender = gender;
	}
	public Integer getDid() {
		return did;
	}
	public void setD_id(Integer did) {
		this.did = did;
	}
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	@Override
	public String toString() {
		return "Employee [id=" + id + ", lastName=" + lastName + ", email=" + email + ", gender=" + gender + ", d_id="
				+ did + ", department=" + department + "]";
	}
	
	
	
}
