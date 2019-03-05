package com.zzdc.iotloc.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.github.pagehelper.PageInfo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.zzdc.iotloc.bean.AdminInfo;
import com.zzdc.iotloc.service.AdminManageService;
import com.zzdc.iotloc.util.JavaTool;

public class AdminManageAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = LogManager.getLogger(AdminManageAction.class);
	private AdminInfo admin;
	private AdminManageService adminManageService;
	private List<AdminInfo> adminList;
	private PageInfo pageInfo;
	
	public PageInfo getPageInfo() {
		return pageInfo;
	}


	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}


	public List<AdminInfo> getAdminList() {
		return adminList;
	}


	public void setAdminList(List<AdminInfo> adminList) {
		this.adminList = adminList;
	}


	public AdminInfo getAdmin() {
		return admin;
	}


	public void setAdmin(AdminInfo admin) {
		this.admin = admin;
	}


	public AdminManageService getAdminManageService() {
		return adminManageService;
	}


	public void setAdminManageService(AdminManageService adminManageService) {
		this.adminManageService = adminManageService;
	}


	
	
	public String showAdminInfo(){
		String str = "nosession";
		AdminInfo adminInfo = (AdminInfo)ActionContext.getContext().getSession().get("loginUser");
		if(adminInfo!=null&&adminInfo.getUser_foxconn_id()!=null){
			if(this.pageInfo!=null){
				System.out.println("list total getNextPage>>>>>>>>>>>>"+this.pageInfo.getNextPage());
			}else{
				this.pageInfo = new PageInfo();
				this.pageInfo.setNextPage(1);
			}
			AdminManageService adminManageService = null;
			adminManageService = this.getAdminManageService();
			List<AdminInfo> adminList = adminManageService.showAdminList(this.pageInfo);
			PageInfo<?> pageInfo = new PageInfo(adminList);
			this.setAdminList(adminList);
			this.setPageInfo(pageInfo);
			str = "success";
		}
		return str;
	}
	
	public String showAddAdminWeb(){
		String str = "nosession";
		AdminInfo adminInfo = (AdminInfo) ActionContext.getContext().getSession().get("loginUser");
		LOGGER.info("adminInfo = "+adminInfo+",adminInfo.getUser_role() = "+adminInfo.getUser_role());
		if(adminInfo!=null&&adminInfo.getUser_foxconn_id()!=null){
			str = "success";
		}
		return str;
	}
	
	public String addAdminInfo(){
		String str = "nosession";
		AdminInfo adminInfo = (AdminInfo) ActionContext.getContext().getSession().get("loginUser");
		if(adminInfo!=null&&adminInfo.getUser_foxconn_id()!=null){
			AdminManageService adminManageService = null;
			adminManageService = this.getAdminManageService();
			admin.setCreate_date(JavaTool.getDateTime("yyyy-MM-dd HH:mm:ss"));
			adminManageService.addAdmin(admin);
			str = "success";
		}
		return str;
	}
	
	public String showAdminByUser(){
		String str = "nosession";
		AdminInfo adminInfo = (AdminInfo)ActionContext.getContext().getSession().get("loginUser");
		if(adminInfo!=null&&adminInfo.getUser_foxconn_id()!=null){
			if(this.pageInfo!=null){
				System.out.println("list total getNextPage>>>>>>>>>>>>"+this.pageInfo.getNextPage());
			}else{
				this.pageInfo = new PageInfo();
				this.pageInfo.setNextPage(1);
			}
			AdminManageService adminManageService = null;
			adminManageService = this.getAdminManageService();
			List<AdminInfo> adminList = new ArrayList<AdminInfo>();
			if(this.getAdmin()==null){
				adminList = adminManageService.showAdminList(pageInfo);
			}else{
				AdminInfo ai = this.getAdmin();
				ai.setUser_foxconn_id(this.getAdmin().getUser_foxconn_id().trim());
				ai.setUser_name(this.getAdmin().getUser_name().trim());
				adminList = adminManageService.showAdminListByUser(ai,pageInfo);
			}
			PageInfo<?> pageInfo = new PageInfo(adminList);
			this.setAdminList(adminList);
			this.setPageInfo(pageInfo);
			str = "success";
		}
		return str;
	}
	public String deleteUser(){
		String str = "nosession";
		AdminInfo adminInfo = (AdminInfo) ActionContext.getContext().getSession().get("loginUser");
		if(adminInfo!=null&&adminInfo.getUser_foxconn_id()!=null){
			AdminManageService adminManageService = null;
			adminManageService = this.getAdminManageService();
			admin.setCreate_date(JavaTool.getDateTime("yyyy-MM-dd HH:mm:ss"));
			adminManageService.deleteUser(admin);
			str = "success";
		}
		return str;
	}
	
	public String showUpdatePassWord(){
		admin.setCreate_date(JavaTool.getDateTime("yyyy-MM-dd HH:mm:ss"));
		return "success";	
	}
	
	public String updatePasswordForm(){
		String str = "nosession";
		AdminInfo adminInfo = (AdminInfo) ActionContext.getContext().getSession().get("loginUser");
		if(adminInfo!=null&&adminInfo.getUser_foxconn_id()!=null){
			AdminManageService adminManageService = null;
			adminManageService = this.getAdminManageService();
			admin.setCreate_date(JavaTool.getDateTime("yyyy-MM-dd HH:mm:ss"));
			adminManageService.updateUserPassword(admin);
			str = "success";
		}
		return str;
	}
	
	public String findSeletedUserInfo(){
		String str="nosession";
		AdminInfo adminInfo = (AdminInfo) ActionContext.getContext().getSession().get("loginUser");
		if(adminInfo!=null&&adminInfo.getUser_foxconn_id()!=null){
			AdminManageService adminManageService = null;
			adminManageService = this.getAdminManageService();
			admin.setCreate_date(JavaTool.getDateTime("yyyy-MM-dd HH:mm:ss"));
			AdminInfo u = adminManageService.findUserByFoxId(admin);
			this.setAdmin(u);
			str = "success";
		}
		return str;		
	}
	
	public String modifyUserInfo(){
		String str = "nosession";
		AdminInfo adminInfo = (AdminInfo) ActionContext.getContext().getSession().get("loginUser");
		if(adminInfo!=null&&adminInfo.getUser_foxconn_id()!=null){
			AdminManageService adminManageService = null;
			adminManageService = this.getAdminManageService();
			admin.setCreate_date(JavaTool.getDateTime("yyyy-MM-dd HH:mm:ss"));
			adminManageService.editUserInfo(admin);
			str = "success";
		}
		return str;
	}

}
