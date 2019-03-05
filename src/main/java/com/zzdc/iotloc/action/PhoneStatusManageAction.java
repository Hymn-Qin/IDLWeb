package com.zzdc.iotloc.action;

import java.util.ArrayList;
import java.util.List;

import com.github.pagehelper.PageInfo;
import com.opensymphony.xwork2.ActionContext;
import com.zzdc.iotloc.bean.AdminInfo;
import com.zzdc.iotloc.bean.PhoneStatusInfo;
import com.zzdc.iotloc.bean.UserInfo;
import com.zzdc.iotloc.service.PhoneStatusManageService;

public class PhoneStatusManageAction {
	
	private PhoneStatusInfo phoneStatusInfo;
	private List<PhoneStatusInfo> listPhone;
	private PhoneStatusManageService phoneStatusManageService;
	private PageInfo<?> pageInfo;
	private UserInfo user;
	
	public UserInfo getUser() {
		return user;
	}
	public void setUser(UserInfo user) {
		this.user = user;
	}
	public PageInfo<?> getPageInfo() {
		return pageInfo;
	}
	public void setPageInfo(PageInfo<?> pageInfo) {
		this.pageInfo = pageInfo;
	}
	public PhoneStatusInfo getPhoneStatusInfo() {
		return phoneStatusInfo;
	}
	public void setPhoneStatusInfo(PhoneStatusInfo phoneStatusInfo) {
		this.phoneStatusInfo = phoneStatusInfo;
	}
	public List<PhoneStatusInfo> getListPhone() {
		return listPhone;
	}
	public void setListPhone(List<PhoneStatusInfo> listPhone) {
		this.listPhone = listPhone;
	}
	public PhoneStatusManageService getPhoneStatusManageService() {
		return phoneStatusManageService;
	}
	public void setPhoneStatusManageService(PhoneStatusManageService phoneStatusManageService) {
		this.phoneStatusManageService = phoneStatusManageService;
	}
	
	
	public String showPhoneStatusAllSN(){
		String str = "nosession";
		AdminInfo adminInfo = (AdminInfo)ActionContext.getContext().getSession().get("loginUser");
		if(adminInfo!=null&&adminInfo.getUser_foxconn_id()!=null){
			if(this.pageInfo!=null){
				
			}else{
				this.pageInfo = new PageInfo();
				this.pageInfo.setNextPage(1);
			}
			PhoneStatusManageService phoneStatusManageService = null;
			phoneStatusManageService = this.getPhoneStatusManageService();
			List<PhoneStatusInfo> list = phoneStatusManageService.showPhoneStatusAllSN(pageInfo);
			PageInfo<?> page = new PageInfo(list);
			this.setListPhone(list);
			this.setPageInfo(page);
			str = "success";
		}else{
			str = "fail";
		}
		return str;
	}
	
	public String showPhoneStatusBySN(){
		String str = "nosession";
		AdminInfo adminInfo = (AdminInfo)ActionContext.getContext().getSession().get("loginUser");
		if(adminInfo!=null&&adminInfo.getUser_foxconn_id()!=null){
			if(this.pageInfo!=null){
				
			}else{
				this.pageInfo = new PageInfo();
				this.pageInfo.setNextPage(1);
			}
			PhoneStatusManageService phoneStatusManageService = null;
			phoneStatusManageService = this.getPhoneStatusManageService();
			List<PhoneStatusInfo> listPhone = new ArrayList();
			if(this.phoneStatusInfo == null){
				listPhone = phoneStatusManageService.showPhoneStatusAllSN(pageInfo);
			}else{
				PhoneStatusInfo ps = this.getPhoneStatusInfo();
				ps.setSn(this.getPhoneStatusInfo().getSn());
				listPhone = phoneStatusManageService.showPhoneStatusBySN(ps,pageInfo);
			}
			this.setListPhone(listPhone);
			this.setPageInfo(pageInfo);
			str = "success";
		}else{
			str = "fail";
		}
		return str;
	}
	
	public String showPhoneStatusAllUserId(){
		String str = "nosession";
		AdminInfo adminInfo = (AdminInfo)ActionContext.getContext().getSession().get("loginUser");
		if(adminInfo!=null&&adminInfo.getUser_foxconn_id()!=null){
			if(this.pageInfo!=null){
				
			}else{
				this.pageInfo = new PageInfo();
				this.pageInfo.setNextPage(1);
			}
			PhoneStatusManageService phoneStatusManageService = null;
			phoneStatusManageService = this.getPhoneStatusManageService();
			
			List<PhoneStatusInfo> list = phoneStatusManageService.showPhoneStatusByAllUser(pageInfo);
			PageInfo<?> page = new PageInfo(list);
			this.setListPhone(list);
			this.setPageInfo(page);
			str = "success";
		}else{
			str = "fail";
		}
		return str;
	}
	
	
	public String showPhoneStatusByUser(){
		String str = "nosession";
		AdminInfo adminInfo = (AdminInfo)ActionContext.getContext().getSession().get("loginUser");
		if(adminInfo!=null&&adminInfo.getUser_foxconn_id()!=null){
			if(this.pageInfo!=null){
				
			}else{
				this.pageInfo = new PageInfo();
				this.pageInfo.setNextPage(1);
			}
			PhoneStatusManageService phoneStatusManageService = null;
			phoneStatusManageService = this.getPhoneStatusManageService();
			List<PhoneStatusInfo> listPhone = new ArrayList();
			if(this.user == null){
				listPhone = phoneStatusManageService.showPhoneStatusByAllUser(pageInfo);
			}else{
				UserInfo user = this.getUser();
				user.setUsernum(this.getUser().getUsernum());
				user.setName(this.getUser().getName());
				listPhone = phoneStatusManageService.showPhoneStatusByUser(user,pageInfo);
			}
			this.setListPhone(listPhone);
			this.setPageInfo(pageInfo);
			str = "success";
		}else{
			str = "fail";
		}
		return str;
	}


}
