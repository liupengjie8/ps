<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp" %>
<html>
<head>
    <title>指标管理</title>

    <meta name="decorator" content="ani">

    <script>
        var printSetup = function(){
            // 打印页面设置
            wb.execwb(8,1);
        }
        var printPreView = function(){
            // 打印页面预览    　　
            wb.execwb(7,1);
        }
        var printIt = function(){
            if (confirm('确定打印吗？')) {
                //wb.execwb(6,6)   ;
                bdhtml=window.document.body.innerHTML;
                //1.表头标题改变
                $("#tmzb").html($("#selectIndex").find("option:selected").text());
                $("#tmhbm").html($("#hbm").find("option:selected").text());
                $("#tmzbm").html($("#zbm").find("option:selected").text());
                var index = $("#selectIndex").val();
                var hbm = $("#hbm").val();
                var zbm = $("#zbm").val();
                var a = $("#selectIndex").find("option:selected").text();
                var index_suffix = a.substring(a.length - 3);
                console.log($("#searchForm").serializeJSON());
                //判断手术服务是否是不合格
                $.ajax({
                    type: "post",
                    url: "/ps/a/indexForm/indexForm/indexFormData",
                    data: $("#searchForm").serializeJSON(),
                    dataType: "json",
                    success: function (result) {

                        var html=" <div style='page-break-after:always;'>" +
                            " <h2>各"+$("#zbm").find("option:selected").text()+"各"+$("#hbm").find("option:selected").text()+$("#selectIndex").find("option:selected").text()+"</h2>" +
                            "<table class=\"report-page-table\">\n" +
                            "                            <thead>\n" +
                            "                            <tr id=\"th_element\">\n" ;
                        html
                        //第一个表头
                        var btList = result.btList;
                         html += '<th class="th1"> </th>';
                        for (j = 0, len = btList.length; j < len; j++) {
                            html += '<th class="th2"  colspan="3"  >' + btList[j] + '</th>'
                        }
                        html+="   </tr>\n" +
                            "                            </thead>";
                        html+='<tbody id=\"tr_element\">';



                        //第二个表头
                        html+= '<tr><td class="td1">' + $("#zbm").find("option:selected").text() + '</td>';
                        for (j = 0, len = btList.length; j < len; j++) {
                            html += '<td class="td1" style="border-right: none;" >人次</td>'
                            html += '<td class="td1" style="border-right: none;" >未完成人次</td>'
                            html += '<td class="td1">' + index_suffix + '</td>'
                        }
                        html += '</tr>';
                        //表内数据
                        var dataList = result.dataList;
                        for (i = 0, lena = dataList.length; i < lena; i++) {
                            html += '<tr>'
                            if (dataList[i][zbm.toUpperCase()].indexOf("中心") != -1) {
                                html += '<td class="td1" style="border-right: none;font-size : medium" >' + dataList[i][zbm.toUpperCase()] + '</td>'
                            } else if (dataList[i][zbm.toUpperCase()].indexOf("临床部") != -1) {
                                html += '<td class="td1" style="border-right: none;font-size : small;text-indent:20px" >' + dataList[i][zbm.toUpperCase()] + '</td>'
                            } else {
                                html += '<td class="td1" style="border-right: none;font-size : x-small;text-indent:40px" >' + dataList[i][zbm.toUpperCase()] + '</td>'
                            }
                            for (j = 0, len = btList.length; j < len; j++) {
                                html += '<td class="td1" style="border-right: none;" >' + dataList[i][btList[j] + 'ALLCOUNT'] + '</td>'
                                html += '<td class="td1" style="border-right: none;" >' + dataList[i][btList[j] + 'NQCOUNT'] + '</td>'
                                if (dataList[i][btList[j] + 'ALLCOUNT'] == 0) {
                                    html += '<td class="td1">--</td>'
                                } else {
                                    html += '<td class="td1">' + Math.round((dataList[i][btList[j] + 'ALLCOUNT'] - dataList[i][btList[j] + 'NQCOUNT']) * 100 / dataList[i][btList[j] + 'ALLCOUNT'], 2) + '</td>'
                                }
                            }
                            html += '</tr>'
                        }
                        html +='</tbody>\n' +
                            '                        </table></div>';
                        prnhtml=html;
                        window.document.body.innerHTML=prnhtml; //把需要打印的指定内容赋给body.innerHTML
                        window.print(); //调用浏览器的打印功能打印指定区域
                        window.document.body.innerHTML=bdhtml;//重新给页面内容赋值；
                    }
                });

            }
        }
        var windowClose = function(){
            window.opener=null;
            window.open('','_self');
            window.close();
        };
        function AutomateExcel(){
            var elTable = document.getElementById("table"); //要导出的table id。
            var oRangeRef = document.body.createTextRange();
            oRangeRef.moveToElementText(elTable);
            oRangeRef.execCommand("Copy");
            var appExcel = new ActiveXObject("Excel.Application");
            appExcel.Workbooks.Add().Worksheets.Item(1).Paste();
            appExcel.Visible = true;
            appExcel = null;
        }
        function showHiddenSelectArea() {
            if ($("#showHiddenSelectAreaBtn").html().indexOf("upload") != -1) {
                $("#showHiddenSelectAreaBtn").html('<i class="glyphicon  glyphicon-download"></i>')
                $("#selectArea").css("display", "none");
                $("#showHiddenSelectAreaBtn").attr("title", "显示查询区域");
            } else {
                $("#showHiddenSelectAreaBtn").html('<i class="glyphicon  glyphicon-upload"></i>')
                $("#selectArea").css("display", "block");
                $("#showHiddenSelectAreaBtn").attr("title", "收起查询区域");
            }
        }

        $(function () {
            $(".page_title", parent.document).html("手术服务指标报表");
        })
        $(function () {
            $("select[id='node_select']").change(function () {
                getIndexListByNode();
            })
        })

        function getIndexListByNode() {
            var node = $("#node_select").val();
            $.ajax({
                url: "${ctx}/standindex/opeStIndex/getIndexListByNode",
                type: "post",
                dataType: "json",
                data: {node: node},
                success: function (res) {
                    var html = "";
                    $("#selectIndex").html(html);
                    for (var i = 0; i < res.length; i++) {
                        html += '<option value="' + res[i].id + '">' + res[i].indexName + '</option>'
                    }
                    $("#selectIndex").html(html);
                }
            })
        }

        function selectColumn() {
            $("#select_column").css('display', 'block');
        }

        function cancelSelectColumn() {
            $("#select_column").css('display', 'none');
        }

        function confirmSelectColumn() {
            $("#select_column").css('display', 'none');
            var column_ids = obj.get_data();//选中id数组
            var ids = "";
            for (var i = 0; i < column_ids.length; i++) {
                ids += column_ids[i] + ",";
            }
            $.ajax({
                url: "${ctx}/opecolumn/opeColumn/getColumnListByIds",
                type: "post",
                data: {ids: ids},
                dataType: "json",
                success: function (res) {
                    var columnList = res;
                    $("#selectRow1").html('');
                    var htmlRow1 = '<form id="searchForm" modelAttribute="opeColumn">';
                    for (var i = 0; i < columnList.length; i++) {
                        var column = columnList[i];
                        if (column.columnType == '文本') {
                            htmlRow1 += '<div class="col-xs-1-5">'
                            htmlRow1 += '<div class="form-group">'
                            htmlRow1 += '<div class="col-md-12 update-align-items ">' + column.columnName + '</div>'
                            htmlRow1 += '<div class="col-md-12">'
                            htmlRow1 += '<input  class="form-control " type="text" value="" name="' + column.columnCode + '">'
                            htmlRow1 += '</div>'
                            htmlRow1 += '</div>'
                            htmlRow1 += '</div>'
                            htmlRow1 += '</div>'
                        }
                        if (column.columnType == '下拉') {
                            htmlRow1 += '<div class="col-xs-1-5">'
                            htmlRow1 += '<div class="form-group">'
                            htmlRow1 += '<div class="col-md-12 update-align-items ">' + column.columnName + '</div>'
                            htmlRow1 += '<div class="col-md-12">'
                            var options = column.options;
                            options = options.split('*#');
                            htmlRow1 += '<select id="selectType" name="' + column.columnCode + '" class="form-control ">'
                            htmlRow1 += '<option value="">全部</option>'
                            for (var j = 0; j < options.length; j++) {
                                htmlRow1 += '<option value="' + options[j] + '">' + options[j] + '</option>'
                            }
                            htmlRow1 += '</select>'
                            htmlRow1 += '</div>'
                            htmlRow1 += '</div>'
                            htmlRow1 += '</div>'
                            htmlRow1 += '</div>'
                        }
                        if (column.columnType == '时间') {
                            htmlRow1 += '<div class="col-xs-1-5">'
                            htmlRow1 += '<div class="input-group " >'
                            htmlRow1 += '<div class="col-md-12 update-align-items ">' + column.columnName + '-起</div>'
                            htmlRow1 += '<div class="col-md-12 ">'
                            htmlRow1 += '<input  class="form-control form_datetime" type="text" value="" name="' + column.columnCode + 'Start">'
                            htmlRow1 += '</div>'
                            htmlRow1 += '</div>'
                            htmlRow1 += '</div>'
                            htmlRow1 += '</div>'
                            htmlRow1 += '<div class="col-xs-1-5">'
                            htmlRow1 += '<div class="input-group">'
                            htmlRow1 += '<div class="col-md-12 update-align-items ">' + column.columnName + '-止</div>'
                            htmlRow1 += '<div class="col-md-12 ">'
                            htmlRow1 += '<input  class="form-control form_datetime" type="text" value="" name="' + column.columnCode + 'End">'
                            htmlRow1 += '</div>'
                            htmlRow1 += '</div>'
                            htmlRow1 += '</div>'
                            htmlRow1 += '</div>'
                        }
                    }
                    htmlRow1 += '</form>'
                    $("#selectRow1").html(htmlRow1);
                    lay('.form_datetime').each(function () {
                        laydate.render({
                            elem: this
                            , trigger: 'click'
                        });
                    });

                }
            });

        }

        $(function () {
            var data = [];
            //获取字段合集
            $.ajax({
                url: "${ctx}/opecolumn/opeColumn/getAllColumnList",
                type: "post",
                dataType: "json",
                data: {},
                success: function (res) {
                    var parentlist = res.parentlist;
                    for (var i = 0; i < parentlist.length; i++) {
                        data.push(parentlist[i]);
                    }
                    var childlist = res.childlist;
                    for (var i = 0; i < childlist.length; i++) {
                        data.push(childlist[i]);
                    }


                    obj = cascadeBox('cascadebox', 'checkboxname', data, [], [], true, true, null);

                },
                fail: function (err) {
                    console.log(err);
                }
            });
        });


        function search() {
            //1.表头标题改变
            $("#tmzb").html($("#selectIndex").find("option:selected").text());

            $("#tmhbm").html($("#hbm").find("option:selected").text());

            $("#tmzbm").html($("#zbm").find("option:selected").text());
            var index = $("#selectIndex").val();
            var hbm = $("#hbm").val();
            var zbm = $("#zbm").val();
            var a = $("#selectIndex").find("option:selected").text();
            var index_suffix = a.substring(a.length - 3);
            console.log($("#searchForm").serializeJSON());
            //判断手术服务是否是不合格
            $.ajax({
                type: "post",
                url: "/ps/a/indexForm/indexForm/indexFormData",
                data: $("#searchForm").serializeJSON(),
                dataType: "json",
                success: function (result) {
                    $("#allcount").html(result.allcount);
                    $("#qcount").html(result.allcount - result.nqcount);
                    $("#nqcount").html(result.nqcount);
                    $("#qrate").html(Math.round((result.allcount - result.nqcount) * 100 / result.allcount), 2);
                    $("#standContent").html(result.standContent);
                    //第一个表头
                    var btList = result.btList;
                    $("#th_element").html('');
                    var th_content = '<th class="th1"> </th>';
                    for (j = 0, len = btList.length; j < len; j++) {
                        th_content += '<th class="th2"  colspan="3"  >' + btList[j] + '</th>'
                    }
                    $("#th_element").html(th_content);

                    //第二个表头
                    $("#tr_element").html('');
                    var tr_content = '<tr><td class="td1">' + $("#zbm").find("option:selected").text() + '</td>';
                    for (j = 0, len = btList.length; j < len; j++) {
                        tr_content += '<td class="td1" style="border-right: none;" >人次</td>'
                        tr_content += '<td class="td1" style="border-right: none;" >未完成人次</td>'
                        tr_content += '<td class="td1">' + index_suffix + '</td>'
                    }
                    tr_content += '</tr>';
                    $("#tr_element").html(tr_content);
                    //表内数据
                    var dt_content = '';
                    var dataList = result.dataList;
                    console.log(dataList);
                    for (i = 0, lena = dataList.length; i < lena; i++) {
                        dt_content += '<tr>'
                        if (dataList[i][zbm.toUpperCase()].indexOf("中心") != -1) {
                            dt_content += '<td class="td1" style="border-right: none;font-size : medium" >' + dataList[i][zbm.toUpperCase()] + '</td>'
                        } else if (dataList[i][zbm.toUpperCase()].indexOf("临床部") != -1) {
                            dt_content += '<td class="td1" style="border-right: none;font-size : small;text-indent:20px" >' + dataList[i][zbm.toUpperCase()] + '</td>'
                        } else {
                            dt_content += '<td class="td1" style="border-right: none;font-size : x-small;text-indent:40px" >' + dataList[i][zbm.toUpperCase()] + '</td>'
                        }
                        for (j = 0, len = btList.length; j < len; j++) {
                            dt_content += '<td class="td1" style="border-right: none;" >' + dataList[i][btList[j] + 'ALLCOUNT'] + '</td>'
                            dt_content += '<td class="td1" style="border-right: none;" >' + dataList[i][btList[j] + 'NQCOUNT'] + '</td>'
                            if (dataList[i][btList[j] + 'ALLCOUNT'] == 0) {
                                dt_content += '<td class="td1">--</td>'
                            } else {
                                dt_content += '<td class="td1">' + Math.round((dataList[i][btList[j] + 'ALLCOUNT'] - dataList[i][btList[j] + 'NQCOUNT']) * 100 / dataList[i][btList[j] + 'ALLCOUNT'], 2) + '</td>'
                            }
                        }
                        dt_content += '</tr>'
                    }
                    $("#tr_element").html(tr_content + dt_content);
                }
            });
        }
		function exportTables(){
			var searchParam = $("#searchForm").serializeJSON();
			var values = "";
			for(var key in searchParam){
				values = values + key + "=" + searchParam[key] + "&";
			}
			jp.downloadFile('${ctx}/indexForm/indexForm/export?'+values);
		}
    </script>
</head>
<body>
<!--  主体内容	-->
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
                            <OBJECT id="wb" height="0" width="0" classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" name="wb"></OBJECT>
                            <button id="btn_select_column" class="btn btn-primary" onclick="printIt()"><i
                                    class="glyphicon glyphicon-print"></i> 打印
                            </button>
                            <button id="btn_select_column" class="btn btn-primary" onclick="exportTables()"><i
                                    class="glyphicon glyphicon-share"></i> 导出
                            </button>
                            <button id="btn_select_column" class="btn btn-primary" onclick="selectColumn()"><i
                                    class="glyphicon glyphicon-plus"></i> 自定义筛选条件
                            </button>
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
                                        <select id="selectType" name="identity" class="form-control ">
                                            <option
                                                    value="">全部
                                            </option>
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
                                            <option value="优惠家属">优惠家属</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-1-5">
                                <div class="form-group">
                                    <div class="col-md-12 update-align-items ">费别</div>
                                    <div class="col-md-12">
                                        <select id="selectType" name="chargeType"
                                                class="form-control ">
                                            <option value="">全部</option>
                                            <option value="地方公疗">地方公疗</option>
                                            <option value="地方医保">地方医保</option>
                                            <option value="军队医改">军队医改</option>
                                            <option value="全费">全费</option>
                                            <option value="特需服务">特需服务</option>
                                            <option value="武警医改">武警医改</option>
                                            <option value="异地医保">异地医保</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-1-5">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12  update-align-items "> 节点</div>
                                        <div class="col-md-12">
                                            <select id='node_select' class="form-control "
                                                    οnchange="getIndexListByNode()">
                                                <option value="">全部</option>
                                                <c:forEach var='node' items="${nodeList }">
                                                    <option value="${node}">${node}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-1-5">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12  update-align-items "> 指标</div>
                                        <div class="col-md-12">
                                            <select id='selectIndex' name='indexId' class="form-control ">
                                                <c:forEach var='opeIndex' items="${indexList }">
                                                    <option value="${opeIndex.id}">${opeIndex.indexName }</option>
                                                </c:forEach>

                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-1-5">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12  update-align-items "> 横标目</div>
                                        <div class="col-md-12">
                                            <select id='hbm' name='hbm' class="form-control ">
                                                <c:forEach var='ohl' items="${opeHorizontalHeadingList }">
                                                    <option value="${ohl.columnName}">${ohl.columnComment }</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-1-5">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12  update-align-items "> 纵标目</div>
                                        <div class="col-md-12">
                                            <select id='zbm' name="zbm" class="form-control ">
                                                <c:forEach var='oll' items="${opeLongitudinalHeadingList }">
                                                    <option value="${oll.columnName }">${oll.columnComment }</option>
                                                </c:forEach>

                                            </select>
                                        </div>
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

    <!-- 栏目3	-->
    <div class="row" id="">
        <div class="col-md-12">
            <div class="panel panel-primary">

                <!-- 标题end	-->
                <!--表格内容-->
                <div class="panel-body">
                    <div class="row">
                        <div class="report-page-box">
                            <div class="bars pull-right-selectarea" style="margin-top:-39px">
                                <button class="btn btn-primary" id="showHiddenSelectAreaBtn" title="收起查询区域"
                                        onclick="showHiddenSelectArea()">
                                    <i class="glyphicon  glyphicon-upload"></i>
                                </button>
                            </div>
                            <div class="report-page-boxtop">
                                <p>本期，我院有<span id='allcount'>114</span>位患者手术，按时完成手术适应证评估的患者<span id='qcount'>101</span>人，有<span
                                        id='nqcount'>13</span>例患者未在规定时间内给以手术适应证评估，适应证评估按时完成率为<span
                                        id='qrate'>88.60</span>%。</p>
                            </div>

                            <div class="report-page-boxmain">
                                <div class="report-page-boxleft">
                                    <h2>标准条款</h2>

                                    <p id="standContent">1 凡需实施手术的患者，应根据专科相关检查和诊疗标准实施手术适应证评估，排除手术禁忌症。评估内容记入病历。</p>
                                </div>
                                <div class="report-page-boxright" id='tableDiv' style="overflow:scroll;">

                                    <h2>各<span id='tmhbm'>科室</span>各<span id='tmzbm'>费别</span><span
                                            id='tmzb'>适应症完成率</span></h2>
                                    <table class="report-page-table">
                                        <thead>
                                        <tr id="th_element">
                                            <th class="th1"></th>
                                        </tr>
                                        </thead>
                                        <tbody id="tr_element">
                                        </tbody>
                                    </table>


                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>