/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.standindex.entity;


import com.jeeplus.core.persistence.DataEntity;
import com.jeeplus.common.utils.excel.annotation.ExcelField;

/**
 * 指标Entity
 * @author lpj
 * @version 2019-08-22
 */
public class OpeStIndex extends DataEntity<OpeStIndex> {
	
	private static final long serialVersionUID = 1L;
	private String element;		// 监测要素
	private String indexName;		// 监测指标
	private String indexCalMethod;		// 指标计算公式
	private String calFactorOne;		// 计算因子1
	private String calFactorTwo;		// 计算因子2
	private String calFactorThree;		// 计算因子3
	private String calMode;		// 计算逻辑
	
	public OpeStIndex() {
		super();
	}

	public OpeStIndex(String id){
		super(id);
	}

	@ExcelField(title="监测要素", align=2, sort=6)
	public String getElement() {
		return element;
	}

	public void setElement(String element) {
		this.element = element;
	}
	
	@ExcelField(title="监测指标", align=2, sort=7)
	public String getIndexName() {
		return indexName;
	}

	public void setIndexName(String indexName) {
		this.indexName = indexName;
	}
	
	@ExcelField(title="指标计算公式", align=2, sort=8)
	public String getIndexCalMethod() {
		return indexCalMethod;
	}

	public void setIndexCalMethod(String indexCalMethod) {
		this.indexCalMethod = indexCalMethod;
	}
	
	@ExcelField(title="计算因子1", align=2, sort=9)
	public String getCalFactorOne() {
		return calFactorOne;
	}

	public void setCalFactorOne(String calFactorOne) {
		this.calFactorOne = calFactorOne;
	}
	
	@ExcelField(title="计算因子2", align=2, sort=10)
	public String getCalFactorTwo() {
		return calFactorTwo;
	}

	public void setCalFactorTwo(String calFactorTwo) {
		this.calFactorTwo = calFactorTwo;
	}
	
	@ExcelField(title="计算因子3", align=2, sort=11)
	public String getCalFactorThree() {
		return calFactorThree;
	}

	public void setCalFactorThree(String calFactorThree) {
		this.calFactorThree = calFactorThree;
	}
	
	@ExcelField(title="计算逻辑", align=2, sort=12)
	public String getCalMode() {
		return calMode;
	}

	public void setCalMode(String calMode) {
		this.calMode = calMode;
	}
	
}