/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.opecolumn.entity;


import com.jeeplus.core.persistence.DataEntity;
import com.jeeplus.common.utils.excel.annotation.ExcelField;

/**
 * 手术字段Entity
 * @author lpj
 * @version 2019-10-20
 */
public class OpeColumn extends DataEntity<OpeColumn> {
	
	private static final long serialVersionUID = 1L;
	private String stage;		// 阶段
	private String columnName;		// 字段名称
	private String columnCode;		// 字段数据库名称
	private String columnType;		// 字段类型
	private String options;		// 下拉选项
	private String selectType;		// 查询方式
	

	public OpeColumn() {
		super();
		this.setIdType(IDTYPE_AUTO);
	}

	public OpeColumn(String id){
		super(id);
	}

	@ExcelField(title="阶段", dictType="patient_stage", align=2, sort=6)
	public String getStage() {
		return stage;
	}

	public void setStage(String stage) {
		this.stage = stage;
	}
	
	@ExcelField(title="字段名称", align=2, sort=7)
	public String getColumnName() {
		return columnName;
	}

	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}
	
	@ExcelField(title="字段数据库名称", align=2, sort=8)
	public String getColumnCode() {
		return columnCode;
	}

	public void setColumnCode(String columnCode) {
		this.columnCode = columnCode;
	}
	
	@ExcelField(title="字段类型", dictType="column_type", align=2, sort=9)
	public String getColumnType() {
		return columnType;
	}

	public void setColumnType(String columnType) {
		this.columnType = columnType;
	}
	
	@ExcelField(title="下拉选项", align=2, sort=10)
	public String getOptions() {
		return options;
	}

	public void setOptions(String options) {
		this.options = options;
	}
	
	@ExcelField(title="查询方式", dictType="select_type", align=2, sort=11)
	public String getSelectType() {
		return selectType;
	}

	public void setSelectType(String selectType) {
		this.selectType = selectType;
	}
	
}