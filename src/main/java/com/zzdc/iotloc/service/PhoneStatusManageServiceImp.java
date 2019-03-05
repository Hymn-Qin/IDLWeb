package com.zzdc.iotloc.service;

import java.util.List;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzdc.iotloc.bean.PhoneStatusInfo;
import com.zzdc.iotloc.bean.UserInfo;
import com.zzdc.iotloc.dao.PhoneStatusManageMapper;

public class PhoneStatusManageServiceImp implements PhoneStatusManageService {

	private PhoneStatusManageMapper phoneStatusManageMapper;
	
	@Override
	public List<PhoneStatusInfo> showPhoneStatusAllSN(PageInfo<?> pageInfo) {
		PageHelper.startPage(pageInfo.getNextPage(), 10);
		return this.phoneStatusManageMapper.showPhoneStatusAllSN();
	}

	public PhoneStatusManageMapper getPhoneStatusManageMapper() {
		return phoneStatusManageMapper;
	}
	@Override
	public void setPhoneStatusManageMapper(PhoneStatusManageMapper phoneStatusManageMapper) {
		this.phoneStatusManageMapper = phoneStatusManageMapper;
	}

	@Override
	public List<PhoneStatusInfo> showPhoneStatusByAllUser(PageInfo<?> pageInfo) {
		PageHelper.startPage(pageInfo.getNextPage(), 10);
		return this.phoneStatusManageMapper.showPhoneStatusAllUserId();
	}

	@Override
	public List<PhoneStatusInfo> showPhoneStatusBySN(PhoneStatusInfo phoneStatusInfo,PageInfo<?> pageInfo) {
		PageHelper.startPage(pageInfo.getNextPage(), 10);
		return this.phoneStatusManageMapper.showPhoneStatusBySN(phoneStatusInfo);
	}

	@Override
	public List<PhoneStatusInfo> showPhoneStatusByUser(UserInfo user, PageInfo<?> pageInfo) {
		PageHelper.startPage(pageInfo.getNextPage(), 10);
		return this.phoneStatusManageMapper.showPhoneStatusByUser(user);
	}
	

}
