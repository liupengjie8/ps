<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>医疗质量安全标准运行监测系统</title>
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<link rel="stylesheet" type="text/css" href="${ctxStatic}/common/css/modules/reset.css"/>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/common/css/modules/common.css"/>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/common/css/modules/color.css"/>
<script src="${ctxStatic}/common/js/jquery-1.7.2.min.js"></script>
</head>
<body>
<div class="wrap">
	<div class="title title-color"> <img class="title-img" src="${ctxStatic}/common/img/modules/title_icon.svg" > <span class="title-text"> 医疗质量安全标准运行监测系统 </span> </div>
	<div class="main">
		<div class="box box_bg">
			<h2 class="box-text">门急诊服务</h2>
			<div class="box-main">
				<div class="box-main-box">
					<div class="box-main-box-mid"><p class="drop-down-btn-noarrow">急诊服务</p></div>
					<p class="box-main-box-right"> <img class="box-main-box-right-img" src="${ctxStatic}/common/img/modules/Tips-green.png" > </p>
				</div>
				<div class="box-main-box">
					<div class="box-main-box-mid"><p class="drop-down-btn-noarrow ">绿色通道</p></div>
					<p class="box-main-box-right"> <img class="box-main-box-right-img" src="${ctxStatic}/common/img/modules/Tips-green.png" > </p>
				</div>
				<div class="box-main-box">
					<div class="box-main-box-mid"><p class="drop-down-btn-noarrow ">预约服务</p></div>
					<p class="box-main-box-right"> <img class="box-main-box-right-img" src="${ctxStatic}/common/img/modules/Tips-green.png" > </p>
				</div>
				<div class="box-main-box">
					<div class="box-main-box-mid">
						<p class="drop-down-btn active" onmouseover="showDropDownList('mzfw')" onclick="hiddenDropDownList('mzfw')">门诊服务</p>
						<div class="drop-down-list" id="mzfw" style="display:none;" >
							<ul class="drop-down-list-ul">
								<li>
									<div class="drop-down-list-li-selection " > 门诊服务</div>
									<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
								</li>	
								<li>
									<div class="drop-down-list-li" >  门诊处方 </div>
									<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" >
								</li>
								<li>
									<div class="drop-down-list-li " >  多学科联合会诊 </div>
									<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
								</li>
							</ul>
						</div>
					</div>
					<p class="box-main-box-right"> <img class="box-main-box-right-img" src="${ctxStatic}/common/img/modules/Tips-green.png" > </p>
				</div>
				<div class="box-main-box">
					<div class="box-main-box-mid">
						<p class="drop-down-btn active" onmouseover="showDropDownList('jkbz')" onclick="hiddenDropDownList('jkbz')">健康保障</p>
						<div class="drop-down-list" style="display:none;" id='jkbz'>
							<ul class="drop-down-list-ul">
								<li>
									<div class="drop-down-list-li-selection " > 健康保障</div>
									<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
								</li>
								<li>
									<div class="drop-down-list-li" > 健康体检</div>
									<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
								</li>
								<li>
									<div class="drop-down-list-li" >  儿童保健 </div>
									<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" >
								</li>
								<li>
									<div class="drop-down-list-li" >  孕产妇保健 </div>
									<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
								</li>
							</ul>
						</div>
					</div>
					<p class="box-main-box-right"> <img class="box-main-box-right-img" src="${ctxStatic}/common/img/modules/Tips-green.png" > </p>
				</div>
			</div>
		</div>
		<div class="box box_bg1 ">
			<h2 class="box-text">住院服务</h2>
			<div class="box-main">
				<div class="box-main-box">
					<div class="box-main-box-mid">
						<p class="drop-down-btn active"  onmouseover="showDropDownList('zyfw')" onclick="hiddenDropDownList('zyfw')">住院服务</p>
						<div class="drop-down-list" style="display:none;" id='zyfw'>
							<ul class="drop-down-list-ul">
								<li>
									<div class="drop-down-list-li-selection " > 住院服务 </div>
									<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
								<li>
									<div class="drop-down-list-li " >  VTE防治 </div>
									<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" >
								</li>
								<li>
									<div class="drop-down-list-li " >  临床营养 </div>
									<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
								</li>
								<li>
									<div class="drop-down-list-li" >  临床用血 </div>
									<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
								</li>
								<li>
									<div class="drop-down-list-li " >  随访服务 </div>
									<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
								</li>
							</ul>
						</div>
					</div>
					<p class="box-main-box-right"> <img class="box-main-box-right-img" src="${ctxStatic}/common/img/modules/Tips-green.png" > </p>
				</div>
				<div class="box-main-box">
					<div class="box-main-box-mid"><p class="drop-down-btn-noarrow ">临床用药</p></div>
					<p class="box-main-box-right"> <img class="box-main-box-right-img" src="${ctxStatic}/common/img/modules/Tips-green.png" > </p>
				</div>
				<div class="box-main-box">
					<div class="box-main-box-mid"><p class="drop-down-btn-noarrow ">重症监护</p></div>
					<p class="box-main-box-right"> <img class="box-main-box-right-img" src="${ctxStatic}/common/img/modules/Tips-green.png" > </p>
				</div>
				<div class="box-main-box">
					<div class="box-main-box-mid">
						<p class="drop-down-btn active" onmouseover="showDropDownList('lcjc')" onclick="hiddenDropDownList('lcjc')">临床检查</p>
						<div class="drop-down-list" style="display:none;" id='lcjc'>
							<ul class="drop-down-list-ul">
								<li>
									<div class="drop-down-list-li-selection " > 临床检查</div>
									<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
								</li>	
								<li>
									<div class="drop-down-list-li" > 临床检验</div>
									<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
								</li>	
								<li>
									<div class="drop-down-list-li " >  临床病理 </div>
									<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" >
								</li>
								<li>
									<div class="drop-down-list-li " >  医学影像 </div>
									<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
								</li>
							</ul>
						</div>
					</div>
					
					
					
					<p class="box-main-box-right"> <img class="box-main-box-right-img" src="${ctxStatic}/common/img/modules/Tips-green.png" > </p>
				</div>
				<div class="box-main-box">
					<div class="box-main-box-mid">
						<p class="drop-down-btn active" onmouseover="showDropDownList('lczl')" onclick="hiddenDropDownList('lczl')">临床治疗</p>
						<div class="drop-down-list" style="display:none;" id='lczl'>
							<ul class="drop-down-list-ul">
								<li>
									<div class="drop-down-list-li-selection " > 临床治疗</div>
									<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
								</li>	
								<li>
									<div class="drop-down-list-li" > 放射治疗</div>
									<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
								</li>	
								<li>
									<div class="drop-down-list-li " >  血液净化 </div>
									<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" >
								</li>
								<li>
									<div class="drop-down-list-li " >  高压氧治疗 </div>
									<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
								</li>
								<li>
									<div class="drop-down-list-li" >  中医诊疗 </div>
									<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
								</li>
								<li>
									<div class="drop-down-list-li " >  康复治疗 </div>
									<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
								</li>
							</ul>
						</div>
					</div>
					<p class="box-main-box-right"> <img class="box-main-box-right-img" src="${ctxStatic}/common/img/modules/Tips-green.png" > </p>
				</div>
			</div>
		</div>
		<div class="box box_bg2">
			<h2 class="box-text">手术服务</h2>
			<div class="box-main">
				<div class="box-main-box">
					<div class="box-main-box-mid"><p class="drop-down-btn-noarrow " id="ope">手术服务</p></div>
					<p class="box-main-box-right"> <img class="box-main-box-right-img" src="${ctxStatic}/common/img/modules/Tips-green.png" id="opeQulified"> </p>
				</div>
				<div class="box-main-box">
					<div class="box-main-box-mid">
							<p class="drop-down-btn active" onmouseover="showDropDownList('mazfw')" onclick="hiddenDropDownList('mazfw')">麻醉服务</p>
							<div class="drop-down-list" style="display:none;" id='mazfw'>
								<ul class="drop-down-list-ul">
									<li>
										<div class="drop-down-list-li-selection " >麻醉镇痛</div>
										<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
									<li>
										<div class="drop-down-list-li" >  疼痛治疗 </div>
										<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" >
									</li>
								</ul>
							</div>
					</div>	
					<p class="box-main-box-right"> <img class="box-main-box-right-img" src="${ctxStatic}/common/img/modules/Tips-green.png" > </p>
				</div>
				<div class="box-main-box">
					<div class="box-main-box-mid">
							<p class="drop-down-btn active" onmouseover="showDropDownList('wccz')" onclick="hiddenDropDownList('wccz')">微创操作</p>
							<div class="drop-down-list" style="display:none;" id='wccz'>
								<ul class="drop-down-list-ul">
									<li>
										<div class="drop-down-list-li-selection " >微创操作</div>
										<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
									</li>
									<li>
										<div class="drop-down-list-li " >介入治疗</div>
										<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
									</li>	
									<li>
										<div class="drop-down-list-li " > 内镜治疗 </div>
										<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" >
									</li>
								</ul>
							</div>
					</div>	
					<p class="box-main-box-right"> <img class="box-main-box-right-img" src="${ctxStatic}/common/img/modules/Tips-green.png" > </p>
				</div>
				<div class="box-main-box">
					<div class="box-main-box-mid"><p class="drop-down-btn-noarrow ">日间手术</p></div>
					<p class="box-main-box-right"> <img class="box-main-box-right-img" src="${ctxStatic}/common/img/modules/Tips-green.png" > </p>
				</div>
				<div class="box-main-box">
					<div class="box-main-box-mid"><p class="drop-down-btn-noarrow ">器官移植</p></div>
					<p class="box-main-box-right"> <img class="box-main-box-right-img" src="${ctxStatic}/common/img/modules/Tips-green.png" > </p>
				</div>
			</div>
		</div>
		<div class="box box_bg3">
			<h2 class="box-text">医疗管理</h2>
			<div class="box-main">
				<div class="box-main-box">
					<div class="box-main-box-mid"><p class="drop-down-btn-noarrow " id="manageMission">管理任务</p></div>
					<p class="box-main-box-right"> <img class="box-main-box-right-img" src="${ctxStatic}/common/img/modules/Tips-red.png" > </p>
				</div>
				<div class="box-main-box">
					<div class="box-main-box-mid">
							<p class="drop-down-btn active" onmouseover="showDropDownList('hzaqmb')" onclick="hiddenDropDownList('hzaqmb')">患者安全目标</p>
							<div class="drop-down-list" style="display:none;" id='hzaqmb'>
								<ul class="drop-down-list-ul">
									<li>
										<div class="drop-down-list-li-selection " >安全目标</div>
										<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
									</li>
									<li>
										<div class="drop-down-list-li " >安全文化</div>
										<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
									</li>	
								</ul>
							</div>
					</div>	
					<p class="box-main-box-right"> <img class="box-main-box-right-img" src="${ctxStatic}/common/img/modules/Tips-green.png" > </p>
				</div>
				<div class="box-main-box">
					<div class="box-main-box-mid">
							<p class="drop-down-btn active" onmouseover="showDropDownList('ylgl')" onclick="hiddenDropDownList('ylgl')">医疗管理</p>
							<div class="drop-down-list" style="display:none;" id='ylgl'>
								<ul class="drop-down-list-ul">
									<li>
										<div class="drop-down-list-li-selection " >医疗质量</div>
										<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
									</li>
									<li>
										<div class="drop-down-list-li " >医疗技术</div>
										<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
									</li>	
									<li>
										<div class="drop-down-list-li " >医疗风险</div>
										<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
									</li>
									<li>
										<div class="drop-down-list-li " >不良事件</div>
										<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
									</li>
									<li>
										<div class="drop-down-list-li " >危急值</div>
										<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
									</li>
									<li>
										<div class="drop-down-list-li " >应急管理</div>
										<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
									</li>
									<li>
										<div class="drop-down-list-li " >病案管理</div>
										<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
									</li>
									<li>
										<div class="drop-down-list-li " >健康教育</div>
										<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
									</li>
									<li>
										<div class="drop-down-list-li " >护理管理</div>
										<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" >
									</li>
								</ul>
							</div>
					</div>	
					<p class="box-main-box-right"> <img class="box-main-box-right-img" src="${ctxStatic}/common/img/modules/Tips-green.png" > </p>
				</div>

				<div class="box-main-box">
					<div class="box-main-box-mid">
							<p class="drop-down-btn active" onmouseover="showDropDownList('yxgl')" onclick="hiddenDropDownList('yxgl')">药械管理</p>
							<div class="drop-down-list" style="display:none;" id='yxgl'>
								<ul class="drop-down-list-ul">
									<li>
										<div class="drop-down-list-li-selection " >药事管理</div>
										<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
									</li>
									<li>
										<div class="drop-down-list-li " >器械管理</div>
										<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
									</li>	
									<li>
										<div class="drop-down-list-li " >临床研究</div>
										<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
									</li>	
								</ul>
							</div>
					</div>	
					<p class="box-main-box-right"> <img class="box-main-box-right-img" src="${ctxStatic}/common/img/modules/Tips-green.png" > </p>
				</div>
				<div class="box-main-box">
					<div class="box-main-box-mid"><p class="drop-down-btn-noarrow ">感染管理</p></div>
					<p class="box-main-box-right"> <img class="box-main-box-right-img" src="${ctxStatic}/common/img/modules/Tips-green.png" > </p>
				</div>
			</div>
		</div>
		<div class="box box_bg4">
			<h2 class="box-text">医疗保障</h2>
			<div class="box-main">
				<div class="box-main-box">
					<div class="box-main-box-mid">
							<p class="drop-down-btn active" onmouseover="showDropDownList('rlbz')" onclick="hiddenDropDownList('rlbz')">人力保障</p>
							<div class="drop-down-list" style="display:none;" id='rlbz'>
								<ul class="drop-down-list-ul">
									<li>
										<div class="drop-down-list-li-selection " >人力保障</div>
										<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
									</li>
									<li>
										<div class="drop-down-list-li " >社工保障</div>
										<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
									</li>	
								</ul>
							</div>
					</div>	
					<p class="box-main-box-right"> <img class="box-main-box-right-img" src="${ctxStatic}/common/img/modules/Tips-green.png" > </p>
				</div>
				<div class="box-main-box">
					<div class="box-main-box-mid">
							<p class="drop-down-btn active" onmouseover="showDropDownList('cjbz')" onclick="hiddenDropDownList('cjbz')">财经保障</p>
							<div class="drop-down-list" style="display:none;" id='cjbz'>
								<ul class="drop-down-list-ul">
									<li>
										<div class="drop-down-list-li-selection " >结算</div>
										<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
									</li>
									<li>
										<div class="drop-down-list-li " >收费</div>
										<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
									</li>	
									<li>
										<div class="drop-down-list-li " >医保费用</div>
										<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
									</li>
									<li>
										<div class="drop-down-list-li " >物价</div>
										<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
									</li>
								</ul>
							</div>
					</div>	
					<p class="box-main-box-right"> <img class="box-main-box-right-img" src="${ctxStatic}/common/img/modules/Tips-green.png" > </p>
				</div>
				<div class="box-main-box">
					<div class="box-main-box-mid">
							<p class="drop-down-btn active" onmouseover="showDropDownList('wzbz')" onclick="hiddenDropDownList('wzbz')">物资保障</p>
							<div class="drop-down-list" style="display:none;" id='wzbz'>
								<ul class="drop-down-list-ul">
									<li>
										<div class="drop-down-list-li-selection " >医疗物资</div>
										<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
									</li>
									<li>
										<div class="drop-down-list-li " >药品保障</div>
										<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
									</li>	
									<li>
										<div class="drop-down-list-li " >医用材料</div>
										<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
									</li>
									<li>
										<div class="drop-down-list-li " >后勤物资</div>
										<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
									</li>
								</ul>
							</div>
					</div>	
					<p class="box-main-box-right"> <img class="box-main-box-right-img" src="${ctxStatic}/common/img/modules/Tips-green.png" > </p>
				</div>
				<div class="box-main-box">
					<div class="box-main-box-mid">
							<p class="drop-down-btn active" onmouseover="showDropDownList('sbss')" onclick="hiddenDropDownList('sbss')">设备设施</p>
							<div class="drop-down-list" style="display:none;" id='sbss'>
								<ul class="drop-down-list-ul">
									<li>
										<div class="drop-down-list-li-selection " >医疗设备</div>
										<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
									</li>
									<li>
										<div class="drop-down-list-li " >消毒供应</div>
										<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
									</li>	
									<li>
										<div class="drop-down-list-li " >环境设施</div>
										<img class="drop-down-list-li-img"  src="${ctxStatic}/common/img/modules/Tips-green.png" > 
									</li>
								</ul>
							</div>
					</div>	
					<p class="box-main-box-right"> <img class="box-main-box-right-img" src="${ctxStatic}/common/img/modules/Tips-green.png" > </p>
				</div>
				<div class="box-main-box">
					<div class="box-main-box-mid"><p class="drop-down-btn-noarrow ">信息保障</p></div>
					<p class="box-main-box-right"> <img class="box-main-box-right-img" src="${ctxStatic}/common/img/modules/Tips-green.png" > </p>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script>
$(function(){
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
	$('#manageMission').click(function() {
		window.location.href="/ps/a/manageMission";
	});

});
function showDropDownList(obj){
	$('.drop-down-list').css('display','none');
	$("#"+obj).css('display','block');
}
function hiddenDropDownList(obj){
	$("#"+obj).css('display','none');
}
</script>
</html>
