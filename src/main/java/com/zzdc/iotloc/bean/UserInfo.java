package com.zzdc.iotloc.bean;

public class UserInfo implements java.io.Serializable {
	
	private String usernum = "";
	private String name = "";
	private String age = "";
	private String sex = "";
	private String department = "";
	private String image_url = "";
    private String mobile = "";
    private String phone_borrow = "True";
    private String cardid;
	

	public String getPhone_borrow() {
		return phone_borrow;
	}

	public void setPhone_borrow(String phone_borrow) {
		this.phone_borrow = phone_borrow;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getUsernum() {
		return usernum;
	}

	public void setUsernum(String usernum) {
		this.usernum = usernum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}


	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getImage_url() {
		return image_url;
	}

	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}

	public String getCardid() {
		return cardid;
	}

	public void setCardid(String cardid) {
		this.cardid = cardid;
	}

}
