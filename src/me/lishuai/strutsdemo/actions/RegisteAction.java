package me.lishuai.strutsdemo.actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class RegisteAction extends ActionSupport {
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
	
	public String execute(){
		if(getUserName().equals("dangerous") && getPassword().equals("dangerous")){
			ActionContext.getContext().getSession().put("user", getUserName());
			return SUCCESS;
		}else{
			return ERROR;
		}
	}
}
