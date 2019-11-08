<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
<meta name="decorator" content="ani">
<title>demo</title>
<script src="https://cdn.staticfile.org/axios/0.18.0/axios.min.js"></script>
<script src="${ctxStatic}/common/js/flowcharts/ramda.min.js"></script>
<script src="${ctxStatic}/common/js/flowcharts/snap.svg-min.js"></script>
<script src="${ctxStatic}/common/js/flowcharts/vue.js"></script>
<link rel="stylesheet" href="${ctxStatic}/common/css/flowcharts/tree.css" />
<script>var __ = R.__ </script>


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
	<div>
		<div class="tree_head">
			<div class="tree_nav_list">
				<ul>
					<li id="flow-back"><a href="#"><img
							src="${ctxStatic}/common/img/flowcharts/btn-left.png" alt=""></a></li>
					<li id="flow-next"><a href="#"><img
							src="${ctxStatic}/common/img/flowcharts/btn-right.png" alt=""></a></li>
							<div class="bars pull-right-selectarea" style="margin-top:0px">
                                <button class="btn btn-primary" id="showHiddenSelectAreaBtn" title="收起查询区域" onclick="showHiddenSelectArea()">
                                <i class="glyphicon  glyphicon-upload"></i>
                                </button>
                            </div>

				</ul>
			</div>
		</div>
	</div>


	<div id="board" class="board" :style="board">

		<svg ref="svg"></svg>

		<div class="node" v-for="node in nodes" :style="position(node)">
			<!--    示例     -->
			<ul class="tree_ico_list">
				<li v-if="node.documentUrl"><a :href="node.documentUrl"
					target="_blank"><img
						src="${ctxStatic}/common/img/flowcharts/tree-ico.png" /></a></li>
				<li v-if="node.nextLowLevel"
					@click.stop="loadNewPage(node.nextLowLevel)"><img
					src="${ctxStatic}/common/img/flowcharts/tree-ico1.png" /></li>
				<li v-if="node.description" class="elastic"><img
					src="${ctxStatic}/common/img/flowcharts/tree-ico2.png" />
					<div class="tree_main">{{ node.description }}</div></li>
				<li v-if="node.status ==0"><img
					src="${ctxStatic}/common/img/flowcharts/tree-ico3.png" @click.stop="goDetail(node)"/></li>
			</ul>
			<p class="text">{{ node.text }}</p>
			<div class="tit">{{ node.title }}</div>
		</div>

		<div class="symbol" v-for="symbol in symbols"
			:style="positionSymbol(symbol)">{{ symbol.title }}</div>
	</div>

</div>
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
		$(".page_title",parent.document).html("手术服务流程监测");
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

	
	    
        const nodeWidth = 150       //节点宽度
        const nodeHeight = 100      //节点高度
        const colWidth = 200        //列宽
        const rowHeight = 200       //行高
        const symbolSide = 30       //符号边长
        
        // 获取起止点坐标
        function points (n1, n2) {
            if (n2.col > n1.col) {
                return [rightMiddle(n1), leftMiddle(n2)]
            } else if (n2.col < n1.col){
                return [leftMiddle(n1), rightMiddle(n2)]
            } else if (n2.row > n1.row){
                return [bottomMiddle(n1), topMiddle(n2)]
            } else {
                return [topMiddle(n1), bottomMiddle(n2)]
            }
        }
        
        function rightMiddle (node) {
            return [node.col * colWidth + nodeWidth, node.row * rowHeight + nodeHeight / 2]
        }
        function leftMiddle (node) {
            return [node.col * colWidth, node.row * rowHeight + nodeHeight / 2]
        }
        function bottomMiddle (node) {
            return [node.col * colWidth + nodeWidth / 2, node.row * rowHeight + nodeHeight]
        }
        function topMiddle (node) {
            return [node.col * colWidth + nodeWidth / 2, node.row * rowHeight]
        }
        
        // 历史记录对象
       const FlowHistory = {
		    paths: [],
		    index: 1,
		    push(item) {
		        this.paths = this.paths.slice(0, this.index)
		        this.paths.push(item)
		        this.index = this.paths.length
		    },
		    back() {
		        if (this.hasPrev()) {
		            this.index = this.index - 1
		        }
		        return this.paths[this.index - 1]
		    },
		    next() {
		        if (this.hasNext()) {
		            this.index = this.index + 1
		        }
		        return this.paths[this.index - 1]
		    },
		    hasPrev() {
		        return this.index > 1
		    },
		    hasNext() {
		        return this.index < this.paths.length
		    }
		}
    
        const flowChart = new Vue({
            el: '#board',
            data: {
                paper: null,
                pageId: 1,
                name: 'soni',
                nodes: [],
                lines: [],
                symbols: []
            },
            computed: {
                board () {
                    const rows = R.reduce((rows, node) => R.max(rows, node.row), 0, this.nodes) + 1
                    return {
                        height: rows * rowHeight + 'px'
                    }
                }
            },
            methods: {
                loadPrevPage () {
                    if (FlowHistory.hasPrev()) {
                    	//console.log("FlowHistory.back():"+FlowHistory.back());
                    	//FlowHistory.currentPaths();
                        this.loadPage(FlowHistory.back())
                    }
                },
                loadNextPage () {
                    if (FlowHistory.hasNext()) {
                        this.loadPage(FlowHistory.next())
                    }
                },
                loadNewPage (pageId) {
                    FlowHistory.push(pageId) 
                    //FlowHistory.currentPaths();
                    this.loadPage(pageId)
                },
                goDetail(node){
            		
            		if(node.nextLowLevel){
            			
            		}else{
            			chartId=node.chartId;
            			console.log("chartId："+chartId)
            			window.location.href="/ps/a/opedetail/opeDetail/opeDetail?isQualified=0&chartId="+chartId;
            		}
            	},
                loadPage (pageId) {

                    this.clearBoard();
                    //请求后台数据
                    axios({
                        method:'post',
                        url:'${ctx}/flowchart/flowChart/flowChartData?pageId='+pageId
                    }).then(res => {
                         this.renderBoard(res.data);
                    }) 
                },
                renderBoard (data) {
                    this.nodes = data.nodes
                    this.lines = data.lines
                
                    var paper = this.paper || Snap(this.$refs.svg)
                    
                    R.forEach(line => {
                        const paths = this.linePath(line)
                        R.forEach(([x1, y1, x2, y2]) => {
                            const line = paper.line(x1, y1, x2, y2)
                            line.attr({
                                stroke: "#1890FF",
                                strokeWidth: 1
                            })
                        }, paths)
                        
                        const endPoint = paper.circle(paths[2][2], paths[2][3], 5)
                        endPoint.attr({
                            fill: "#bada55",
                            stroke: "#1890FF",
                            strokeWidth: 1
                        })
                        
                        const symbols = line.symbols || []
                        R.forEach(symbol => {
                            this.symbols.push(this.createSymbol(symbol, paths[1]))
                        }, symbols)
                    }, this.lines)
                    
                    this.paper = paper
                },
                clearBoard () {
                    this.nodes = []
                    this.lines = []
                    this.symbols = []
                    this.paper && this.paper.clear() 
                },
                position (item) {
                    return {
                        left: item.col * colWidth + 'px',
                        top: item.row * rowHeight + 'px',
                        width: nodeWidth + 'px',
                        height: nodeHeight + 'px'
                    }
                },
                linePath (line) {
                    const sourceNode = R.find(R.propEq('id', line.source), this.nodes)
                    const targetNode = R.find(R.propEq('id', line.target), this.nodes)
                    
                    const [start, end] = points(sourceNode, targetNode)
                    
                    const middle = start[0] + (end[0] - start[0]) / 2
                    return [
                        [start[0], start[1], middle, start[1]],
                        [middle, start[1], middle, end[1]],
                        [middle, end[1], end[0], end[1]]
                    ]
                },
                createSymbol (symbol, line) {
                    const cy = line[1] + (line[3] - line[1]) / 2
                    const cx = line[0]
                    return Object.assign({
                        position: {
                            left: cx - symbolSide / 2 + 'px',
                            top: cy - symbolSide / 2 + 'px'
                        }
                    }, symbol)
                },
                positionSymbol (symbol) {
                    return symbol.position
                }
            },
            mounted () {
            	this.loadNewPage(0)
            }
        })
        
        
        document.querySelector('#flow-back').addEventListener('click', function(e){
            flowChart.loadPrevPage()
        }, false)
        
        document.querySelector('#flow-next').addEventListener('click', function(e){
            flowChart.loadNextPage()
        }, false)
      
    </script>
</body>
</html>