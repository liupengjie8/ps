<%@ page contentType="text/html;charset=UTF-8" %>
<script>
	$(function(){
		$(".page_title",parent.document).html("手术服务个案查询");

		if($("#isQualified").val()=='0'){
			$("#showAllOrNotQualified").attr("checked",true);
		}else{
			$("#showAllOrNotQualified").removeAttr("checked");;
		}
	})

$(document).ready(function() {
	$('#preOpePatientIndexRecTable').bootstrapTable({
		 
		  //请求方法
               method: 'post',
               //类型json
               dataType: "json",
               contentType: "application/x-www-form-urlencoded",
               //显示检索按钮
	           showSearch: false,
               //显示刷新按钮
               showRefresh: false,
               //显示切换手机试图按钮
               showToggle: false,
               //显示 内容列下拉框
    	       showColumns: true,
    	       //显示到处按钮
    	       showExport: false,
    	       //显示切换分页按钮
    	       showPaginationSwitch: false,
    	       //最低显示2行
    	       minimumCountColumns: 2,
               //是否显示行间隔色
               striped: true,
               //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）     
               cache: false,    
               //是否显示分页（*）  
               pagination: true,   
                //排序方式 
               sortOrder: "asc",  
               //初始化加载第一页，默认第一页
               pageNumber:1,   
               //每页的记录行数（*）   
               pageSize: 10,  
               //可供选择的每页的行数（*）    
               pageList: [10, 25, 50, 100],
               //这个接口需要处理bootstrap table传递的固定参数,并返回特定格式的json数据  
               url: "${ctx}/preopedetail/preOpePatientIndexRec/data",
               //默认值为 'limit',传给服务端的参数为：limit, offset, search, sort, order Else
               //queryParamsType:'',   
               ////查询参数,每次调用是会带上这个参数，可自定义                         
               queryParams : function(params) {
               	var searchParam = $("#searchForm").serializeJSON();
               	searchParam.pageNo = params.limit === undefined? "1" :params.offset/params.limit+1;
               	searchParam.pageSize = params.limit === undefined? -1 : params.limit;
               	searchParam.orderBy = params.sort === undefined? "" : params.sort+ " "+  params.order;
                   return searchParam;
               },
               //分页方式：client客户端分页，server服务端分页（*）
               sidePagination: "server",
               contextMenuTrigger:"right",//pc端 按右键弹出菜单
               contextMenuTriggerMobile:"press",//手机端 弹出菜单，click：单击， press：长按。
               contextMenu: '#context-menu',
               onContextMenuItem: function(row, $el){
                   if($el.data("item") == "edit"){
                   		edit(row.id);
                   }else if($el.data("item") == "view"){
                       view(row.id);
                   } else if($el.data("item") == "delete"){
                        jp.confirm('确认要删除该术前明细记录吗？', function(){
                       	jp.loading();
                       	jp.get("${ctx}/preopedetail/preOpePatientIndexRec/delete?id="+row.id, function(data){
                   	  		if(data.success){
                   	  			$('#preOpePatientIndexRecTable').bootstrapTable('refresh');
                   	  			jp.success(data.msg);
                   	  		}else{
                   	  			jp.error(data.msg);
                   	  		}
                   	  	})
                   	   
                   	});
                      
                   } 
               },
              
               onClickRow: function(row, $el){
               },
               	onShowSearch: function () {
			$("#search-collapse").slideToggle();
		},
               columns: [{
		        checkbox: true
		       
		    }
			,{
		        field: 'indexId',
		        title: '指标id',
		        sortable: true,
		        sortName: 'indexId'
		        ,formatter:function(value, row , index){
		        	value = jp.unescapeHTML(value);
				   <c:choose>
					   <c:when test="${fns:hasPermission('preopedetail:preOpePatientIndexRec:edit')}">
					      return "<a href='javascript:edit(\""+row.id+"\")'>"+value+"</a>";
				      </c:when>
					  <c:when test="${fns:hasPermission('preopedetail:preOpePatientIndexRec:view')}">
					      return "<a href='javascript:view(\""+row.id+"\")'>"+value+"</a>";
				      </c:when>
					  <c:otherwise>
					      return value;
				      </c:otherwise>
				   </c:choose>
		         }
		       
		    }
			,{
		        field: 'indexName',
		        title: '指标名称',
		        sortable: true,
		        sortName: 'indexName',
		        class: 'W200',
		       
		    }
			,{
		        field: 'element',
		        title: '要素',
		        sortable: true,
		        sortName: 'element',
		        class: 'W300',
		       
		    }
			,{
		        field: 'dataDate',
		        title: '数据时间',
		        sortable: true,
		        sortName: 'dataDate'
		       
		    }
			,{
		        field: 'patientId',
		        title: '患者id',
		        sortable: true,
		        sortName: 'patientId'
		       
		    }
			,{
		        field: 'patientName',
		        title: '患者姓名',
		        sortable: true,
		        sortName: 'patientName'
		       
		    },{
		        field: 'sex',
		        title: '性别',
		        sortable: true,
		        sortName: 'sex'
		       
		    }
			,{
		        field: 'visitId',
		        title: '入院次数id',
		        sortable: true,
		        sortName: 'visitId'
		       
		    }
			,{
		        field: 'identity',
		        title: '身份',
		        sortable: true,
		        sortName: 'identity',
		        class: 'W80',
		       
		    }
			,{
		        field: 'chargeType',
		        title: '费别',
		        sortable: true,
		        sortName: 'chargeType'
		       
		    }
			,{
		        field: 'birthPlace',
		        title: '出生地',
		        sortable: true,
		        sortName: 'birthPlace'
		       
		    }
			,{
		        field: 'operationNo',
		        title: '手术序号',
		        sortable: true,
		        sortName: 'operationNo'
		       
		    }
			,{
		        field: 'operationCode',
		        title: '手术编码',
		        sortable: true,
		        sortName: 'operationCode'
		       
		    }
			,{
		        field: 'opeStartTime',
		        title: '手术开始时间',
		        sortable: true,
		        sortName: 'opeStartTime'
		       
		    }
			,{
		        field: 'opeEndTime',
		        title: '手术结束时间',
		        sortable: true,
		        sortName: 'opeEndTime'
		       
		    }
			,{
		        field: 'isQualified',
		        title: '是否达标',
		        sortable: true,
		        sortName: 'isQualified',
		        formatter:function(value, row , index){
		        	if(value==0){
		        		return "不达标";
		        	}else{
		        		return "达标";
		        	}
		        }
		       
		    }
			,{
		        field: 'operationDesc',
		        title: '术式',
		        sortable: true,
		        sortName: 'operationDesc',
		        class: 'W300',
		       
		    }
			,{
		        field: 'chiefDoctor',
		        title: '主治医师',
		        sortable: true,
		        sortName: 'chiefDoctor'
		       
		    }
			,{
		        field: 'operator',
		        title: '手术医师',
		        sortable: true,
		        sortName: 'operator'
		       
		    }
			,{
		        field: 'anaesthesiaMethod',
		        title: '麻醉方法',
		        sortable: true,
		        sortName: 'anaesthesiaMethod'
		       
		    }
			,{
		        field: 'operatingDate',
		        title: '手术日期',
		        sortable: true,
		        sortName: 'operatingDate'
		       
		    }
			,{
		        field: 'admissionDateTime',
		        title: '入院日期',
		        sortable: true,
		        sortName: 'admissionDateTime'
		       
		    }
			,{
		        field: 'dischargeDateTime',
		        title: '出院日期',
		        sortable: true,
		        sortName: 'dischargeDateTime'
		       
		    }
			,{
		        field: 'deptCode',
		        title: '住院科室',
		        sortable: true,
		        sortName: 'deptCode'
		       
		    }
			
		     ]
		
		});
		
		  
	  if(navigator.userAgent.match(/(iPhone|iPod|Android|ios)/i)){//如果是移动端

		 
		  $('#preOpePatientIndexRecTable').bootstrapTable("toggleView");
		}
	  
	  $('#preOpePatientIndexRecTable').on('check.bs.table uncheck.bs.table load-success.bs.table ' +
                'check-all.bs.table uncheck-all.bs.table', function () {
            $('#remove').prop('disabled', ! $('#preOpePatientIndexRecTable').bootstrapTable('getSelections').length);
            $('#view,#edit').prop('disabled', $('#preOpePatientIndexRecTable').bootstrapTable('getSelections').length!=1);
        });
		  
		$("#btnImport").click(function(){
			jp.open({
			    type: 2,
                area: [500, 200],
                auto: true,
			    title:"导入数据",
			    content: "${ctx}/tag/importExcel" ,
			    btn: ['下载模板','确定', '关闭'],
				    btn1: function(index, layero){
					 jp.downloadFile('${ctx}/preopedetail/preOpePatientIndexRec/import/template');
				  },
			    btn2: function(index, layero){
				        var iframeWin = layero.find('iframe')[0]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
						iframeWin.contentWindow.importExcel('${ctx}/preopedetail/preOpePatientIndexRec/import', function (data) {
							if(data.success){
								jp.success(data.msg);
								refresh();
							}else{
								jp.error(data.msg);
							}
						   jp.close(index);
						});//调用保存事件
						return false;
				  },
				 
				  btn3: function(index){ 
					  jp.close(index);
	    	       }
			}); 
		});

		
	 $("#export").click(function(){//导出Excel文件
	        var searchParam = $("#searchForm").serializeJSON();
	        searchParam.pageNo = 1;
	        searchParam.pageSize = -1;
            var sortName = $('#preOpePatientIndexRecTable').bootstrapTable("getOptions", "none").sortName;
            var sortOrder = $('#preOpePatientIndexRecTable').bootstrapTable("getOptions", "none").sortOrder;
            var values = "";
            for(var key in searchParam){
                values = values + key + "=" + searchParam[key] + "&";
            }
            if(sortName != undefined && sortOrder != undefined){
                values = values + "orderBy=" + sortName + " "+sortOrder;
            }

			jp.downloadFile('${ctx}/preopedetail/preOpePatientIndexRec/export?'+values);
	  })

		    
	  $("#search").click("click", function() {// 绑定查询按扭
		  $('#preOpePatientIndexRecTable').bootstrapTable('refresh');
		});
	 
	 $("#reset").click("click", function() {// 绑定查询按扭
		/*  $("#searchForm  input").val("");
		  $("#searchForm  select").val("");
		  $("#searchForm  .select-item").html("");
		  $('#preOpePatientIndexRecTable').bootstrapTable('refresh');*/
		});
		
		
	});
		
  function getIdSelections() {
        return $.map($("#preOpePatientIndexRecTable").bootstrapTable('getSelections'), function (row) {
            return row.id
        });
    }
  
  function deleteAll(){

		jp.confirm('确认要删除该术前明细记录吗？', function(){
			jp.loading();  	
			jp.get("${ctx}/preopedetail/preOpePatientIndexRec/deleteAll?ids=" + getIdSelections(), function(data){
         	  		if(data.success){
         	  			$('#preOpePatientIndexRecTable').bootstrapTable('refresh');
         	  			jp.success(data.msg);
         	  		}else{
         	  			jp.error(data.msg);
         	  		}
         	  	})
          	   
		})
  }
  function refresh(){
  	$('#preOpePatientIndexRecTable').bootstrapTable('refresh');
  }
  function add(){
		jp.go("${ctx}/preopedetail/preOpePatientIndexRec/form/add");
	}

  function edit(id){
	  if(id == undefined){
		  id = getIdSelections();
	  }
	  jp.go("${ctx}/preopedetail/preOpePatientIndexRec/form/edit?id=" + id);
  }

  function view(id) {
      if(id == undefined){
          id = getIdSelections();
      }
      jp.go("${ctx}/preopedetail/preOpePatientIndexRec/form/view?id=" + id);
  }
  $("#showAllOrNotQualified").change(function() { 
	  alert("checked"); 
  }); 
</script>