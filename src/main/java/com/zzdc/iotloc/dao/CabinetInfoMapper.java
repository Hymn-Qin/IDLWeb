package com.zzdc.iotloc.dao;
import java.util.List;

import com.zzdc.iotloc.bean.*;
public interface CabinetInfoMapper {
	public List<CabinetInfo> showCabinetInfo() ;
	public  List<CabinetInfo> findCabinetExists(CabinetInfo cabinetBoxInfo);//��ѯ�C����Ϣ
	public  List<CabinetInfo> findCabinetBoxExists(CabinetInfo cabinetBoxInfo);//��ѯ�C��͙C����Ϣ
}
