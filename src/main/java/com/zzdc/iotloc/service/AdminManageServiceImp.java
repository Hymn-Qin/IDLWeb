package com.zzdc.iotloc.service;

import java.util.List;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzdc.iotloc.bean.AdminInfo;
import com.zzdc.iotloc.dao.AdminManageMapper;

public class AdminManageServiceImp implements AdminManageService {

	private AdminManageMapper adminManageMapper;
	@Override
	public List<AdminInfo> showAdminList(PageInfo<?> pageInfo) {
		PageHelper.startPage(pageInfo.getNextPage(), 10);
		return this.adminManageMapper.showAdminList();
	}

	@Override
	public void setAdminManageMapper(AdminManageMapper adminManageMapper) {
		this.adminManageMapper = adminManageMapper;
	}

	@Override
	public void addAdmin(AdminInfo adminInfo) {
		this.adminManageMapper.addAdmin(adminInfo);
	}

	@Override
	public List<AdminInfo> showAdminListByUser(AdminInfo adminInfo,PageInfo<?> pageInfo) {
		PageHelper.startPage(pageInfo.getNextPage(), 10);
		return this.adminManageMapper.showAdminListByUser(adminInfo);
	}
	
	@Override
	public void deleteUser(AdminInfo adminInfo) {
		//PageHelper.startPage(pageInfo.getNextPage(), 10);
		this.adminManageMapper.deleteSelectedUserInfo(adminInfo);
	}
	
	@Override
	public void updateUserPassword(AdminInfo adminInfo){
		this.adminManageMapper.updateSeletedUserPassword(adminInfo);
	}
	
	@Override
	public void editUserInfo(AdminInfo adminInfo){
		this.adminManageMapper.editSeletedUserInfo(adminInfo);
	}
	
	@Override
	public AdminInfo findUserByFoxId(AdminInfo adminInfo){
		return (AdminInfo) this.adminManageMapper.findSeletedUserByFoxId(adminInfo);
	}

}
