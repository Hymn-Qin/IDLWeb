package com.zzdc.iotloc.action;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.zzdc.iotloc.bean.AdminInfo;
import com.zzdc.iotloc.service.UserLoginService;
import com.zzdc.iotloc.util.JavaTool;

/*
 * 用户登录验证action
 * @author H2604371
 * @date 2019-01-03
 */
public class UserLoginAction extends ActionSupport {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = LogManager
			.getLogger(UserLoginAction.class);
	private AdminInfo adminInfo = new AdminInfo();// 用户登录信息bean
	private UserLoginService userLoginService;
	private String prePage;
	
	
	public AdminInfo getAdminInfo() {
		return adminInfo;
	}
	public void setAdminInfo(AdminInfo adminInfo) {
		this.adminInfo = adminInfo;
	}
	public UserLoginService getUserLoginService() {
		return userLoginService;
	}
	public void setUserLoginService(UserLoginService userLoginService) {
		this.userLoginService = userLoginService;
	}
	public String getPrePage() {
		return prePage;
	}
	public void setPrePage(String prePage) {
		this.prePage = prePage;
	}


	public String userLogin(){
		
		LOGGER.info("code come in UserLoginAction  >>>>>>> method=userLogin()");
		AdminInfo useSession = (AdminInfo) ActionContext.getContext()
				.getSession().get("loginUser");
		LOGGER.info("code come in UserLoginAction  >>>>>>> "+useSession);		
		UserLoginService userLoginService = this.userLoginService;
		AdminInfo returnAdmin = userLoginService.findIsUserExists(this.adminInfo);
		AdminInfo checkAdmin = returnAdmin == null?new AdminInfo():returnAdmin;
		if(JavaTool.isNotNull(checkAdmin.getUser_foxconn_id())){
			LOGGER.info("checkAdmin.getUser_foxconn_id() = "+checkAdmin.getUser_foxconn_id());
			this.setAdminInfo(checkAdmin);
			ActionContext.getContext().getSession().put("loginUser", checkAdmin);
			return "OK";
		}else{
			LOGGER.info("login user  >>>>>>>  "
					+ this.adminInfo.getUser_foxconn_id()
					+ "  在系统中不存在或密码错误!");
			return "NG";
		}
	}
	
	
	// 退出当前登录
	public String loginOut() {
		LOGGER.info("code come in UserLoginAction  >>>>>>> method=loginOut()");
		ActionContext.getContext().getSession().remove("loginUser");
		return "OK";
	}
	
}
