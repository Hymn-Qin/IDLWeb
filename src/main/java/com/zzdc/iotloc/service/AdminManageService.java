package com.zzdc.iotloc.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.zzdc.iotloc.bean.AdminInfo;
import com.zzdc.iotloc.dao.AdminManageMapper;

public interface AdminManageService {
	
	public List<AdminInfo> showAdminList(PageInfo<?> pageInfo);
	public void addAdmin(AdminInfo adminInfo);
	public List<AdminInfo> showAdminListByUser(AdminInfo adminInfo, PageInfo<?> pageInfo);
	public void setAdminManageMapper(AdminManageMapper adminManageMapper);
	public void deleteUser(AdminInfo adminInfo);
	public void updateUserPassword(AdminInfo adminInfo);
	public void editUserInfo(AdminInfo adminInfo);
	public AdminInfo findUserByFoxId(AdminInfo adminInfo);
}
