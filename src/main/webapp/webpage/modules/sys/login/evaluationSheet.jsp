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

	<style>
		body{
			margin: 10px;
		}
		.main {
			font-size: 12px;
		}

		.title {
			text-align:center;
			font-size: 26px;
			margin-bottom: 80px
		}
		.input_text {
			font-size: 20px;
			margin-bottom: 20px;
		}
		table {
			width: 100%;
			border-right: 1px solid ;
			border-bottom: 1px solid ;
			border-collapse:collapse;
		}
		.text_content {
			font-size: 12px;
		}
		table tr {
			height: 100px;
			border-top: 1px solid ;
		}
		table tr td {
			height: 100px;
			width: 16%;
			border-left: 1px solid ;
			border-top: 1px solid ;
		}
		table tr:first-child td {
			height: 100px;
			width: 16%;
			border-left: 1px solid ;
			border-top: 1px solid ;
			text-align: center;
		}
		/*padding-left: 10px;border-left: 1px solid ;border-top: 1px solid ;width: 16%;*/
	</style>
<body >
<div>
	<div class="main" STYLE="margin-top: 150px">
		<h2 class="title">剖宫产后阴道分娩风险评估表</h2>
		<table>
			<tr>
				<td><img src="${ctxStatic}/common/img/2.png" style="height: 100px;width: 100%"></td >
				<td>低危(具备较好试产条件)</td>
				<td>中危(中度风险、慎重考虑)</td>
				<td>高危(高风险、禁忌症、不建议)</td>
			</tr>
			<tr>
				<td>孕妇及家属阴道分娩意愿</td >
				<td>
					<input type="checkbox" name="1"/>
					<label name="1">较强试产愿望,愿共同承担阴道分娩风险,医疗配合度良好,充分理解接受试产失败、紧无试产愿望、不接受试产失败、紧急剖宫产、母婴不良结局等风险</label>
				</td>
				<td>
					<input type="checkbox" name="1"/>
					<label name="1">有试产愿望,但比较担心阴道分娩风险,尚可接受试产失败、紧急剖宫产、母婴不良结局等风险</label>
				</td>
				<td>
					<input type="checkbox" name="1"/>
					<label name="1">无试产愿望、不接受试产失败、紧急剖宫产、母婴不良结局等风险</label>
				</td>
			</tr>
			<tr>
				<td>既往剖宫产切口类型</td >
				<td>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">子宫下段横切口,切口无延裂,如期恢复,无晚期产后出血,产后感染</label>
					</div>
					<div>
						<input type="checkbox" name="2"/>
						<label name="2">有临产、试产史</label>
					</div>
				</td>
				<td>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">子宫瘢痕类型不明</label>
					</div>
					<div>
						<input type="checkbox" name="2"/>
						<label name="2">单纯巨大儿、孕龄超过40周</label>
					</div>
					<div>
						<input type="checkbox" name="2"/>
						<label name="2">子宫下段直切口或横切口延裂</label>
					</div>
					<div>
						<input type="checkbox" name="2"/>
						<label name="2">因子宫畸形行剖宫产,未行畸形矫正</label>
					</div>
				</td>
				<td>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">古典式剖宫产术</label>
					</div>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">子宫下段纵切口或T型切口</label>
					</div>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">子宫切口愈合不良,子宫切口憩室,晚期产后出血、产后感染</label>
					</div>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">因子宫先兆破裂、子宫破裂剖宫产</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>剖宫产次数、其他手术史</td >
				<td>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">1次剖宫产史</label>
					</div>
					<div>
						<input type="checkbox" name="2"/>
						<label name="2">无再次子宫损伤史,如子宫穿孔、子宫肌瘤剔除、子宫破裂</label>
					</div>
				</td>
				<td>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">有再次子宫损伤史,如肌壁间子宫肌瘤剔除术史、宫腔粘连分离术史</label>
					</div>
				</td>
				<td>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">2次或2次以上剖宫产史</label>
					</div>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">穿透宫腔的子宫肌瘤剔除术、子宫穿孔史</label>
					</div>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">宫角妊娠行宫角切除</label>
					</div>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">子宫畸形矫正穿透宫腔</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>B超评估子宫前壁下段切口情况（建议孕36周即开始检查</td >
				<td>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">子宫前壁下段各回声连续、均匀</label>
					</div>
					<div>
						<input type="checkbox" name="2"/>
						<label name="2">子宫前壁下段厚度≥3mm</label>
					</div>
				</td>
				<td>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">子宫前壁下段各回声连续、均匀，但前壁下段厚度≤2mm </label>
					</div>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">子宫前壁下段厚度≥3mm</label>
					</div>
				</td>
				<td>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">子宫前壁下段回声失去连续性、追踪扫描见局部肌层缺失，加压时羊膜囊无膨出</label>
					</div>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">子宫前壁下段回声失去连续性、追踪扫描见局部肌层缺失，加压时羊膜囊无膨出</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>B超检查胎盘与瘢痕关系情况</td >
				<td>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">胎盘未附着切口瘢痕处</label>
					</div>
				</td>
				<td></td>
				<td>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">胎盘附着切口瘢痕处</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>胎儿情况、胎位、宫口扩张情况</td >
				<td>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">头位、无头盆不称</label>
					</div>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">胎儿质量<4000g</label>
					</div>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">宫口容受75-90%,宫口已扩张,胎先露低</label>
					</div>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">妊娠不满39周自然临产</label>
					</div>
				</td>
				<td>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">双胎妊娠</label>
					</div>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">胎儿质量可疑≥4000g</label>
					</div>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">胎先露高浮,可疑头盆不称</label>
					</div>
				</td>
				<td>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">臀位、斜位、横位等</label>
					</div>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">多胎妊娠</label>
					</div>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">胎儿质量≥4000g</label>
					</div>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">头盆不称</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>剖宫产指征</td >
				<td>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">无前次剖宫产指征,无本次分娩新剖宫产指征</label>
					</div>
				</td>
				<td>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">无前次剖宫产指征,但因各种母儿合并症、高危因素宜剖宫产分娩</label>
					</div>
				</td>
				<td>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">仍存在前次剖宫产指征</label>
					</div>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">存在本次分娩新剖宫产指征</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>分娩间隔时间</td >
				<td>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">本次分娩距前次剖宫产≥18个月</label>
					</div>
				</td>
				<td>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">本次分娩距前次剖宫产<18个月</label>
					</div>
				</td>
				<td>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">本次分娩距前次剖宫产<12个月</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>孕妇情况</td >
				<td>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">有阴道分娩史,包括前次剖宫产术前或术后的剖宫产史</label>
					</div>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">体重指数<30kg/m2</label>
					</div>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">年龄<35岁</label>
					</div>
				</td>
				<td>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">体重指数≥30kg/m2 年龄≥35岁</label>
					</div>
				</td>
				<td>
					<div>
						<input type="checkbox" name="1"/>
						<label name="1">不适宜阴道分娩的内外科合并症或产科并发症</label>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: center">(注:本表参照中华医学会妇产科学分会产科学组2016年剖宫产术后再次妊娠阴道分娩管)</td>
			</tr>
		</table>
	</div>
	<div style="text-align: center"><button class="btn btn-primary" onclick="submitEvalutionSheet()">提交评估表</button></div>

</div>
</body>
<script>
	function submitEvalutionSheet(){
		alert("提交成功！")
		window.location.href="/ps/a/evaluationSheet";
	}

</script>
</html>
