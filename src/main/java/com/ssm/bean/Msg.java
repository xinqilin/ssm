package com.ssm.bean;

import java.util.HashMap;
import java.util.Map;

public class Msg {

	private Integer code;
	private String msg;
	private Map<String,Object> returnMap=new HashMap<>();
	
	
	public static Msg success() {
		Msg msg=new Msg();
		msg.setCode(100);
		msg.setMsg("成功");
		return msg;
	}
	
	public static Msg fail() {
		Msg msg=new Msg();
		msg.setCode(200);
		msg.setMsg("失敗");
		return msg;
	}
	
	public Msg add(String str,Object obj) {
		this.getReturnMap().put(str, obj);
		return this;
	}
	
	
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Map<String, Object> getReturnMap() {
		return returnMap;
	}
	public void setReturnMap(Map<String, Object> returnMap) {
		this.returnMap = returnMap;
	}
	
	
}
