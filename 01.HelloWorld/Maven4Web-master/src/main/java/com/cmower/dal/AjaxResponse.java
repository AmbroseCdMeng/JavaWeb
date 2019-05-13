package com.cmower.dal;


public class AjaxResponse extends BaseEntity<AjaxResponse> {

	/**
	 * 状态码
	 */
	private int statusCode;
	
	/**
	 * 信息
	 */
	private String message;
	
	/**
	 * 重定向地址
	 */
	private String forwardUrl;
	
	/**
	 * 字段
	 */
	private String field;

	public int getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getForwardUrl() {
		return forwardUrl;
	}

	public void setForwardUrl(String forwardUrl) {
		this.forwardUrl = forwardUrl;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}
	
}
