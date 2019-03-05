package com.zzdc.iotloc.action;

import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import com.github.pagehelper.PageInfo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
//import com.zzdc.fileexchange.action.SearchFileAction;
import com.zzdc.iotloc.bean.*;
import com.zzdc.iotloc.service.CabinetInfoService;
import com.zzdc.iotloc.bean.AdminInfo;

public class CabinetInfoAction extends ActionSupport {

	private static final long serialVersionUID = -1211994808832072104L;
	private static final Logger LOGGER = LogManager.getLogger(CabinetInfoAction.class);
	//private List<AdminInfo> adminInfo;
	private List<CabinetInfo> cabinetInfo;
	private CabinetInfo cabinetBoxInfo;
	private PageInfo<?> pageInfo;// pageBean 获取页面的pageinfo参数
	private CabinetInfoService cabinetInfoService;
	private List<CabinetInfo> checkCabinetBoxInfo;
	
	public List<CabinetInfo> getCheckCabinetBoxInfo() {
		return checkCabinetBoxInfo;
	}
	public void setCheckCabinetBoxInfo(List<CabinetInfo> checkCabinetBoxInfo) {
		this.checkCabinetBoxInfo = checkCabinetBoxInfo;
	}
	public CabinetInfo getCabinetBoxInfo() {
		return cabinetBoxInfo;
	}
	public void setCabinetBoxInfo(CabinetInfo cabinetBoxInfo) {
		this.cabinetBoxInfo = cabinetBoxInfo;
	}
	public List<CabinetInfo> getCabinetInfo() {
		return cabinetInfo;
	}
	public void setCabinetInfo(List<CabinetInfo> cabinetInfo) {
		this.cabinetInfo = cabinetInfo;
	}

	public PageInfo<?> getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo<?> pageInfo) {
		this.pageInfo = pageInfo;
	}
	
	public CabinetInfoService getCabinetInfoService() {
		return cabinetInfoService;
	}
	public void setCabinetInfoService(CabinetInfoService cabinetInfoService) {
		this.cabinetInfoService = cabinetInfoService;
	}


	public String showCabinetInfo() {

		String str = "nosession";
		AdminInfo users = (AdminInfo) ActionContext.getContext().getSession().get("loginUser");// 获取session中的用户信息
		if (users != null && users.getUser_foxconn_id() != null) {
			if (this.pageInfo != null) {
				LOGGER.info("list total getNextPage>>>>>>>>>>>>" + this.pageInfo.getNextPage());
			} else {
				this.pageInfo = new PageInfo();
				this.pageInfo.setNextPage(1);
			}
			/*try {*/
				CabinetInfoService cabinetInfoService = null;
				cabinetInfoService = this.getCabinetInfoService();
				cabinetInfo = cabinetInfoService.findCabinetInfo(this.getPageInfo());

				@SuppressWarnings({ "unchecked", "rawtypes" })
				PageInfo<?> page = new PageInfo(cabinetInfo);
				this.setCabinetInfo(cabinetInfo);
				this.setPageInfo(page);
				str = "success";
				/*} catch (Exception e) {
				LOGGER.error(" code in CabinetInfoAction.cabinetinfo()," + e.getMessage());
				e.printStackTrace();
				str = "fail";
			}*/
		}
		return str;
	}
	
	public String checkCabinetIdInfo(){
		String str1 = "nosession";
		AdminInfo adminInfo = (AdminInfo)ActionContext.getContext().getSession().get("loginUser");
		if(adminInfo!=null&&adminInfo.getUser_foxconn_id()!=null){
			if(this.pageInfo!=null){
				
			}else{
				this.pageInfo = new PageInfo();
				this.pageInfo.setNextPage(1);
			}
			CabinetInfoService checkCabinetInfoService = null;
			checkCabinetInfoService=this.getCabinetInfoService();
			List<CabinetInfo> returnCabinetBoxInfo =  new ArrayList();
			if(this.cabinetBoxInfo== null){
				LOGGER.info("login user  >>>>>>>  "
						+ "  您輸入的機櫃信息或機箱信息有誤!");
			}else{
				CabinetInfo cabinetboxinf = this.getCabinetBoxInfo();
				cabinetboxinf.setCabinet_id(this.getCabinetBoxInfo().getCabinet_id());
				cabinetboxinf.setBox_id(this.getCabinetBoxInfo().getBox_id());
				returnCabinetBoxInfo = checkCabinetInfoService.findIsCabinetExists(cabinetboxinf,this.getPageInfo());
			}
			@SuppressWarnings({ "unchecked", "rawtypes" })
			PageInfo<?> page = new PageInfo(returnCabinetBoxInfo);
			this.setCheckCabinetBoxInfo(returnCabinetBoxInfo);;
			this.setPageInfo(page);
			str1 = "success";
			}
				else{
					str1 = "fail";
				}
				return str1;
			}


}