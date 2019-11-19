<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
<title>柱状图</title>
<meta name="decorator" content="ani">
<%@ include file="/webpage/include/echarts.jsp"%>
<!-- 引入 echarts.js -->
<script src="${ctxStatic}/plugin/highcharts/highcharts.js"></script>
<script src="${ctxStatic}/plugin/highcharts/drilldown.js"></script>
<script>
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
	$(".page_title",parent.document).html("手术服务柱状图");
})
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
});

    function search(){
    	 $.ajax({
				url:"${ctx}/opebarchart/opeBarChart/stageBarData",
				type:"post",
				dataType:"json",
				data:$("#searchForm").serializeJSON(),
				success:function(res){	
					showBar(res.xAxisData,res.seriesData,res.seriesDataLastYear);
				},
				fail:function(err){
					console.log(err);
				}
			});	
    }
	$(function(){
			 $.ajax({
				url:"${ctx}/opebarchart/opeBarChart/stageBarData",
				type:"post",
				dataType:"json",
				data:{},
				success:function(res){	
					showBar(res.xAxisData,res.seriesData,res.seriesDataLastYear);
				},
				fail:function(err){
					console.log(err);
				}
			});	
	})
	function showBar(xAxisData,seriesData,seriesDataLastYear){
		$("#returnStageSpan").html('');
		const myChart = echarts.init(document.getElementById('lineChart'),true);
	    window.onresize = myChart.resize;
		myChart.clear();
		const option = {
	    	    color: ['#003366', '#006699', '#4cabce', '#e5323e'],
	    	    tooltip: {
	    	        trigger: 'axis',
	    	        axisPointer: {
	    	            type: 'shadow'
	    	        },
	    	        formatter: function(datas){
	    	        	var res="";
		                for(var i = 0, length = datas.length; i < length; i++) {
		                	console.log(datas[i])
	                        res += datas[i].seriesName + '：' + (datas[i].value) + '例不达标数据' + '<br/>';
	                    }
		                    return res;
		            }
	    	    },
	    	    legend: {
	    	        data: ['今年', '去年',]
	    	    },
	    	    toolbox: {
	    	        show: true,
	    	        orient: 'vertical',
	    	        left: 'right',
	    	        top: 'center',
	    	        
	    	    },
	    	    calculable: true,
	    	    xAxis: [
	    	        {
	    	         name:'阶段',
	    	            type: 'category',
	    	            axisTick: {show: false},
	    	            data: xAxisData,
	    	        }
	    	    ],
	    	    yAxis: [
	    	        {   name:'不达标例数',
	    	            type: 'value'
	    	        }
	    	    ],
	    	    series: [
	    	        {
	    	            name: '今年',
	    	            type: 'bar',
	    	            data: seriesData,
	    	        },
	    	        {
	    	            name: '去年',
	    	            type: 'bar',
	    	            data: seriesDataLastYear,
	    	        },
	    	       
	    	    ]
	    	};
		myChart.setOption(option);
		myChart.on('click',(params)=>{
			$("#stageName").val(params.name);//术前
			//$("#stageYear").val(params.seriesName);//今年
			 $.ajax({
					url:"${ctx}/opebarchart/opeBarChart/segmentBarData",
					type:"post",
					dataType:"json",
					data:$("#searchForm").serializeJSON(),
					success:function(res){
						myChart.dispose();
						showSegmentBar(res.xAxisData,res.seriesData,res.seriesDataLastYear,params.name);
					},
					fail:function(err){
						console.log(err);
					}
				});	
			
	    })
	}

	function showSegmentBar(xAxisData,seriesData,seriesDataLastYear,stageName){

		$("#returnStageSpan").html('<button  onclick="returnStage()">返回阶段柱状图</button>');
		const myChart1 = echarts.init(document.getElementById('lineChart'),true);
	    window.onresize = myChart1.resize;
		myChart1.clear();
		const option = {
	    	    color: ['#003366', '#006699', '#4cabce', '#e5323e'],
	    	    tooltip: {
	    	        trigger: 'axis',
	    	        axisPointer: {
	    	            type: 'shadow'
	    	        }
	    	    },
	    	    legend: {
	    	        data: ['今年', '去年',]
	    	    },
	    	    toolbox: {
	    	        show: true,
	    	        orient: 'vertical',
	    	        left: 'right',
	    	        top: 'center',
	    	       
	    	    },
	    	    calculable: true,
	    	    xAxis: [
	    	        {
	    	         name:'环节',
	    	            type: 'category',
	    	            axisTick: {show: false},
	    	            data: xAxisData,
	    	        }
	    	    ],
	    	    yAxis: [
	    	        {
	    	         name:'不达标例数',
	    	            type: 'value'
	    	        }
	    	    ],
	    	    series: [
	    	        {
	    	            name: '今年',
	    	            type: 'bar',
	    	            data: seriesData,
	    	        },
	    	        {
	    	            name: '去年',
	    	            type: 'bar',
	    	            data: seriesDataLastYear,
	    	        },
	    	       
	    	    ]
	    	};
		myChart1.setOption(option);
		myChart1.on('click',(params)=>{
			myChart1.clear();
			$("#stageName").val(params.name);
			$("#stageYear").val(params.seriesName);

			 $.ajax({
					url:"${ctx}/opebarchart/opeBarChart/nodeBarData",
					type:"post",
					dataType:"json",
					data:$("#searchForm").serializeJSON(),
					success:function(res){
						myChart1.dispose();
						showNodeBar(res.xAxisData,res.seriesData,res.seriesDataLastYear,stageName);
					},
					fail:function(err){
						console.log(err);
					}
				});	
			
	    })
	}
	function returnStage(){

		search();
	}
	function returnSemgent(stageName){
		$("#stageName").val(stageName);//术前
		//$("#stageYear").val(params.seriesName);//今年
		$.ajax({
			url:"${ctx}/opebarchart/opeBarChart/segmentBarData",
			type:"post",
			dataType:"json",
			data:$("#searchForm").serializeJSON(),
			success:function(res){
				showSegmentBar(res.xAxisData,res.seriesData,res.seriesDataLastYear,stageName);
			},
			fail:function(err){
				console.log(err);
			}
		});
	}
	function showNodeBar(xAxisData,seriesData,seriesDataLastYear,stageName){
		$("#returnStageSpan").html('<button  onclick="returnSemgent(\''+stageName+'\')">返回环节柱状图</button>');
		const myChart2 = echarts.init(document.getElementById('lineChart'),true);
	    window.onresize = myChart2.resize;
		myChart2.clear();
	    const option = {
	    	    color: ['#003366', '#006699', '#4cabce', '#e5323e'],
	    	    tooltip: {
	    	        trigger: 'axis',
	    	        axisPointer: {
	    	            type: 'shadow'
	    	        }
	    	    },
	    	    legend: {
	    	        data: ['今年', '去年',]
	    	    },
	    	    toolbox: {
	    	        show: true,
	    	        orient: 'vertical',
	    	        left: 'right',
	    	        top: 'center',
	    	       
	    	    },
	    	    calculable: true,
	    	    xAxis: [
	    	        {
	    	         name:'节点',
	    	            type: 'category',
	    	            axisTick: {show: false},
	    	            data: xAxisData,
	    	        }
	    	    ],
	    	    yAxis: [
	    	        {
	    	         name:'不达标例数',
	    	            type: 'value'
	    	        }
	    	    ],
	    	    series: [
	    	        {
	    	            name: '今年',
	    	            type: 'bar',
	    	            data: seriesData,
	    	        },
	    	        {
	    	            name: '去年',
	    	            type: 'bar',
	    	            data: seriesDataLastYear,
	    	        },
	    	       
	    	    ]
	    	};
		myChart2.setOption(option);
		myChart2.on('click',(params)=>{
        	window.location.href="/ps/a/opedetail/opeDetail/opeDetail?isQualified=0&node="+params.name;
	    })
	}	
	
</script>
</head>
<body>
	<!--  主体内容	-->
		<div class="conter-wrapper home-container wrapper-content">
				<!-- 栏目1	-->
		<div class="row" id="selectArea">
			<div class="col-md-12">
				<div class="panel panel-primary"> 
					
					<!-- 标题end	--> 
					<!--表格内容-->
					<div class="panel-body">
						<div class="row m-b20 ">
							<div class="bars pull-right">
								    <button id="btn_select_column" class="btn btn-primary" onclick="selectColumn()"> <i class="glyphicon glyphicon-plus"></i> 自定义筛选条件 </button>
							</div>
						</div>
						<div id="select_column" style='display:none;' class="row">
							<div id='cascadebox' style="padding:0;" class="col-sm-8">
	                          
	                        </div>
	                        <button class="btn btn-primary" onclick="cancelSelectColumn()">收起</button>
	                        <button class="btn btn-primary" onclick="confirmSelectColumn()">确认</button>
                        </div>
                        <form id="searchForm" modelAttribute="opeColumn">
                        <input id="stageName" type="hidden" value="" name="stageName">
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

		<div class="row home-row">

        				<div class="col-md-12">
        				<div class="panel panel-primary">
        				<div class="pull-right-selectarea" style="margin-top:0px">
							<span id="returnStageSpan">
							<button  onclick="returnStage()">返回阶段柱状图</button>
							</span>
                            <button class="btn btn-primary" id="showHiddenSelectAreaBtn" title="收起查询区域" onclick="showHiddenSelectArea()">
                            <i class="glyphicon  glyphicon-upload"></i>
                            </button>
                        </div>
                        </div>
                        </div>
                        </div>
			<!-- 栏目2	-->

			<div class="row home-row">

				<div class="col-md-12">

					<div class="panel panel-primary">

						<div class="chart-container">
							<div id="lineChart" style="width: 100%;height: 500px"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>

</html>