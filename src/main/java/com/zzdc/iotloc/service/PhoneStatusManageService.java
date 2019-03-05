package com.zzdc.iotloc.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.zzdc.iotloc.bean.PhoneStatusInfo;
import com.zzdc.iotloc.bean.UserInfo;
import com.zzdc.iotloc.dao.PhoneStatusManageMapper;

public interface PhoneStatusManageService {
	
	public List<PhoneStatusInfo> showPhoneStatusAllSN(PageInfo<?> pageInfo);
	public List<PhoneStatusInfo> showPhoneStatusBySN(PhoneStatusInfo phoneStatusInfo, PageInfo<?> pageInfo);
	
	public List<PhoneStatusInfo> showPhoneStatusByAllUser(PageInfo<?> pageInfo);
	public List<PhoneStatusInfo> showPhoneStatusByUser(UserInfo user, PageInfo<?> pageInfo);
	public void setPhoneStatusManageMapper(PhoneStatusManageMapper phoneStatusManageMapper);
	

}
