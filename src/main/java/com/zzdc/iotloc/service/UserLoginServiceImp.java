package com.zzdc.iotloc.service;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.zzdc.iotloc.bean.AdminInfo;
import com.zzdc.iotloc.dao.UserLoginMapper;

public class UserLoginServiceImp implements UserLoginService {

	private static final Logger LOGGER = LogManager
			.getLogger(UserLoginServiceImp.class);
	private UserLoginMapper loginMapper;
	
	@Override
	public AdminInfo findIsUserExists(AdminInfo adminInfo) {
		// TODO Auto-generated method stub
		LOGGER.info("findIsUserExists");
		return loginMapper.findUserIsExists(adminInfo);
	}

	@Override
	public void setLoginMapper(UserLoginMapper loginMapper) {
		// TODO Auto-generated method stub
		this.loginMapper = loginMapper;
	}

}
