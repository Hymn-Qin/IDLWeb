package com.zzdc.iotloc.dao;

import com.zzdc.iotloc.bean.AdminInfo;

public interface UserLoginMapper {
	
	//myibats的mapper层
	//业务逻辑的dao层
	//userLogin Dao层
	public AdminInfo findUserIsExists(AdminInfo userInfo);//查询用户是否存在以及可用

}
