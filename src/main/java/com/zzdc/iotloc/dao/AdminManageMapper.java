package com.zzdc.iotloc.dao;

import java.util.List;

import com.zzdc.iotloc.bean.AdminInfo;

public interface AdminManageMapper {
	
	public List<AdminInfo> showAdminList();
	public void addAdmin(AdminInfo adminInfo);
	public List<AdminInfo> showAdminListByUser(AdminInfo adminInfo);
	public void deleteSelectedUserInfo(AdminInfo adminInfo);
	public void updateSeletedUserPassword(AdminInfo adminInfo);
	public void editSeletedUserInfo(AdminInfo adminInfo);
	public AdminInfo findSeletedUserByFoxId(AdminInfo adminInfo);
}
