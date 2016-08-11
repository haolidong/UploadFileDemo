package me.lishuai.strutsdemo.actions;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 文件上传Action
 * 2016/08/06
 * @author Dangerous
 *
 */
public class UploadAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// 允许上传的图片类型
//	private String allowTypes = "image/png,image/jpg,image/jpeg,image/gif,image/ico,image/svg"; 
	private String allowTypes;
	
	// 文件标题请求参数
	private String title;
	
	// 文件域参数
	private File uploadFile;
	private String uploadFileContentType;
	private String uploadFileFileName;
	
	// 文件保存路径
//	private String savePath = "/upload";
	private String savePath;
	
	public String getAllowTypes(){
		return allowTypes;
	}
	
	public void setAlloTypes(String allowTypes){
		this.allowTypes = allowTypes;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public File getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(File uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getUploadFileContentType() {
		return uploadFileContentType;
	}

	public void setUploadFileContentType(String uploadFileContentType) {
		this.uploadFileContentType = uploadFileContentType;
	}

	public String getUploadFileFileName() {
		return uploadFileFileName;
	}

	public void setUploadFileFileName(String uploadFileFileName) {
		this.uploadFileFileName = uploadFileFileName;
	}

	public String getSavePath() {
		return ServletActionContext.getServletContext().getRealPath("/" + savePath + "/");
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	
	private String typeFilter(String imgType){
		String[] types = allowTypes.split(",");
		for(String type : types){
			if(type.equals(imgType)){
				return null;
			}
		}
		return ERROR;
	}
	
//	@Override
//	public void validate() {
//		if(typeFilter(getUploadFileContentType()) != null){
//			addFieldError("typeError", "不允许上传此格式图片");
//		}
//	}

	public String execute() throws Exception {
		FileOutputStream fos = new FileOutputStream(getSavePath() + getUploadFileFileName());
		FileInputStream fis = new FileInputStream(uploadFile);
		
		byte[] buffer = new byte[1024];
		int len = 0;
		while((len = fis.read(buffer)) > 0){
			fos.write(buffer, 0, len);
		}
		
		fis.close();
		fos.close();
		
		return SUCCESS;
	}
	
}
