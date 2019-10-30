/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.opebarchart.entity;

import java.util.List;

import com.jeeplus.modules.stand.ope.opestandstage.entity.OpeStandStage;
import com.jeeplus.core.persistence.DataEntity;
import com.jeeplus.common.utils.excel.annotation.ExcelField;

/**
 * 字段Entity
 * @author lpj
 * @version 2019-09-11
 */
public class OpeBarChart extends DataEntity<OpeBarChart> {
	
	private static final long serialVersionUID = 1L;
	private String xData;
	private String sData;
	private List<String> xAxisData;		// 元素
	private List<Integer> seriesData;		// 不符合数量
	private List<Integer> seriesDataLastYear;		// 去年阶段不符合数量
	
	
	public List<Integer> getSeriesDataLastYear() {
		return seriesDataLastYear;
	}
	public void setSeriesDataLastYear(List<Integer> seriesDataLastYear) {
		this.seriesDataLastYear = seriesDataLastYear;
	}
	public String getxData() {
		return xData;
	}
	public void setxData(String xData) {
		this.xData = xData;
	}
	public String getsData() {
		return sData;
	}
	public void setsData(String sData) {
		this.sData = sData;
	}
	public List<String> getxAxisData() {
		return xAxisData;
	}
	public void setxAxisData(List<String> xAxisData) {
		this.xAxisData = xAxisData;
	}
	public List<Integer> getSeriesData() {
		return seriesData;
	}
	public void setSeriesData(List<Integer> seriesData) {
		this.seriesData = seriesData;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}