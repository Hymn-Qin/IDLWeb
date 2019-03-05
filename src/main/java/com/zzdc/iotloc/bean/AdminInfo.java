package com.zzdc.iotloc.bean;

import java.io.Serializable;

public class AdminInfo implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;//admin表id 
	private String user_foxconn_id;//工号
	private String user_name;//用户名
    private String user_password;//密码 使用md5加密 加密码为zzdcfile_system
    private String user_mail;//用户Email
	private String create_date;//用户创建日期
	private String user_role ;//用户权限 
	


	public AdminInfo(){
		
	}
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public String getUser_role() {
		return user_role;
	}


	public void setUser_role(String user_role) {
		this.user_role = user_role;
	}
	
    public String getUser_foxconn_id() {
		return user_foxconn_id;
	}
	public void setUser_foxconn_id(String user_foxconn_id) {
		this.user_foxconn_id = user_foxconn_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_mail() {
		return user_mail;
	}
	public void setUser_mail(String user_mail) {
		this.user_mail = user_mail;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}

	

}
