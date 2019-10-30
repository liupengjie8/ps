/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.opestandstage.entity;


import com.jeeplus.core.persistence.DataEntity;
import com.jeeplus.common.utils.excel.annotation.ExcelField;

/**
 * 阶段Entity
 * @author lpj
 * @version 2019-08-16
 */
public class OpeStandStage extends DataEntity<OpeStandStage> {
	
	private static final long serialVersionUID = 1L;
	private String stageName;		// 阶段
	
	public OpeStandStage() {
		super();
	}

	public OpeStandStage(String id){
		super(id);
	}

	@ExcelField(title="阶段", align=2, sort=6)
	public String getStageName() {
		return stageName;
	}

	public void setStageName(String stageName) {
		this.stageName = stageName;
	}
	
}