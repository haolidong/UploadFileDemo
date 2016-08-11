package me.lishuai.strutsdemo.action;

import com.opensymphony.xwork2.ActionSupport;

public class DemoAction extends ActionSupport {

	private String userName;
	private String password;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String execute() throws Exception {
		System.out.println("userName:" + getUserName() + " password:" + getPassword());
		return SUCCESS;
	}
}
