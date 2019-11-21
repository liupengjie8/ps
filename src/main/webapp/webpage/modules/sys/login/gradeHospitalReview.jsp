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
	<div class="title title-color"> <img class="title-img" width="48px" style="margin-top: 8px" src="${ctxStatic}/common/img/301.png" > <span class="title-text"> 中国人民解放军总医院（301医院） </span><span class="title-text1" style="margin-left: 1120px;margin-top:15px"><a href="/ps/a/logout" style="color: white">安全退出</a></span> </div>
		<div class="right_head">
			<div class="nav_list">
				<ul>
					<li id="m1" class="active"><a href="/ps/a/ope">评测概况</a></li>
					<li id="m3"><a  href="/ps/a/manageMission" target="iframe0">评测任务</a></li>
					<li id="m6"><a href="systemControl">系统设置</a></li>
				</ul>


			</div>
			<div class="row" >
		<div class="col-md-12">
			<div class="panel panel-primary">
				<div class="panel-body"  style="height:170px">
					<div class="row" style="float:none">
						<div class="col-md-7">
							<button class="btn btn-primary">切换标准</button>
						应用标准：等级医院标准实施细则（2018通用版）


						</div>
						<div class="col-md-5" >
							最新评估周期：2019/5/4~2019/5/31
						</div>
					</div>
					<div class="row" style="float:none">
						<div class="col-md-3" style="">
							<img class="title-img" width="" style="margin-top: 8px;margin-left;height:100px" src="${ctxStatic}/common/img/jindu.png" >
						</div>
						<div class="col-md-8" style="text-align: center;float: right">
						<div class="col-xs-1-5">
								<div class="col-md-12">
									<h4 class="text-rate num" >442条</h4>
									<h4 class="text-rate">&nbsp;</h4>
									<h3 class="text-rate">标准总量</h3>
								</div>
						</div>
							<div class="col-xs-1-5">
								<div class="col-md-12">
									<h4 class="text-rate num">92%</h4>
									<h4 class="text-rate" style="color: #94D094">+2%</h4>
									<h3 class="text-rate">C级达标率</h3>
								</div>
							</div>
							<div class="col-xs-1-5">
								<div class="col-md-12">
									<h4 class="text-rate num">56%</h4>
									<h4 class="text-rate" style="color: #E89B99">-4%</h4>
									<h3 class="text-rate">B级达标率</h3>
								</div>
							</div>
							<div class="col-xs-1-5">
								<div class="col-md-12">
									<h4 class="text-rate num">18%</h4>
									<h4 class="text-rate" style="color: #E89B99">-7%</h4>
									<h3 class="text-rate">A级达标率</h3>
								</div>
							</div><div class="col-xs-1-5">
							<div class="col-md-12">
								<h4 class="text-rate num">3条</h4>
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
				<div class="panel-heading" >
					<span></span><h4><img height="20" width="10" src="${ctxStatic}/common/img/sekuai.png"/>综合评价</h4></span>
				</div>
				<!--表格内容-->
				<div class="panel-body" style="height:270px">
					<div id="chartDiv" style="height:90%;width: 100%"></div>
				</div>
			</div>
		</div>
		<div class="col-md-12" style="width:70%;">
			<div class="panel panel-primary">
				<div class="panel-heading" >
					<span></span><h4><img height="20" width="10" src="${ctxStatic}/common/img/sekuai.png"/>运营流程</h4></span>
				</div>
				<!--表格内容-->
				<div class="panel-body" style="height:270px">
					<table id="midTable"  cellpadding="20px" cellspacing="20px" style="border-collapse:separate; border-spacing:0px 8px;">
						<tr><td style="font-weight: bold;">业务流程：</td><td class="num">2122个</td></tr>
						<tr></tr>
						<tr><td class="tdTest">未落实到人的流程：</td><td class="num">24个</td><td class="tdTest">没进流程的岗位：</td><td class="num">0个</td><td class="tdTest">形成持续改进的流程：</td><td class="num">24个</td></tr>
						<tr><td class="tdTest">已与HIS打通流程：</td><td class="num">321个</td><td class="tdTest">没有SOP的流程：</td><td class="num">321个</td><td class="tdTest">没有制度的流程：</td><td class="num">24个</td></tr>
						<tr></tr>
						<tr><td class="tdTest" style="font-weight: bold;">持续改进：</td><td class="num">232次</td></tr>
						<tr></tr>
						<tr></tr>
						<tr><td class="tdTest">医院功能与任务：</td><td class="num">24个</td><td class="tdTest"> 医疗质量安全持续改进：</td><td class="num">24个</td><td class="tdTest">患者安全：</td><td class="num">24个</td></tr>
						<tr><td class="tdTest">医院服务：</td><td class="num">24个</td><td class="tdTest">护理管理质量持续改进：</td><td class="num">24个</td><td class="tdTest">医院管理：</td><td class="num">24个</td></tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<%--//下方div--%>
	<div class="row" >
		<div class="col-md-12" style="width:70%;">
			<div class="panel panel-primary">
				<div class="panel-heading" >
					<span></span><h4><img height="20" width="10" src="${ctxStatic}/common/img/sekuai.png"/>流程运营异常预警</h4></span>
				</div>
				<!--表格内容-->
				<div class="panel-body" style="height:200px">
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
				<div class="panel-heading" >
					<span></span><h4><img height="20" width="10" src="${ctxStatic}/common/img/sekuai.png"/>异常指标预警</h4></span>
				</div>
				<!--表格内容-->
				<div class="panel-body" style="height:200px">
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
			align: 'left',
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
