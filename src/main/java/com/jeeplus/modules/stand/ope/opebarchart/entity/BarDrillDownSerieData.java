package com.jeeplus.modules.stand.ope.opebarchart.entity;

import java.util.List;



public class BarDrillDownSerieData {
	private String id;
	private String name;
	private List<BarSerieData> data;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<BarSerieData> getData() {
		return data;
	}
	public void setData(List<BarSerieData> data) {
		this.data = data;
	}
	
}
