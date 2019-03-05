package com.zzdc.iotloc.service;

import com.zzdc.iotloc.bean.AdminInfo;
import com.zzdc.iotloc.dao.UserLoginMapper;

public interface UserLoginService {

	public void setLoginMapper(UserLoginMapper loginMapper);
	public AdminInfo findIsUserExists(AdminInfo adminInfo);
}
