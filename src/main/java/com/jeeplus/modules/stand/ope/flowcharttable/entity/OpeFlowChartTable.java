/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.flowcharttable.entity;

import com.jeeplus.modules.stand.ope.standmodular.entity.OpeStandModular;

import com.jeeplus.core.persistence.DataEntity;
import com.jeeplus.common.utils.excel.annotation.ExcelField;

/**
 * 标准流程Entity
 * @author lpj
 * @version 2019-09-20
 */
public class OpeFlowChartTable extends DataEntity<OpeFlowChartTable> {
	
	private static final long serialVersionUID = 1L;
	private OpeStandModular opeStandModular;		// 模块
	private String pageName;		// 流程页名称
	private String pageId;		// 流程页
	private String text;		// 流程
	private String nextLowLevel;		// 下一级流程页
	private String row;		// 行
	private String col;		// 列
	private String title;		// 岗位
	private String description;		// 标准信息
	private String status;		// 状态
	private String documentUrl;		// 文档下载链接
	private String chartId;		// 流程id
	
	public OpeFlowChartTable() {
		super();
	}

	public OpeFlowChartTable(String id){
		super(id);
	}

	@ExcelField(title="模块", fieldType=OpeStandModular.class, value="opeStandModular.modularName", align=2, sort=6)
	public OpeStandModular getOpeStandModular() {
		return opeStandModular;
	}

	public void setOpeStandModular(OpeStandModular opeStandModular) {
		this.opeStandModular = opeStandModular;
	}
	
	@ExcelField(title="流程页名称", align=2, sort=7)
	public String getPageName() {
		return pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}
	
	@ExcelField(title="流程页", align=2, sort=8)
	public String getPageId() {
		return pageId;
	}

	public void setPageId(String pageId) {
		this.pageId = pageId;
	}
	
	@ExcelField(title="流程", align=2, sort=9)
	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
	
	@ExcelField(title="下一级流程页", align=2, sort=10)
	public String getNextLowLevel() {
		return nextLowLevel;
	}

	public void setNextLowLevel(String nextLowLevel) {
		this.nextLowLevel = nextLowLevel;
	}
	
	@ExcelField(title="行", align=2, sort=11)
	public String getRow() {
		return row;
	}

	public void setRow(String row) {
		this.row = row;
	}
	
	@ExcelField(title="列", align=2, sort=12)
	public String getCol() {
		return col;
	}

	public void setCol(String col) {
		this.col = col;
	}
	
	@ExcelField(title="岗位", align=2, sort=13)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@ExcelField(title="标准信息", align=2, sort=14)
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	@ExcelField(title="状态", align=2, sort=15)
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@ExcelField(title="文档下载链接", align=2, sort=16)
	public String getDocumentUrl() {
		return documentUrl;
	}

	public void setDocumentUrl(String documentUrl) {
		this.documentUrl = documentUrl;
	}
	
	@ExcelField(title="流程id", align=2, sort=17)
	public String getChartId() {
		return chartId;
	}

	public void setChartId(String chartId) {
		this.chartId = chartId;
	}
	
}