/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.operadar.entity;


import com.jeeplus.core.persistence.DataEntity;
import com.jeeplus.common.utils.excel.annotation.ExcelField;

/**
 * 指标Entity
 * @author lpj
 * @version 2019-08-22
 */
public class OpeRadar extends DataEntity<OpeRadar> {
	
	private static final long serialVersionUID = 1L;
	private String stage; //指标所属阶段
	private String element;		// 监测要素
	private String indexName;		// 监测指标
	private String indexCalMethod;		// 指标计算公式
	private String qualifiedRate;//指标达标率
	private String countQualified;//达标数量
	private String countAll;//全部数量
	private String countQualifiedLastYear;//去年同期达标数量
	private String countAllLastYear;//去年同期全部数量
	private String qualifiedRateLastYear;//去年同期达标率
    private String sdate;
    private String edate;
    private String title;
    private Double[] value;
    
    
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Double[] getValue() {
		return value;
	}
	public void setValue(Double[] value) {
		this.value = value;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public String getStage() {
		return stage;
	}
	public void setStage(String stage) {
		this.stage = stage;
	}
	public String getElement() {
		return element;
	}
	public void setElement(String element) {
		this.element = element;
	}
	public String getIndexName() {
		return indexName;
	}
	public void setIndexName(String indexName) {
		this.indexName = indexName;
	}
	public String getIndexCalMethod() {
		return indexCalMethod;
	}
	public void setIndexCalMethod(String indexCalMethod) {
		this.indexCalMethod = indexCalMethod;
	}
	public String getQualifiedRate() {
		return qualifiedRate;
	}
	public void setQualifiedRate(String qualifiedRate) {
		this.qualifiedRate = qualifiedRate;
	}
	public String getCountQualified() {
		return countQualified;
	}
	public void setCountQualified(String countQualified) {
		this.countQualified = countQualified;
	}
	public String getCountAll() {
		return countAll;
	}
	public void setCountAll(String countAll) {
		this.countAll = countAll;
	}
	public String getCountQualifiedLastYear() {
		return countQualifiedLastYear;
	}
	public void setCountQualifiedLastYear(String countQualifiedLastYear) {
		this.countQualifiedLastYear = countQualifiedLastYear;
	}
	public String getCountAllLastYear() {
		return countAllLastYear;
	}
	public void setCountAllLastYear(String countAllLastYear) {
		this.countAllLastYear = countAllLastYear;
	}
	public String getQualifiedRateLastYear() {
		return qualifiedRateLastYear;
	}
	public void setQualifiedRateLastYear(String qualifiedRateLastYear) {
		this.qualifiedRateLastYear = qualifiedRateLastYear;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}