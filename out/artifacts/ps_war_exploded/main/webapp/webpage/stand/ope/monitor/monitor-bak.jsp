<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html >
	<head>
	<title>指标管理</title>
	<meta name="decorator" content="ani">
	<script type="text/javascript">

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
	</script>
	</head>
	<body>
<!--  头部菜单	-->
<!-- 
<div class="right_head">
		 菜单 end	
	<div class="title_box ">
		<h2  > 手术服务标准运行监测预警</h2>
		<div class="ico_list">
			<ul>
				<li class="ico" onclick="window.location.href='/ps/a/flowchart/flowChart/flowChart'"></li>
				<li class="ico1" onclick="window.location.href='/ps/a/indexForm/indexForm/indexForm'"></li>
				<li class="ico2" onclick="window.location.href='/ps/a/indexForm/indexForm/indexForm'"></li>
				<li class="ico3"></li>
				<li class="ico4"></li>
			</ul>
		</div>
	</div>
</div> -->
<!--  主体内容	-->
	<div class="wrapper wrapper-content"> 
		<!-- 栏目1	-->
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary"> 
					
					<!-- 标题end	--> 
					<!--表格内容-->
					<div class="panel-body">
						<div class="row m-b20 ">
							<div class="bars pull-right">
								<div id="toolbar">
								    <button id="add" class="btn btn-primary" onclick="add()"> <i class="glyphicon glyphicon-plus"></i> 自定义筛选条件 </button>
									<button id="search" class="btn btn-primary" onclick="search()"> <i class="glyphicon glyphicon-search"></i> 查询 </button>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-1-5">
								<div class="form-group">
									<div class="row">
										<div class="col-md-12 update-align-items "> 开始时间</div>
										<div class="col-md-12">
											<input  class="form-control " type="text" value="">
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-1-5">
								<div class="form-group">
									<div class="row">
										<div class="col-md-12  update-align-items "> 结束时间</div>
										<div class="col-md-12">
											<input  class="form-control " type="text" value="">
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-1-5">
								<div class="form-group">
									<div class="row">
										<div class="col-md-12  update-align-items "> 科室 </div>
										<div class="col-md-12">
											<input  class="form-control " type="text" value="">
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-1-5">
								<div class="form-group">
									<div class="row">
										<div class="col-md-12  update-align-items "> 诊断</div>
										<div class="col-md-12">
											<input  class="form-control " type="text" value="">
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-1-5">
								<div class="form-group">
									<div class="row">
										<div class="col-md-12  update-align-items "> 术式 </div>
										<div class="col-md-12">
											<input  class="form-control " type="text" value="">
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-1-5">
								<div class="form-group">
									<div class="row">
										<div class="col-md-12  update-align-items "> 术者</div>
										<div class="col-md-12">
											<input  class="form-control " type="text" value="">
										</div>
									</div>
								</div>
							</div>
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
					</div>
					<!-- 标题end	--> 
					<!--表格内容-->
					<div class="panel-body">
						<div class="row">
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<div class="row">
										<div class=" update-align-items "> 手术评估 </div>
										<c:forEach var="sspg" items="${sspgData }" varStatus="objstatus">
										<div  class="form-group flex">
											<input  class="form-control " type="text" value="${sspg.node }">
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
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<div class="row">
										<div class=" update-align-items "> 手术安排 </div>
										<c:forEach var="ssap" items="${ssapData }" varStatus="objstatus">
										<div  class="form-group flex">
											<input  class="form-control " type="text" value="${ssap.node }">
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
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<div class="row">
										<div class=" update-align-items "> 术前准备 </div>
										<c:forEach var="sqzb" items="${sqzbData }" varStatus="objstatus">
										<div  class="form-group flex">
											<input  class="form-control " type="text" value="${sqzb.node }">
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
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	   <%--  <!-- 栏目2	-->
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary"> 
					<!-- 标题	-->
					<div class="panel-heading">
						<h3 class="panel-title">术中 </h3>
					</div>
					<!-- 标题end	--> 
					<!--表格内容-->
					<div class="panel-body">
						<div class="row">
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<div class="row">
										<div class=" update-align-items "> 手术评估 </div>
										<div  class="form-group flex">
											<input  class="form-control " type="text" value="适应症评估">
											<div class="form-group-ico"><img src="${ctxStatic}/common/img/monitor/Tips-green.png" /></div>
										</div>
										<div  class="form-group flex">
											<input  class="form-control " type="text" value="等级评估">
											<div class="form-group-ico"> <img src="${ctxStatic}/common/img/monitor/Tips-red.png" />
												<ul class="elastic_list">
													<li>
														<label><img src="${ctxStatic}/common/img/monitor/Tips-red.png" /></label>
														术前适应证评估完成 1/99</li>
													<li>
														<label><img src="${ctxStatic}/common/img/monitor/Tips-red.png" /></label>
														术前适应证评估完成 1/99</li>
													<li>
														<label><img src="${ctxStatic}/common/img/monitor/Tips-green.png" /></label>
														术前适应证评估完成 1/99</li>
												</ul>
											</div>
										</div>
										<div  class="form-group flex">
											<input  class="form-control " type="text" value="风险评估">
											<div class="form-group-ico"><img src="${ctxStatic}/common/img/monitor/Tips-green.png" /></div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<div class="row">
										<div class=" update-align-items "> 手术安排 </div>
										<div  class="form-group flex">
											<input  class="form-control " type="text" value="适应症评估">
											<div class="form-group-ico"><img src="${ctxStatic}/common/img/monitor/Tips-green.png" /></div>
										</div>
										<div  class="form-group flex">
											<input  class="form-control " type="text" value="等级评估">
											<div class="form-group-ico"> <img src="${ctxStatic}/common/img/monitor/Tips-red.png" />
												<ul class="elastic_list">
													<li>
														<label><img src="${ctxStatic}/common/img/monitor/Tips-red.png" /></label>
														术前适应证评估完成 1/99</li>
													<li>
														<label><img src="${ctxStatic}/common/img/monitor/Tips-red.png" /></label>
														术前适应证评估完成 1/99</li>
													<li>
														<label><img src="${ctxStatic}/common/img/monitor/Tips-green.png" /></label>
														术前适应证评估完成 1/99</li>
												</ul>
											</div>
										</div>
										<div  class="form-group flex">
											<input  class="form-control " type="text" value="风险评估">
											<div class="form-group-ico"><img src="${ctxStatic}/common/img/monitor/Tips-green.png" /></div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<div class="row">
										<div class=" update-align-items "> 手术评估 </div>
										<div  class="form-group flex">
											<input  class="form-control " type="text" value="适应症评估">
											<div class="form-group-ico"><img src="${ctxStatic}/common/img/monitor/Tips-green.png" /></div>
										</div>
										<div  class="form-group flex">
											<input  class="form-control " type="text" value="等级评估">
											<div class="form-group-ico"> <img src="${ctxStatic}/common/img/monitor/Tips-red.png" />
												<ul class="elastic_list">
													<li>
														<label><img src="${ctxStatic}/common/img/monitor/Tips-red.png" /></label>
														术前适应证评估完成 1/99</li>
													<li>
														<label><img src="${ctxStatic}/common/img/monitor/Tips-red.png" /></label>
														术前适应证评估完成 1/99</li>
													<li>
														<label><img src="${ctxStatic}/common/img/monitor/Tips-green.png" /></label>
														术前适应证评估完成 1/99</li>
												</ul>
											</div>
										</div>
										<div  class="form-group flex">
											<input  class="form-control " type="text" value="风险评估">
											<div class="form-group-ico"><img src="${ctxStatic}/common/img/monitor/Tips-green.png" /></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div> --%>
			<!-- 栏目2	-->
		<%-- <div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary"> 
					<!-- 标题	-->
					<div class="panel-heading">
						<h3 class="panel-title">术后 </h3>
					</div>
					<!-- 标题end	--> 
					<!--表格内容-->
					<div class="panel-body">
						<div class="row">
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<div class="row">
										<div class=" update-align-items "> 手术评估 </div>
										<div  class="form-group flex">
											<input  class="form-control " type="text" value="适应症评估">
											<div class="form-group-ico"><img src="${ctxStatic}/common/img/monitor/Tips-green.png" /></div>
										</div>
										<div  class="form-group flex">
											<input  class="form-control " type="text" value="等级评估">
											<div class="form-group-ico"> <img src="${ctxStatic}/common/img/monitor/Tips-red.png" />
												<ul class="elastic_list">
													<li>
														<label><img src="${ctxStatic}/common/img/monitor/Tips-red.png" /></label>
														术前适应证评估完成 1/99</li>
													<li>
														<label><img src="${ctxStatic}/common/img/monitor/Tips-red.png" /></label>
														术前适应证评估完成 1/99</li>
													<li>
														<label><img src="${ctxStatic}/common/img/monitor/Tips-green.png" /></label>
														术前适应证评估完成 1/99</li>
												</ul>
											</div>
										</div>
										<div  class="form-group flex">
											<input  class="form-control " type="text" value="风险评估">
											<div class="form-group-ico"><img src="${ctxStatic}/common/img/monitor/Tips-green.png" /></div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<div class="row">
										<div class=" update-align-items "> 手术安排 </div>
										<div  class="form-group flex">
											<input  class="form-control " type="text" value="适应症评估">
											<div class="form-group-ico"><img src="${ctxStatic}/common/img/monitor/Tips-green.png" /></div>
										</div>
										<div  class="form-group flex">
											<input  class="form-control " type="text" value="等级评估">
											<div class="form-group-ico"> <img src="${ctxStatic}/common/img/monitor/Tips-red.png" />
												<ul class="elastic_list">
													<li>
														<label><img src="${ctxStatic}/common/img/monitor/Tips-red.png" /></label>
														术前适应证评估完成 1/99</li>
													<li>
														<label><img src="${ctxStatic}/common/img/monitor/Tips-red.png" /></label>
														术前适应证评估完成 1/99</li>
													<li>
														<label><img src="${ctxStatic}/common/img/monitor/Tips-green.png" /></label>
														术前适应证评估完成 1/99</li>
												</ul>
											</div>
										</div>
										<div  class="form-group flex">
											<input  class="form-control " type="text" value="风险评估">
											<div class="form-group-ico"><img src="${ctxStatic}/common/img/monitor/Tips-green.png" /></div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<div class="row">
										<div class=" update-align-items "> 手术评估 </div>
										<div  class="form-group flex">
											<input  class="form-control " type="text" value="适应症评估">
											<div class="form-group-ico"><img src="${ctxStatic}/common/img/monitor/Tips-green.png" /></div>
										</div>
										<div  class="form-group flex">
											<input  class="form-control " type="text" value="等级评估">
											<div class="form-group-ico"> <img src="${ctxStatic}/common/img/monitor/Tips-red.png" />
												<ul class="elastic_list">
													<li>
														<label><img src="${ctxStatic}/common/img/monitor/Tips-red.png" /></label>
														术前适应证评估完成 1/99</li>
													<li>
														<label><img src="${ctxStatic}/common/img/monitor/Tips-red.png" /></label>
														术前适应证评估完成 1/99</li>
													<li>
														<label><img src="${ctxStatic}/common/img/monitor/Tips-green.png" /></label>
														术前适应证评估完成 1/99</li>
												</ul>
											</div>
										</div>
										<div  class="form-group flex">
											<input  class="form-control " type="text" value="风险评估">
											<div class="form-group-ico"><img src="${ctxStatic}/common/img/monitor/Tips-green.png" /></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div> --%>
	</div>
</body>
</html>