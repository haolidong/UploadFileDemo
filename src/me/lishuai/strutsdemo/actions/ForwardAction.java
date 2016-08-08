package me.lishuai.strutsdemo.actions;

import com.opensymphony.xwork2.ActionSupport;

public class ForwardAction extends ActionSupport {
	private String pageName;

	public String getPageName() {
		return pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}
	
	public String execute(){
		return SUCCESS;
	}
}
