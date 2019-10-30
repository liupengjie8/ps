/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.opeparameters.entity;


import com.jeeplus.core.persistence.DataEntity;
import com.jeeplus.common.utils.excel.annotation.ExcelField;

/**
 * 参数维护Entity
 * @author lpj
 * @version 2019-08-20
 */
public class OpeParamaters extends DataEntity<OpeParamaters> {
	
	private static final long serialVersionUID = 1L;
	private String paramaterName;		// 参数名称
	private String paramaterValue;		// 参数值
	
	public OpeParamaters() {
		super();
	}

	public OpeParamaters(String id){
		super(id);
	}

	@ExcelField(title="参数名称", align=2, sort=6)
	public String getParamaterName() {
		return paramaterName;
	}

	public void setParamaterName(String paramaterName) {
		this.paramaterName = paramaterName;
	}
	
	@ExcelField(title="参数值", align=2, sort=7)
	public String getParamaterValue() {
		return paramaterValue;
	}

	public void setParamaterValue(String paramaterValue) {
		this.paramaterValue = paramaterValue;
	}
	
}