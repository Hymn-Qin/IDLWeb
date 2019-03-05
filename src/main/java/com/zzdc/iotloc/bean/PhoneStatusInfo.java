package com.zzdc.iotloc.bean;

public class PhoneStatusInfo {

	private String sn;
	private String is_alive;
	private String cerate_time;
	private String update_time;
	private BorrowInfo borrowInfo;
	private CabinetInfo cabinet;
	
	public String getSn() {
		return sn;
	}
	public void setSn(String sn) {
		this.sn = sn;
	}

	public String getIs_alive() {
		return is_alive;
	}
	public void setIs_alive(String is_alive) {
		this.is_alive = is_alive;
	}

	public CabinetInfo getCabinet() {
		return cabinet;
	}
	public void setCabinet(CabinetInfo cabinet) {
		this.cabinet = cabinet;
	}
	public String getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(String update_time) {
		this.update_time = update_time;
	}
	public String getCerate_time() {
		return cerate_time;
	}
	public void setCerate_time(String cerate_time) {
		this.cerate_time = cerate_time;
	}
	public BorrowInfo getBorrowInfo() {
		return borrowInfo;
	}
	public void setBorrowInfo(BorrowInfo borrowInfo) {
		this.borrowInfo = borrowInfo;
	}
	
}
