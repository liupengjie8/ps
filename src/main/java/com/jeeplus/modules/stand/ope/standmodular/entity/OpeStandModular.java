/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.standmodular.entity;


import com.jeeplus.core.persistence.DataEntity;
import com.jeeplus.common.utils.excel.annotation.ExcelField;

/**
 * 标准模块Entity
 * @author lpj
 * @version 2019-08-15
 */
public class OpeStandModular extends DataEntity<OpeStandModular> {
	
	private static final long serialVersionUID = 1L;
	private String modularName;		// 模块名称
	private String yycj;		// 模块名称
	private Boolean isQuilified;
	
	public Boolean getIsQuilified() {
		return isQuilified;
	}

	public void setIsQuilified(Boolean isQuilified) {
		this.isQuilified = isQuilified;
	}

	public OpeStandModular() {
		super();
	}

	public OpeStandModular(String id){
		super(id);
	}

	@ExcelField(title="模块名称", align=2, sort=6)
	public String getModularName() {
		return modularName;
	}


	public void setModularName(String modularName) {
		this.modularName = modularName;
	}
	@ExcelField(title="应用场景", align=2, sort=7)
	public String getYycj() {
		return yycj;
	}

	public void setYycj(String yycj) {
		this.yycj = yycj;
	}
}