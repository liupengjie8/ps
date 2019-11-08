/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.stand.ope.preopedetail.mapper;

import com.jeeplus.core.persistence.BaseMapper;
import com.jeeplus.core.persistence.annotation.MyBatisMapper;
import com.jeeplus.modules.stand.ope.opebarchart.entity.OpeAllColumn;
import com.jeeplus.modules.stand.ope.preopedetail.entity.PreOpePatientIndexRec;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 术前明细MAPPER接口
 * @author lpj
 * @version 2019-10-17
 */
@MyBatisMapper
public interface PreOpePatientIndexRecMapper extends BaseMapper<PreOpePatientIndexRec> {
   List<String> getIndexIdsByChartId(String chartId);
}