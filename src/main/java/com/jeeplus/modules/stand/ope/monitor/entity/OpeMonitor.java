package com.jeeplus.modules.stand.ope.monitor.entity;

import java.util.List;

import com.jeeplus.modules.stand.ope.standindex.entity.OpeStIndex;

public class OpeMonitor {
	private String node;
	private String staus;
	private List<OpeMonitorStIndex> indexs;
	
	public String getNode() {
		return node;
	}
	public void setNode(String node) {
		this.node = node;
	}
	public String getStaus() {
		return staus;
	}
	public void setStaus(String staus) {
		this.staus = staus;
	}
	public List<OpeMonitorStIndex> getIndexs() {
		return indexs;
	}
	public void setIndexs(List<OpeMonitorStIndex> indexs) {
		this.indexs = indexs;
	}
	
	
}
