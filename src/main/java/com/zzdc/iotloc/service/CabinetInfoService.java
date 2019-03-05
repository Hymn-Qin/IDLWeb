package com.zzdc.iotloc.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.zzdc.iotloc.bean.CabinetInfo;
import com.zzdc.iotloc.dao.CabinetInfoMapper;

public interface CabinetInfoService {
	public void setCabinetInfoMapper(CabinetInfoMapper cabinetInfoMapper);
	public List<CabinetInfo> findCabinetInfo(PageInfo<?> pageInfo);
	public List<CabinetInfo> findIsCabinetExists(CabinetInfo cabinetBoxInfo, PageInfo<?> pageInfo);
}
