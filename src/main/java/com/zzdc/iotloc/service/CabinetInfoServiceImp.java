package com.zzdc.iotloc.service;

import java.util.List;
import com.zzdc.iotloc.bean.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzdc.iotloc.dao.CabinetInfoMapper;

public class CabinetInfoServiceImp implements CabinetInfoService {
	private CabinetInfoMapper cabinetInfoMapper;


	public List<CabinetInfo> findCabinetInfo(PageInfo<?> pageInfo){//系统管理员登录模式
		//拦截mybatis sql 第一个参数为第几页 第二个参数为每页大小
		//在需要分页的sql方法前面加入该分页拦截器
		 PageHelper.startPage(pageInfo.getNextPage(), 10);	
		//由页面传入参数
		//fileAllInfo.setFile_id(fileAllInfo.getFile_id());
		//返回后台处理结果
		 System.out.print(this.cabinetInfoMapper);
		return this.cabinetInfoMapper.showCabinetInfo();
	}


	@Override
	public void setCabinetInfoMapper(CabinetInfoMapper cabinetInfoMapper) {
		// TODO Auto-generated method stub
		this.cabinetInfoMapper = cabinetInfoMapper;
	}
	
	public List<CabinetInfo> findIsCabinetExists(CabinetInfo cabinetBoxInfo,PageInfo<?> pageInfo) {
		// TODO Auto-generated method stub
		//LOGGER.info("findIsUserExists");
		if ("".equals(cabinetBoxInfo.getBox_id())){
			    PageHelper.startPage(pageInfo.getNextPage(), 10);	
			    System.out.print(this.cabinetInfoMapper);
				return this.cabinetInfoMapper.findCabinetExists(cabinetBoxInfo);
			}else{
				PageHelper.startPage(pageInfo.getNextPage(), 10);	
			    System.out.print(this.cabinetInfoMapper);
				return this.cabinetInfoMapper.findCabinetBoxExists(cabinetBoxInfo);
			}
		
	}

}
