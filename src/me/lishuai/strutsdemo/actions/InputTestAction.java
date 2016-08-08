package me.lishuai.strutsdemo.actions;

import com.opensymphony.xwork2.ActionSupport;

public class InputTestAction extends ActionSupport {
	
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
	
	public String execute() throws Exception{
		return SUCCESS;
	}
	
}
