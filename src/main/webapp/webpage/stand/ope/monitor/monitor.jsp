<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<%@ include file="/webpage/include/bootstraptable.jsp"%>
<%@include file="/webpage/include/treeview.jsp" %>
<html >
	<head>
	<title>指标管理</title>
	<meta name="decorator" content="ani">
	<script type="text/javascript">
	function showHiddenSelectArea(){
        		if($("#showHiddenSelectAreaBtn").html().indexOf("upload")!=-1){
        			$("#showHiddenSelectAreaBtn").html('<i class="glyphicon  glyphicon-download"></i>')
        			$("#selectArea").css("display","none");
        			$("#showHiddenSelectAreaBtn").attr("title","显示查询区域");
        		}else{
        			$("#showHiddenSelectAreaBtn").html('<i class="glyphicon  glyphicon-upload"></i>')
        			$("#selectArea").css("display","block");
        			$("#showHiddenSelectAreaBtn").attr("title","收起查询区域");
        		}
        	}
	$(function(){
		$(".page_title",parent.document).html("手术服务运行监测");
	})
		var obj;
		$(document).ready(function() {
			jp.ajaxForm("#inputForm",function(data){
				if(data.success){
				    jp.success(data.msg);
					jp.go("/a/paetest/paEvaluationIndex");
				}else{
				    jp.error(data.msg);
				    $("#inputForm").find("button:submit").button("reset");
				}
			});

		});
		function goDetail(indexId){
			window.location.href="/ps/a/opedetail/opeDetail/opeDetail?isQualified=0&indexId="+indexId;
		}
		function goIndexForm(node){
			var href="/ps/a/indexForm/indexForm/indexForm?fromPage=leftTree&nodeName="+node;
			window.location.href=href;
		}
		function selectColumn(){
			$("#select_column").css('display','block');
		}
		function cancelSelectColumn(){
			$("#select_column").css('display','none');
		}
		
		function confirmSelectColumn(){
			$("#select_column").css('display','none');
			var column_ids=obj.get_data();//选中id数组
			var ids="";
			for(var i=0;i<column_ids.length;i++){
				ids+=column_ids[i]+",";
			}
			$.ajax({
				url:"${ctx}/opecolumn/opeColumn/getColumnListByIds",
				type:"post",
				data:{ids:ids},
				dataType:"json",
				success:function(res){	
					var columnList=res;
					$("#selectRow1").html('');
					var htmlRow1='<form id="searchForm" modelAttribute="opeColumn">';
					for(var i=0;i<columnList.length;i++){
						var column = columnList[i];
						if(column.columnType=='文本'){
							htmlRow1+='<div class="col-xs-1-5">'
							htmlRow1+='<div class="form-group">'
							htmlRow1+='<div class="col-md-12 update-align-items ">'+column.columnName+'</div>'
							htmlRow1+='<div class="col-md-12">'
							htmlRow1+='<input  class="form-control " type="text" value="" name="'+column.columnCode+'">'
							htmlRow1+='</div>'
							htmlRow1+='</div>'
							htmlRow1+='</div>'
							htmlRow1+='</div>'
						}
						if(column.columnType=='下拉'){
							htmlRow1+='<div class="col-xs-1-5">'
							htmlRow1+='<div class="form-group">'
							htmlRow1+='<div class="col-md-12 update-align-items ">'+column.columnName+'</div>'
							htmlRow1+='<div class="col-md-12">'
							var options = column.options;
							options=options.split('*#');
							htmlRow1+='<select id="selectType" name="'+column.columnCode+'" class="form-control ">'
							htmlRow1+='<option value="">全部</option>'
							for(var j=0;j<options.length;j++){
								htmlRow1+='<option value="'+options[j]+'">'+options[j]+'</option>'
							}
							htmlRow1+='</select>'
							htmlRow1+='</div>'
							htmlRow1+='</div>'
							htmlRow1+='</div>'
							htmlRow1+='</div>'
						}
						if(column.columnType=='时间'){
							htmlRow1+='<div class="col-xs-1-5">'
							htmlRow1+='<div class="input-group " >'
							htmlRow1+='<div class="col-md-12 update-align-items ">'+column.columnName+'-起</div>'
							htmlRow1+='<div class="col-md-12 ">'
							htmlRow1+='<input  class="form-control form_datetime" type="text" value="" name="'+column.columnCode+'Start">'
							htmlRow1+='</div>'
							htmlRow1+='</div>'
							htmlRow1+='</div>'
							htmlRow1+='</div>'
							htmlRow1+='<div class="col-xs-1-5">'
							htmlRow1+='<div class="input-group">'
							htmlRow1+='<div class="col-md-12 update-align-items ">'+column.columnName+'-止</div>'
							htmlRow1+='<div class="col-md-12 ">'
							htmlRow1+='<input  class="form-control form_datetime" type="text" value="" name="'+column.columnCode+'End">'
							htmlRow1+='</div>'
							htmlRow1+='</div>'
							htmlRow1+='</div>'
							htmlRow1+='</div>'
						}
					}
					htmlRow1+='</form>'
					$("#selectRow1").html(htmlRow1);
					lay('.form_datetime').each(function(){
					    laydate.render({
					      elem: this
					      ,trigger: 'click'
					    });
					  });
					
				}
			});	
			
		}
		$(function(){
	        var data = [];
	        //获取字段合集
	         $.ajax({
				url:"${ctx}/opecolumn/opeColumn/getAllColumnList",
				type:"post",
				dataType:"json",
				data:{},
				success:function(res){	
					var parentlist = res.parentlist;
					for(var i=0;i<parentlist.length;i++){
					data.push(parentlist[i]);
					}
					var childlist = res.childlist;
					for(var i=0;i<childlist.length;i++){
						data.push(childlist[i]);
					}
					
					
					obj = cascadeBox('cascadebox','checkboxname',data,[],[],true,true,null);

				},
				fail:function(err){
					console.log(err);
				}
			});	
	        //参数1：插入cascadebox的div的id；
	        //参数2：checkbox的name；
	        //参数3：cascadebox所有选择项的数据；
	        //参数4：预设选中的数据，可以为空(不传)或[]；
	        //参数5：各级别名称，可以无限级，如果为空(不传)或[]，默认为3个级别，名称为['一级选项','二级选项','三级选项']
	        //参数6：是否开启全选模式，可以为空(不传)，默认为true
	        //参数7：是否开启选中颜色加深，可以为空(不传)，默认为true。注意，选项太多的时候，开启会导致卡顿
	        //参数8：对立cascadebox的div的id(两个cascadebox有同样的选项，是对立关系，一个选项只能在其中一个cascadebox被选中)，可以为空(不传)，默认为null
	        
	        //data的格式为：直接将每个节点push进去就行，即data.push(node_obj)；如果想用本插件，但是数据格式不一致的，可以自己写js转换下就行了
	        
	        //data节点配置说明：
	        //id:选项的id值
	        //name:选项显示名称
	        //parent_id:选项的父id，没有父选项或者顶级选项可以没有这个参数
	        //level:选项的等级，顶级选项的level为0
	        //no_checkbox:是否带复选框,true为不带，如果想默认带复选框，不带这个参数即可
	        
	        //cascadebox最终选中值：以父级为优先，即如果一个项，如果它有子级，并且子级全选了，那么最终显示选中值为该项。
	        //如果子级不全选，则只显示选中的子级。
	        //想要不以父级为优先，即父级节点的no_checkbox参数为true，不显示复选框即可
	        
	        //获取选中的项：obj.get_data()方法
	        //重新设置选中的项：obj.set_data(select_arr)方法
	        //重新设置选中的项：obj.set_data_only(select_arr)方法（和set_data方法的区别是，set_data_only仅仅是显示和打钩选中项，没顾及全选和颜色加深）
	        //增加选中项：obj.add_val(id)方法
	        //删除选中项：obj.del_val(id)方法
	        //显示某选项(包括其所有子选项)：obj.show_item(id)方法
	        //隐藏某选项(包括其所有子选项,并且删除选中)：obj.hide_item(id)方法
	        //隐藏某选项(包括其所有子选项,不会删除选中)：obj.hide_item_only(id)方法

	        

	    });
		function search(){
			var searchParam = $("#searchForm").serializeJSON();
			$.ajax({
				url:"${ctx}/monitor/monitor/data",
				type:"post",
				dataType:"json",
				data:searchParam,
				success:function(res){	
					$("#sspgDiv").html("");
					var sspgDivContent="";
					var sspgData=res.sspgData;
					for(var i=0;i<sspgData.length;i++){
						sspgDivContent+=''
						sspgDivContent+='<div  class="form-group flex">'
						sspgDivContent+='<input readonly="readonly" class="form-control " type="text" value="'+sspgData[i].node+'">'
					    if(sspgData[i].staus==1){
							 sspgDivContent+='	<div class="form-group-ico"><img src="${ctxStatic}/common/img/monitor/Tips-green.png" /></div>'
					    }
						if(sspgData[i].staus==0){
							sspgDivContent+=' <div class="form-group-ico"><img src="${ctxStatic}/common/img/monitor/Tips-red.png" />'
							sspgDivContent+='<ul class="elastic_list">'
							var index=sspgData[i].indexs;
							for(var j=0;j<index.length;j++){
								if(index[j].notQulifiedCount!=0 ){
									sspgDivContent+=' <li onclick="goDetail('+index[j].id+')">'
							 	    sspgDivContent+='<label><img src="${ctxStatic}/common/img/monitor/Tips-red.png" /></label>'
							 	    sspgDivContent+=''+index[j].element+''+index[j].notQulifiedCount+' /'+index[j].allCount+' ';
							 		sspgDivContent+='</li>'
								}
							}
							sspgDivContent+='</ul>'
							sspgDivContent+='</div>'
					    }
						sspgDivContent+=' </div>'
					}
					$("#sspgDiv").html(sspgDivContent);
					
					$("#ssapDiv").html("");
					var ssapDivContent="";
					var ssapData=res.ssapData;
					console.log(ssapData);
					for(var i=0;i<ssapData.length;i++){
						ssapDivContent+=''
						ssapDivContent+='<div  class="form-group flex">'
						ssapDivContent+='<input readonly="readonly" class="form-control " type="text" value="'+ssapData[i].node+'">'
					    if(ssapData[i].staus==1){
							 ssapDivContent+='	<div class="form-group-ico"><img src="${ctxStatic}/common/img/monitor/Tips-green.png" /></div>'
					    }
						if(ssapData[i].staus==0){
							ssapDivContent+=' <div class="form-group-ico"><img src="${ctxStatic}/common/img/monitor/Tips-red.png" />'
							ssapDivContent+='<ul class="elastic_list">'
							var index=ssapData[i].indexs;
							for(var j=0;j<index.length;j++){
								if(index[j].notQulifiedCount!=0 ){
									ssapDivContent+=' <li onclick="goDetail('+index[j].id+')">'
							 	    ssapDivContent+='<label><img src="${ctxStatic}/common/img/monitor/Tips-red.png" /></label>'
							 	    ssapDivContent+=''+index[j].element+''+index[j].notQulifiedCount+' /'+index[j].allCount+' ';
							 		ssapDivContent+='</li>'
								}
							}
							ssapDivContent+='</ul>'
							ssapDivContent+='</div>'
					    }
						ssapDivContent+=' </div>'
					}
					$("#ssapDiv").html(ssapDivContent);
				}
			})
		}
	</script>
	</head>
	<body id="monitor">
<!--  主体内容	-->
	<div class="wrapper wrapper-content"> 
	   <ul class="nav nav-tabs" role="tablist">
		  <li role="presentation" class="active"><a href="#monitor_now" role="tab" data-toggle="tab">当日</a></li>
		  <li role="presentation"><a href="#monitor_his" role="tab" data-toggle="tab">既往</a></li>
	  </ul>
	  <div class="tab-content">
	    <div role="tabpanel" class="tab-pane active" id="monitor_now">
		<!-- 栏目1	-->
		<!-- 栏目2	-->
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary"> 
					<!-- 标题	-->
					<div class="panel-heading">
						<h3 class="panel-title">术前 </h3>
					</div>
					<!-- 标题end	--> 
					<!--表格内容-->
					<div class="panel-body">
						<div class="row">
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<div class="row">
										<div class=" update-align-items " > 手术评估 </div>
										<div id=''>
										<c:forEach var="sspg" items="${sspgData }" varStatus="objstatus">
										<div  class="form-group flex">
											<input readonly="readonly" class="form-control" type="text"   onclick="goIndexForm('${sspg.node }')" value="${sspg.node }">
											 <c:if test="${sspg.staus==1 }">
											 	<div class="form-group-ico"><img src="${ctxStatic}/common/img/monitor/Tips-green.png" /></div>
											 </c:if>
											 <c:if test="${sspg.staus==0 }">
												 <div class="form-group-ico"><img src="${ctxStatic}/common/img/monitor/Tips-red.png" />
												 	<ul class="elastic_list">
												 	    <c:forEach var="index" items="${sspg.indexs }" varStatus="objstatus">
														    <c:if test="${index.notQulifiedCount!=0 }">
														    <li onclick="goDetail(${index.id })">
															<label><img src="${ctxStatic}/common/img/monitor/Tips-red.png" /></label>
															${index.element } ${index.notQulifiedCount }/${index.allCount }
															</li>
															</c:if>
														</c:forEach>	
													</ul>
												 </div>
											 </c:if>
										</div>
										</c:forEach>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<div class="row">
										<div class=" update-align-items "> 手术安排 </div>
										<div id=''>
										<c:forEach var="ssap" items="${ssapData }" varStatus="objstatus">
										<div  class="form-group flex">
											<input readonly="readonly" class="form-control " type="text" onclick="goIndexForm('${ssap.node }')" value="${ssap.node }">
											 <c:if test="${ssap.staus==1 }">
											 	<div class="form-group-ico"><img src="${ctxStatic}/common/img/monitor/Tips-green.png" /></div>
											 </c:if>
											 <c:if test="${ssap.staus==0 }">
												 <div class="form-group-ico"><img src="${ctxStatic}/common/img/monitor/Tips-red.png" />
												 	<ul class="elastic_list">
												 	    <c:forEach var="index" items="${ssap.indexs }" varStatus="objstatus">
														<c:if test="${index.notQulifiedCount!=0 }">
														    <li onclick="goDetail(${index.id })">
															<label><img src="${ctxStatic}/common/img/monitor/Tips-red.png" /></label>
															${index.element } ${index.notQulifiedCount }/${index.allCount }
															</li>
															</c:if>
														</c:forEach>	
													</ul>
												 </div>
											 </c:if>
										</div>
										</c:forEach>
										</div>
									</div>
								</div>
							</div>
					<%--		<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<div class="row">
										<div class=" update-align-items "> 术前准备 </div>
										<c:forEach var="sqzb" items="${sqzbData }" varStatus="objstatus">
										<div  class="form-group flex">
											<input  readonly="readonly"  class="form-control " type="text" onclick="goIndexForm('${sqzb.node }')" value="${sqzb.node }">
											 <c:if test="${sqzb.staus==1 }">
											 	<div class="form-group-ico"><img src="${ctxStatic}/common/img/monitor/Tips-green.png" /></div>
											 </c:if>
											 <c:if test="${sqzb.staus==0 }">
												 <div class="form-group-ico"><img src="${ctxStatic}/common/img/monitor/Tips-red.png" />
												 	<ul class="elastic_list">
												 	    <c:forEach var="index" items="${sqzb.indexs }" varStatus="objstatus">
														<c:if test="${index.notQulifiedCount!=0 }">
														    <li onclick="goDetail(${index.id })">
															<label><img src="${ctxStatic}/common/img/monitor/Tips-red.png" /></label>
															${index.element } ${index.notQulifiedCount }/${index.allCount }
															</li>
															</c:if>
														</c:forEach>	
													</ul>
												 </div>
											 </c:if>
										</div>
										</c:forEach>
									</div>
								</div>
							</div>--%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	    <div role="tabpanel" class="tab-pane" id="monitor_his">
		<!-- 栏目1	-->
		<div class="row" id="selectArea">
			<div class="col-md-12">
				<div class="panel panel-primary"> 
					
					<!-- 标题end	--> 
					<!--表格内容-->
					<div class="panel-body" id="selectRowParent">
						<div class="row m-b20 ">
							<div class="bars pull-right">
								<div id="toolbar">
								    <button id="btn_select_column" class="btn btn-primary" onclick="selectColumn()"> <i class="glyphicon glyphicon-plus"></i> 自定义筛选条件 </button>
								</div>
							</div>
						</div>
						<div id="select_column" style='display:none;' class="row">
							<div id='cascadebox' style="padding:0;" class="col-sm-8">
	                          
	                        </div>
	                        <button class="btn btn-primary" onclick="cancelSelectColumn()">收起</button>
	                        <button class="btn btn-primary" onclick="confirmSelectColumn()">确认</button>
                        </div>
                        <form id="searchForm" modelAttribute="opeColumn">
						<div class="row" id="selectRow1">
							<div class="col-xs-1-5">
								<div class="form-group">
									<div class="col-md-12 update-align-items ">患者id</div>
									<div class="col-md-12">
										<input class="form-control " type="text" value=""
											name="patientId">
									</div>
								</div>
							</div>
							<div class="col-xs-1-5">
								<div class="form-group">
									<div class="col-md-12 update-align-items ">身份</div>
									<div class="col-md-12">
										<select id="selectType" name="identity" class="form-control "><option
												value="">全部</option>
											<option value="城乡居民">城乡居民</option>
											<option value="城镇职工">城镇职工</option>
											<option value="军以上干部">军以上干部</option>
											<option value="免费家属">免费家属</option>
											<option value="免费职工">免费职工</option>
											<option value="师以上退休">师以上退休</option>
											<option value="师职干部">师职干部</option>
											<option value="士兵">士兵</option>
											<option value="司局级干部">司局级干部</option>
											<option value="随军家属">随军家属</option>
											<option value="团以下干部">团以下干部</option>
											<option value="团以下退休">团以下退休</option>
											<option value="一般人员">一般人员</option>
											<option value="优惠家属">优惠家属</option></select>
									</div>
								</div>
							</div>
							<div class="col-xs-1-5">
								<div class="form-group">
									<div class="col-md-12 update-align-items ">费别</div>
									<div class="col-md-12">
										<select id="selectType" name="chargeType"
											class="form-control "><option value="">全部</option>
											<option value="地方公疗">地方公疗</option>
											<option value="地方医保">地方医保</option>
											<option value="军队医改">军队医改</option>
											<option value="全费">全费</option>
											<option value="特需服务">特需服务</option>
											<option value="武警医改">武警医改</option>
											<option value="异地医保">异地医保</option></select>
									</div>
								</div>
							</div>
						</div>
						</form>
						<div class="bars pull-right">
							<button id="search" class="btn btn-primary" onclick="search()">
								<i class="glyphicon glyphicon-search"></i> 查询
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 栏目2	-->
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary"> 
					<!-- 标题	-->
					<div class="panel-heading">
						<h3 class="panel-title">术前 </h3>
						<div class="bars pull-right-selectarea" style="margin-top:-32px">
                        					<button class="btn btn-primary" id="showHiddenSelectAreaBtn" title="收起查询区域" onclick="showHiddenSelectArea()">
                        					<i class="glyphicon  glyphicon-upload"></i>
                        					</button>
                        				</div>
					</div>
					<!-- 标题end	--> 
					<!--表格内容-->
					<div class="panel-body">
						<div class="row">
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<div class="row">
										<div class=" update-align-items " > 手术评估 </div>
										<div id='sspgDiv'>
										<c:forEach var="sspg" items="${sspgDataHis }" varStatus="objstatus">
										<div  class="form-group flex">
											<input readonly="readonly" class="form-control " type="text" onclick="goIndexForm('${sspg.node }')" value="${sspg.node }">
											 <c:if test="${sspg.staus==1 }">
											 	<div class="form-group-ico"><img src="${ctxStatic}/common/img/monitor/Tips-green.png" /></div>
											 </c:if>
											 <c:if test="${sspg.staus==0 }">
												 <div class="form-group-ico"><img src="${ctxStatic}/common/img/monitor/Tips-red.png" />
												 	<ul class="elastic_list">
												 	    <c:forEach var="index" items="${sspg.indexs }" varStatus="objstatus">
														    <c:if test="${index.notQulifiedCount!=0 }">
														    <li onclick="goDetail(${index.id })">
															<label><img src="${ctxStatic}/common/img/monitor/Tips-red.png" /></label>
															${index.element } ${index.notQulifiedCount }/${index.allCount }
															</li>
															</c:if>
														</c:forEach>	
													</ul>
												 </div>
											 </c:if>
										</div>
										</c:forEach>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<div class="row">
										<div class=" update-align-items "> 手术安排 </div>
										<div id='ssapDiv'>
										<c:forEach var="ssap" items="${ssapDataHis }" varStatus="objstatus">
										<div  class="form-group flex">
											<input readonly="readonly" class="form-control " type="text"  onclick="goIndexForm('${ssap.node }')" value="${ssap.node }">
											 <c:if test="${ssap.staus==1 }">
											 	<div class="form-group-ico"><img src="${ctxStatic}/common/img/monitor/Tips-green.png" /></div>
											 </c:if>
											 <c:if test="${ssap.staus==0 }">
												 <div class="form-group-ico"><img src="${ctxStatic}/common/img/monitor/Tips-red.png" />
												 	<ul class="elastic_list">
												 	    <c:forEach var="index" items="${ssap.indexs }" varStatus="objstatus">
														<c:if test="${index.notQulifiedCount!=0 }">
														    <li onclick="goDetail(${index.id })" style="cursor:pointer">
															<label><img src="${ctxStatic}/common/img/monitor/Tips-red.png" /></label>
															${index.element } ${index.notQulifiedCount }/${index.allCount }
															</li>
															</c:if>
														</c:forEach>	
													</ul>
												 </div>
											 </c:if>
										</div>
										</c:forEach>
										</div>
									</div>
								</div>
							</div>
			<%--				<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<div class="row">
										<div class=" update-align-items "> 术前准备 </div>
										<c:forEach var="sqzb" items="${sqzbDataHis }" varStatus="objstatus">
										<div  class="form-group flex">
											<input  readonly="readonly"  class="form-control " type="text" onclick="goIndexForm('${sqzb.node }')" value="${sqzb.node }">
											 <c:if test="${sqzb.staus==1 }">
											 	<div class="form-group-ico"><img src="${ctxStatic}/common/img/monitor/Tips-green.png" /></div>
											 </c:if>
											 <c:if test="${sqzb.staus==0 }">
												 <div class="form-group-ico"><img src="${ctxStatic}/common/img/monitor/Tips-red.png" />
												 	<ul class="elastic_list">
												 	    <c:forEach var="index" items="${sqzb.indexs }" varStatus="objstatus">
														<c:if test="${index.notQulifiedCount!=0 }">
														    <li onclick="goDetail(${index.id })" >
															<label><img src="${ctxStatic}/common/img/monitor/Tips-red.png" /></label>
															${index.element } ${index.notQulifiedCount }/${index.allCount }
															</li>
															</c:if>
														</c:forEach>	
													</ul>
												 </div>
											 </c:if>
										</div>
										</c:forEach>
									</div>
								</div>
							</div>--%>
						</div>
					</div>
				</div>
			</div>
		</div>
	   
	</div>
	
	</div>
	</div>
</body>
</html>