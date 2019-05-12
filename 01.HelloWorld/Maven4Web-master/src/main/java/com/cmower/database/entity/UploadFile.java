package com.cmower.database.entity;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.cmower.common.Constants;
import com.cmower.common.Variables;
import com.cmower.common.exception.OrderException;
import com.cmower.dal.DataEntity;

/**
 * 文件上传
 * 
 * @author MengChengdu
 *
 */
@SuppressWarnings("serial")
public class UploadFile extends DataEntity<UploadFile> {

	/**
	 * 保存客户端提交到服务器端的文件目录
	 */
	private String uploadPath;

	/**
	 * 上传文件的原始文件名
	 */
	private String originalFileName;

	/**
	 * 上传文件保存的文件名（防止原始文件名重复导致覆盖，所以生成唯一id）
	 */
	private String fileName;

	/**
	 * 上传文件完整文件名（客户端可以访问的路径，含服务器目录+文件名）
	 */
	private String completeName;

	/**
	 * 文件大小
	 */
	private Long fileSize;

	/**
	 * 客户端提交到服务器的参数名（例如 Form 表单中 type='file' 的区域的 name 等）
	 */
	private String parameterName;

	/**
	 * 上传到服务器中的文件对象
	 */
	private MultipartFile multipartFile;

	/**
	 * 空参构造
	 */
	public UploadFile() {
		super();
	}

	/**
	 * 带参构造
	 * @param parameterName
	 * @param uploadPath
	 * @param originalFileName
	 * @param fileName
	 * @param multipartFile
	 */
	public UploadFile(String parameterName, String uploadPath, String originalFileName, String fileName,
			MultipartFile multipartFile) {
		this.parameterName = parameterName;
		this.uploadPath = uploadPath;
		this.originalFileName = originalFileName;
		this.fileName = fileName;
		this.multipartFile = multipartFile;
		
		this.fileSize = multipartFile.getSize();
		this.completeName = Variables.ctx + "/" + Constants.DEFAULT_UPLOAD + "/" + fileName;
	}
	
	/**
	 * 获取文件对象
	 * @return
	 */
	public File getFile() {
		if (uploadPath == null || fileName == null) {
			return null;
		}
		return new File(uploadPath + File.separator + fileName);
	}
	
	/**
	 * 保存文件
	 */
	public void transferTo() {
		try {
			File file = getFile();
			this.multipartFile.transferTo(file);
		} catch (IllegalStateException | IOException e) {
			throw new OrderException(e);
		}
	}

	public String getUploadPath() {
		return uploadPath;
	}

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getCompleteName() {
		return completeName;
	}

	public void setCompleteName(String completeName) {
		this.completeName = completeName;
	}

	public Long getFileSize() {
		return fileSize;
	}

	public void setFileSize(Long fileSize) {
		this.fileSize = fileSize;
	}

	public String getParameterName() {
		return parameterName;
	}

	public void setParameterName(String parameterName) {
		this.parameterName = parameterName;
	}

	public MultipartFile getMultipartFile() {
		return multipartFile;
	}

	public void setMultipartFile(MultipartFile multipartFile) {
		this.multipartFile = multipartFile;
	}
	
	
	
}
