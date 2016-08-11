package me.lishuai.strutsdemo.actions;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class LoadAction extends ActionSupport {

	private String fileDir;
	private InputStream inputStream;
	
	public String getFileDir(){
		return ServletActionContext.getServletContext().getRealPath("/" + fileDir + "/");
	}
	
	public void setFileDir(String fileDir){
		this.fileDir = fileDir;
	}
	
	public InputStream getResult(){
		return inputStream;
	}
	
	public String execute() throws Exception {
		File[] files = new File(getFileDir()).listFiles();
		int count = files.length;
		String result = "{\"total\":";
		result += count;
		result += ",\"items\":[";
		for(int i = 0; i < count; ++i){
			File file = files[i];
			result += "{";
			result += "\"name\":\"" + file.getName() + "\",";
			result += "\"time\":\"" + parseDate(file.lastModified()) + "\",";
			result += "\"src\":\"" + (fileDir + "/" + file.getName()) + "\"";
			result += "}";
			if(i != count - 1){
				result += ",";
			}
		}
		result += "]}";
		
		inputStream = new ByteArrayInputStream(result.getBytes("UTF-8"));
		return SUCCESS;
	}
	
	private String parseDate(long time){
		Date date = new Date(time);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(date);
	}
	
}
