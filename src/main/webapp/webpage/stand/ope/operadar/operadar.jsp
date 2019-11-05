<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
    <meta name="decorator" content="ani">
    <script src="${ctxStatic}/plugin/d3/d3-selection.v1.min.js"></script>
    <script src="${ctxStatic}/plugin/d3/d3-path.v1.min.js"></script>
    <script src="${ctxStatic}/plugin/d3/d3-shape.v1.min.js"></script>
    <script src="${ctxStatic}/plugin/d3/d3-array.v1.min.js"></script>
    <script src="${ctxStatic}/plugin/d3/d3-collection.v1.min.js"></script>
    <script src="${ctxStatic}/plugin/d3/d3-format.v1.min.js"></script>
    <script src="${ctxStatic}/plugin/d3/d3-interpolate.v1.min.js"></script>
    <script src="${ctxStatic}/plugin/d3/d3-scale.v2.min.js"></script>
    <script src="${ctxStatic}/common/js/radar/ramda.min.js"></script>
    <style>
        #svg{
            margin: auto;
        }
        .legend{
            padding-left: 2em;
            line-height: 1.8em;
        }
        
        .legend .color {
            padding: 0 0.6em;
            margin: 0 1em 0 .2em;
            line-height: .8em;
            background-color: #ccc;
            outline: solid 1px #ccc;
        }
        .legend .color.before {
            background-color: #1890FF;
        }
        .legend .color.operating {
            background-color: #F7212B;
        }
        .legend .color.after {
            background-color: #53C41A;
        }
    </style>
    
</head>
<body>
    <div class="wrapper wrapper-content"> 
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
						<div class="row" id="selectRow1">
						    <input type='hidden' value='' id='indexIds' name='indexIds'>
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
							<button id="search" class="btn btn-primary" onclick="search()">
								<i class="glyphicon glyphicon-search"></i> 查询
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
   </div>

    <div class="legend">
        图例: 
        术前<span class="color before"></span>
        术中<span class="color operating"></span>
        术后<span class="color after"></span>
        <div class="bars pull-right-selectarea" style="margin-top:0px">
                                        <button class="btn btn-primary" id="showHiddenSelectAreaBtn" title="收起查询区域" onclick="showHiddenSelectArea()">
                                        <i class="glyphicon  glyphicon-upload"></i>
                                        </button>
                                    </div>
    </div>
    <svg id="svg" width="840" height="760" viewBox="0,0,840,760"></svg>

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
		$(".page_title",parent.document).html("手术服务雷达图");
	})
        // 数据集
        // 二维数组
        // before, operating, after
        $(function(){
        	showRadar();
        })
        function goDetail(d){
        	alert(JSON.stringify(d))
        }
        function showRadar(){
        	$.ajax({
    		    type: "post",
    		    url: "/ps/a/operadar/operadar/getOpeDetailList",
    		    data: $("#searchForm").serializeJSON(),
    		    dataType: "json",
    		    success: function(result){
    		    	var dataset=[];
    		    	console.log(result.preOpeRadarData);
    		    	dataset.push(result.preOpeRadarData);
    		    	renderChart('#svg', dataset, {
    		            // 分级算法, value -> level, 由低到高
    		            level: function(value) {
    		                if (value < 1) {
    		                    return 0
    		                }
    		                return 2
    		            },
    		            // 兴趣点点击事件处理
    		            clickPoint: function(d, index) {
    		            	if(d.value<1){
								window.location.href="/ps/a/opedetail/opeDetail/opeDetail?isQualified=0&indexId="+d.id;
							}

    		            },
    		            // 格式化提示信息
    		            formatTip: function(d, index) {
    		                const years = ['上一年', '今年']
    		                return years[index] + '(' + d.title + '):' + (d.value*100).toFixed(2)+'%'
    		            }
    		        })
    		    }
    		});
        }
        
        
        
        // 选择器, 数据集, 配置项
        function renderChart (selector, dataset, config) {
            config = R.mergeRight({
                levelColors: [
                    '#F7212B',
                    '#1890FF',
                    '#53C41A'
                ],
                // level
                pieColors: [
                    '#E5E5E5',
                    '#BFBFBF',
                    '#D9D9D9'
                ],
                doughnutColors: [
                    '#1890FF',
                    '#F7212B',
                    '#53C41A'
                ]
            }, config)
        
            // 初始化
            const svg = d3.select('#svg')
            const width = 840
            const height = 760
            
            const {
                levelColors,
                level,
                pieColors,
                doughnutColors,
                clickPoint,
                formatTip
            } = config
            
            // 饼图
            const per = Math.PI * 2 / R.flatten(dataset).length * -1
            const pieDataset = (function(dataset){
                let startAngle = per / -2
                return R.map(function(item){
                    const endAngle = startAngle + item.length * per
                    const result = [startAngle, endAngle]
                    startAngle = endAngle
                    return result
                }, dataset)
            })(dataset)
            
            const pieArc = d3.arc()
                .innerRadius(0)
                .outerRadius(280)
                
            const pieArcs = svg.selectAll('g.pie-arc')
                .data(pieDataset)
                .enter()
                .append('g')
                .attr('class', 'pie-arc')
                .attr('transform', 'translate(' + width/2 + ',' + height/2 + ')')    
                
            const piePaths = pieArcs.append('path')
                .attr('d', function(d) {
                    return pieArc({
                        startAngle: d[0],
                        endAngle: d[1]
                    })
                })
                .attr('fill', function(d, i) {
                    return pieColors[i]
                })
                .attr('stroke', 0)
                
            // 环形图    
            const doughnutArc = d3.arc()
                .innerRadius(250)
                .outerRadius(280)
            
            const doughnutArcs = svg.selectAll('g.doughnut-arc')
                .data(pieDataset)
                .enter()
                .append('g')
                .attr('class', 'doughnut-arc')
                .attr('transform', 'translate(' + width/2 + ',' + height/2 + ')')
                
            const doughnutPaths = doughnutArcs.append('path')
                .attr('d', function(d) {
                    return doughnutArc({
                        startAngle: d[0],
                        endAngle: d[1]
                    })
                })
                .attr('fill', function(d, i) {
                    return doughnutColors[i]
                })
                .attr('stroke', 0)

            // 轴线
            const lineDataset = R.flatten(dataset)
            
            const scala = d3.scaleLinear()
            scala.domain([0, 1])
            scala.range([0, 320])
            
            const axis = svg.selectAll('g.axis')
                .data(lineDataset)
                .enter()
                .append('g')
                .attr('class', 'axis')
                .attr('transform', 'translate(' + width/2 + ',' + height/2 + ')')
                
            
            
            const lines = axis.append('path')
                .attr('d', function(d, i){
                    return 'M0,0,L' + scala(Math.cos(per * i - Math.PI/2)) + ',' + scala(Math.sin(per * i - Math.PI/2)) + 'Z'
                    
                })
                .attr('stroke', '#ccc')
                .attr('stroke-opacity', '0.7')
                
            // label
            const labelScala = d3.scaleLinear()
            labelScala.domain([0, 1])
            labelScala.range([0, 350])
            
            const labels = axis.append('text')
                .attr('x', function(d, i){
                    return labelScala(Math.cos(per * i - Math.PI/2))
                })
                .attr('y', function(d, i){
                    return labelScala(Math.sin(per * i - Math.PI/2))
                })
                .attr('text-anchor', 'middle')
                .text(function(d){
                    return d.title
                })
                
            // 线
            const pointScala = d3.scaleLinear()
            pointScala.domain([0, 1])
            pointScala.range([0, 240])
            
            const lastYearDataset = R.map(function (item) {
                return R.mergeRight(item, {
                    value: item.value[0]
                })
            }, R.flatten(dataset))
            
            const currentYearDataset = R.map(function (item) {
                return R.mergeRight(item, {
                    value: item.value[1]
                })
            }, R.flatten(dataset))
            
            renderPathAndPoints(lastYearDataset, 0)
            renderPathAndPoints(currentYearDataset, 1)
            
            function renderPathAndPoints (dataset, index) {
                const lineColors = [
                    '#999',
                    '#333'
                ]
            
                const pointDataset = R.addIndex(R.map)(function(item, i){
                    return R.mergeRight(item, {
                        x : pointScala(Math.cos(per * i - Math.PI/2) * item.value),
                        y : pointScala(Math.sin(per * i - Math.PI/2) * item.value)
                    })
                }, R.flatten(dataset))
                

                const linePath = R.aperture(2, [...pointDataset, pointDataset[0]])
                
                const paths = svg.selectAll('g.path' + '-' + index)
                    .data(linePath)
                    .enter()
                    .append('g')
                    .attr('class', 'path' + '-' + index)
                    .attr('transform', 'translate(' + width/2 + ',' + height/2 + ')')
                    
                const pathLine = paths.append('path')
                    .attr('d', function(d) {
                        const line = d3.path()
                        line.moveTo(d[0].x, d[0].y)
                        line.lineTo(d[1].x, d[1].y)
                        line.closePath()
                        return line.toString()
                    })
                    .attr('stroke', lineColors[index])
                    .attr('stroke-width', '1')
                    .attr('fill-opacity', '0')
                    
                // 点
                const levelColor = function (value) {
                    return levelColors[level(value)]
                }
                
                const points = svg.selectAll('g.point' + '-' + index)
                    .data(pointDataset)
                    .enter()
                    .append('g')
                    .attr('class', 'point' + '-' + index)
                    .attr('transform', 'translate(' + width/2 + ',' + height/2 + ')')
                    
                    
                const circles = points.append('circle')
                    .attr('cx', function(d, i) {
                        return d.x
                    })
                    .attr('cy', function(d, i) {
                        return d.y
                    })
                    .attr('r', '8')
                    .attr('fill', '#fff')
                    .attr('stroke', function(d){
                        return levelColor(d.value)
                    })
                    .attr('stroke-width', '1')
                    .on('click', function(d) {
                        clickPoint(d)
                    })
                    .on('mouseover', function() {
                        d3.select(this)
                        .attr('fill', '#ccc')
                    })
                    .on('mouseout', function() {
                        d3.select(this)
                        .attr('fill', '#fff')
                    })
                    .append('title')
                    .text(function(d) {
                        return formatTip(d, index)
                    })
                const innerCircles = points.append('circle')
                    .attr('cx', function(d, i) {
                        return d.x
                    })
                    .attr('cy', function(d, i) {
                        return d.y
                    })
                    .attr('r', '4')
                    .attr('fill', function(d){
                        return levelColor(d.value)
                    })
                    .attr('stroke-width', '0')
                    .on('click', function(d) {
                        clickPoint(d)
                    })
                    .append('title')
                    .text(function(d) {
                        return formatTip(d, index)
                    })
            }
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
        var objIndex;
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
        	search();
        }
            function search(){
            	$("#svg").html('');
            	showRadar();
            }          

    </script>
</body>
</html>