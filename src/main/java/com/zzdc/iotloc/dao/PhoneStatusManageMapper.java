package com.zzdc.iotloc.dao;

import java.util.List;

import com.zzdc.iotloc.bean.PhoneStatusInfo;
import com.zzdc.iotloc.bean.UserInfo;

public interface PhoneStatusManageMapper {
	
	public List<PhoneStatusInfo> showPhoneStatusAllSN();
	public List<PhoneStatusInfo> showPhoneStatusBySN(PhoneStatusInfo phoneStatusInfo);
	public List<PhoneStatusInfo> showPhoneStatusAllUserId();
	public List<PhoneStatusInfo> showPhoneStatusByUser(UserInfo user);

}
