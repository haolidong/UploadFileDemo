package me.lishuai.strutsdemo.actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	// 封装请求的username和password
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
	
	public String registe(){
		return ERROR;
	}
	
	public String login(){
		if(getUserName().equals("dangerous") && getPassword().equals("dangerous")){
			ActionContext.getContext().getSession().put("user", getUserName());
			return SUCCESS;
		}else{
			return ERROR;
		}
	}
	
	// 定义用户请示的方法
	public String execute(){
		if(getUserName().equals("haolidong") && getPassword().equals("haolidong")){
			ActionContext.getContext().getSession().put("user", getUserName());
			return SUCCESS;
		}else{
			return ERROR;
		}
	}
}
