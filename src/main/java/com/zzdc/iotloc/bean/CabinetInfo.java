package com.zzdc.iotloc.bean;

public class CabinetInfo {

	private String cabinet_id;
	private String box_id;
	private String sn;
	private String fault_type;
	public String getCabinet_id() {
		return cabinet_id;
	}
	public void setCabinet_id(String cabinet_id) {
		this.cabinet_id = cabinet_id;
	}
	public String getBox_id() {
		return box_id;
	}
	public void setBox_id(String box_id) {
		this.box_id = box_id;
	}
	public String getSn() {
		return sn;
	}
	public void setSn(String sn) {
		this.sn = sn;
	}
	public String getFault_type() {
		return fault_type;
	}
	public void setFault_type(String fault_type) {
		this.fault_type = fault_type;
	}
}
