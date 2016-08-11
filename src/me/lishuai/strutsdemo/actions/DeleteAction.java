package me.lishuai.strutsdemo.actions;

import java.io.File;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class DeleteAction extends ActionSupport {

	private String fileName;
	private String filePath;

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public String getFilePath(){
		return ServletActionContext.getServletContext().getRealPath("/" + filePath + "/");
	}
	
	public void setFilePath(String filePath){
		this.filePath = filePath;
	}
	
	public String execute() throws Exception {
		File file = new File(getFilePath() + getFileName());
		if(file.exists()){
			file.delete();
		}
		return null;
	}
	
}
