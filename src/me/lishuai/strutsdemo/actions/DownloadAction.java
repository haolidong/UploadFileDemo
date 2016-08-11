package me.lishuai.strutsdemo.actions;

import java.io.InputStream;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class DownloadAction extends ActionSupport {
	
	private String inputPath;
	
	public String getInputPath() {
		return inputPath;
	}

	public void setInputPath(String inputPath) {
		this.inputPath = inputPath;
	}
	
	public InputStream getTargetFile() throws Exception {
		return ServletActionContext.getServletContext().getResourceAsStream(inputPath);
	}

	public String execute() throws Exception {
		// TODO : 权限检查
		
		return SUCCESS;
	}
	
}

