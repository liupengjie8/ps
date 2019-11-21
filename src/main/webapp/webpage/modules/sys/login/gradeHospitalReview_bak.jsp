<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>医疗质量安全标准运行监测系统</title>
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<link rel="stylesheet" type="text/css" href="${ctxStatic}/common/css/app-gradereview.css"/>
<link rel="stylesheet" href="${ctxStatic}/common/css/skill-bar/an-skill-bar.css">
<link rel="stylesheet" href="${ctxStatic}/common/css/skill-bar/main.css">
<script src="${ctxStatic}/common/js/jquery-1.7.2.min.js"></script>
	<script src="${ctxStatic}/common/js/skill-bar/an-skill-bar.js"></script>
	<script src="${ctxStatic}/common/js/skill-bar/main.js"></script>
	<script src="${ctxStatic}/plugin/highcharts/highcharts.js"></script>
	<script src="${ctxStatic}/plugin/highcharts/highcharts-more.js"></script>

</head>
<body style="font-weight:normal;font-size: x-small">
<div class="wrap">
	<%--//上方div--%>
	<div><h2 style="display:inline-block">&nbsp;&nbsp;&nbsp;&nbsp;中国人民解放军总医院（301医院）</h2><span style="float: right;margin-top: 23px;margin-right: 20px"><h4 ><a href="/ps/a/logout">安全退出</a></h4></span></div>
	<div class="row" >
		<div class="col-md-12">
			<div class="panel panel-primary">
				<div class="panel-body"  style="height:170px">
					<div class="row" style="float:none">
						<div class="col-md-9">
						应用标准：等级医院标准实施细则（2018通用版）
							<button class="btn btn-primary">切换标准</button>

						</div>
						<div class="col-md-3" style="float:right">
							最新评估周期：2019/5/4~2019/5/31
						</div>
					</div>
					<div class="row" style="float:none">
						<div class="col-md-3" style="">
							<div class="form-group">
								<div class="col-md-12" >
									<h4 class="text-rate" style="text-align: center">三级甲等-C级</h4>
									D不合格 &nbsp;&nbsp;&nbsp;&nbsp;C合格&nbsp;&nbsp;&nbsp; B良好&nbsp;&nbsp;&nbsp; A优秀
									<div id="skill">
										<div class="skillbar css">
											<div class="filled" data-width="30%"></div>
										</div>
									</div>
								</div>

							</div>
						</div>
						<div class="col-md-8" style="text-align: center;float: right">
						<div class="col-xs-1-5">
								<div class="col-md-12">
									<h4 class="text-rate">442条</h4>
									<h4 class="text-rate">&nbsp;</h4>
									<h3 class="text-rate">标准总量</h3>
								</div>
						</div>
							<div class="col-xs-1-5">
								<div class="col-md-12">
									<h4 class="text-rate">92%</h4>
									<h4 class="text-rate" style="color: #428003">+2%</h4>
									<h3 class="text-rate">C级达标率</h3>
								</div>
							</div>
							<div class="col-xs-1-5">
								<div class="col-md-12">
									<h4 class="text-rate">56%</h4>
									<h4 class="text-rate" style="color: red">-4%</h4>
									<h3 class="text-rate">B级达标率</h3>
								</div>
							</div>
							<div class="col-xs-1-5">
								<div class="col-md-12">
									<h4 class="text-rate">18%</h4>
									<h4 class="text-rate" style="color: red">-7%</h4>
									<h3 class="text-rate">A级达标率</h3>
								</div>
							</div><div class="col-xs-1-5">
							<div class="col-md-12">
								<h4 class="text-rate">3条</h4>
								<h4 class="text-rate">&nbsp;</h4>
								<h3 class="text-rate">不适用条款</h3>
							</div>
						</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%--//中间div--%>
	<div class="row">
		<div class="col-md-12" style="width:30%;">
			<div class="panel panel-primary">
				<!--表格内容-->
				<div class="panel-body" style="height:270px">
					<span></span><h4><img height="20" width="10" src="${ctxStatic}/common/img/sekuai.png"/>综合评价</h4></span>
					<div id="chartDiv" style="height:90%;width: 100%"></div>
				</div>
			</div>
		</div>
		<div class="col-md-12" style="width:70%;">
			<div class="panel panel-primary">
				<!--表格内容-->
				<div class="panel-body" style="height:270px">
					<span><h4><img height="20" width="10" src="${ctxStatic}/common/img/sekuai.png"/>运营流程</h4></span>
					<table id="midTable"  cellpadding="20px" cellspacing="20px" style="border-collapse:separate; border-spacing:0px 8px;">
						<tr><td>业务流程：</td><td>2122个</td></tr>
						<tr></tr>
						<tr><td class="tdTest">未落实到人的流程：</td><td>24个</td><td class="tdTest">没进流程的岗位：</td><td>0个</td><td class="tdTest">形成持续改进的流程：</td><td>24个</td></tr>
						<tr><td class="tdTest">已与HIS打通流程：</td><td>321个</td><td class="tdTest">没有SOP的流程：</td><td>321个</td><td class="tdTest">没有制度的流程：</td><td>24个</td></tr>
						<tr></tr>
						<tr><td class="tdTest">持续改进：</td><td>232次</td></tr>
						<tr></tr>
						<tr></tr>
						<tr><td class="tdTest">医院功能与任务：</td><td>24个</td><td class="tdTest"> 医疗质量安全持续改进：</td><td>24个</td><td class="tdTest">患者安全：</td><td>24个</td></tr>
						<tr><td class="tdTest">医院服务：</td><td>24个</td><td class="tdTest">护理管理质量持续改进：</td><td>24个</td><td class="tdTest">医院管理：</td><td>24个</td></tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<%--//下方div--%>
	<div class="row" >
		<div class="col-md-12" style="width:70%;">
			<div class="panel panel-primary">
				<!--表格内容-->
				<div class="panel-body" style="height:200px">
					<span><h4><img height="20" width="10" src="${ctxStatic}/common/img/sekuai.png"/>流程运营异常预警</h4></span>
					<table id="midTable"  cellpadding="20px" cellspacing="20px" style="border-collapse:separate; border-spacing:0px 8px;">
						<tr><td class="tdShort">1</td><td class="tdLong">管理体系-急诊服务流程-办理入院手续办理效率较低，2小时/患者，低于地区标准水平</td><td><a>查看</a></td></tr>
						<tr><td class="tdShort">2</td><td class="tdLong">管理体系-急诊服务流程-办理入院手续办理效率较低，2小时/患者，低于地区标准水平</td><td><a>查看</a></td></tr>
						<tr><td class="tdShort">2</td><td class="tdLong">管理体系-急诊服务流程-办理入院手续办理效率较低，2小时/患者，低于地区标准水平</td><td><a>查看</a></td></tr>
					</table>
				</div>
			</div>
		</div>
		<div class="col-md-12" style="width:30%;">
			<div class="panel panel-primary">
				<!--表格内容-->
				<div class="panel-body" style="height:200px">
					<span><h4><img height="20" width="10" src="${ctxStatic}/common/img/sekuai.png"/>异常指标预警</h4></span>
					<table id="midTable"  cellpadding="20px" cellspacing="20px" style="border-collapse:separate; border-spacing:0px 8px;">
						<tr><td class="tdLong">住院患者当天出院再住院率 高于3%</td><td><a>查看</a></td></tr>
						<tr><td class="tdLong">住院患者当天出院再住院率 高于3%</td><td><a>查看</a></td></tr>
						<tr><td class="tdLong">住院患者当天出院再住院率 高于3%</td><td><a>查看</a></td></tr>
					</table>
				</div>
			</div>
		</div>

	</div>
</div>
</body>
<script>


$(function(){
	var chart = Highcharts.chart('chartDiv', {
		chart: {
			polar: true,
			type: 'area'
		},
		pane: {
			size: '85%'
		},
		title: {
			text: '',
			x: -80
		},
		credits: {
			enabled: false     //不显示LOGO
		},
		xAxis: {
			categories: ['工作效率', '工作负荷', '资产运营', '质量管理','DRGs评价'],
			tickmarkPlacement: 'on',
			lineWidth: 0
		},
		yAxis: {
			gridLineInterpolation: 'polygon',
			max:100,
			min:0,
			lineWidth:0,

		},
		tooltip: {
			shared: true,
		},
		legend: {
			align: 'right',
		},
		series: [{
			name: '本院水平',
			color: '#BFE7A8',
			data: [40, 40, 100, 80, 80,],
			pointPlacement: 'on'
		}, {
			name: '区域平均水平',
			color: '#B0D2F4',
			data: [100, 80, 100, 60, 80,],
			pointPlacement: 'on'
		}]
	});





		$('#ope').click(function() {
			window.location.href="/ps/a/ope";
		});
		//判断手术服务是否是不合格
		$.ajax({
		    type: "post",
		    url: "/ps/a/getModulesIsQuilified",
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
});
function logOut(){

}
</script>
</html>
