<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html >
	<head>
	<title>指标管理</title>
	<meta name="decorator" content="ani">
	<%@ include file="/webpage/include/bootstraptable-detail.jsp"%>
	<%@include file="/webpage/include/treeview.jsp" %>
	<%@include file="preOpePatientIndexRecList.js" %>
	<script type="text/javascript">
	$(function(){
		$(".page_title",parent.document).html("手术服务个案查询");
	})
	function showAllOrNotQualified(){
		if ($("#showAllOrNotQualified").prop("checked")) {//jquery 1.6以前版本 用 $(this).attr("checked")
			//alert("选中"); 
			$("#isQualified").val("0");
		}else {
			//alert("没有选中");
			$("#isQualified").val("1");
		}
		 $('#preOpePatientIndexRecTable').bootstrapTable('refresh');
	}
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
		function selectColumn(){
			$("#select_column").css('display','block');
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
	         var dataIndex = [];
	            //获取指标合集
	             $.ajax({
	         		url:"${ctx}/standindex/opeStIndex/getIndexList",
	         		type:"post",
	         		dataType:"json",
	         		data:{},
	         		success:function(res){	
	         			var parentlist = res.parentlist;
	         			for(var i=0;i<parentlist.length;i++){
	         				dataIndex.push(parentlist[i]);
	         			}
	         			var childlist = res.childlist;
	         			for(var i=0;i<childlist.length;i++){
	         				dataIndex.push(childlist[i]);
	         			}
	         			objIndex = cascadeBox('cascadeboxIndex','checkboxname',dataIndex,[],[],true,true,null);
	         		},
	         		fail:function(err){
	         			console.log(err);
	         		}
	         	});	
	    });
		function selectIndex (){
        	$("#select_index").css('display','block');
        }
        function cancelSelectIndex (){
        	$("#select_index").css('display','none');
        }
        function confirmSelectIndex(){
        	$("#select_index").css('display','none');
        	var index_ids=objIndex.get_data();//选中id数组
        	$("#indexIds").val(index_ids);
        	  $('#preOpePatientIndexRecTable').bootstrapTable('refresh');
        }
	</script>
	</head>
	<body>
<!--  主体内容	-->
	<div class="wrapper wrapper-content"> 
		<!-- 栏目1	-->
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary"> 
					
					<!-- 标题end	--> 
					<!--表格内容-->
					<div class="panel-body" style="overflow:scroll;">
						<div class="row m-b20 ">
							<div class="bars pull-right">
								    <button id="btn_select_column" class="btn btn-primary" onclick="selectColumn()"> <i class="glyphicon glyphicon-plus"></i> 自定义筛选条件 </button>
							</div>
						</div>
						<div id="select_column" style='display:none;' class="row">
							<div id='cascadebox' style="padding:0;" class="col-sm-8">
	                          
	                        </div>
	                        <button class="btn btn-primary" onclick="confirmSelectColumn()">确认</button>
                        </div>
						<form:form id="searchForm" >
						<input type='hidden' id='isQualified' name='isQualified' value="${entity.isQualified}">
						<input type='hidden' id='indexId' name='indexId' value="${entity.indexId}">
						<input type='hidden' id='chartId' name='chartId' value="${entity.chartId}">
						<input type='hidden' id='node' name='node' value="${entity.node}">
						<input type='hidden' value='' id='indexIds' name='indexIds'>
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
						
						</form:form>
						<div id="select_index" style='display:none;' class="row">
							<div id='cascadeboxIndex' style="padding:0;" class="col-sm-8">
	                          
	                        </div>
	                        <button class="btn btn-primary" onclick="cancelSelectIndex()">收起</button>
	                        <button class="btn btn-primary" onclick="confirmSelectIndex()">确认</button>
                        </div>
						<div class="bars pull-right">
						    <button id="search" class="btn btn-primary" onclick="selectIndex()">
								<i class="glyphicon glyphicon-search"></i> 选择指标
							</button>
							<button id="search" class="btn btn-primary">
								<i class="glyphicon glyphicon-search"></i> 查询
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
			<!-- 栏目3	-->
		<div class="row">
							<div class="report-page-box">
			
			<div class="report-page-boxmain">
				<div class="report-page-box">
					
					<h2 class="detail_h2">2018年12月11日-2019年03月15日 手术患者明细</h2>
					<!-- 表格 -->
					<table id="preOpePatientIndexRecTable"   data-toolbar="#toolbar" ></table>
					<input id="showAllOrNotQualified" type="checkbox" onclick="showAllOrNotQualified()"/>只显示不达标患者  
				</div>
			</div>

			
		</div>
						</div>
	</div>
</body>
<script>
function search(){
	//判断手术服务是否是不合格
	$.ajax({
	    type: "post",
	    url: "/ps/a/indexForm/indexForm/indexFormData",
	    data: {},
	    dataType: "json",
	    success: function(result){
	    	if(result[0].isQuilified){
	    		$("#opeQulified").attr('src',"${ctxStatic}/common/img/modules/Tips-green.png");
	    	}else{
	    		$("#opeQulified").attr('src',"${ctxStatic}/common/img/modules/Tips-red.png");
	    	}
	    }
	});
}
</script>
</html>