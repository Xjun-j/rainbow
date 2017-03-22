<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 头部 -->
<jsp:include page="/pages/common/header.jsp"  />
	<!-- 中间 -->
	<div class="container" style="margin-bottom:30px;padding-top:60px;" >
		<ol class="breadcrumb">
		  <li><span class="glyphicon glyphicon-home"></span></li>
		  <li id="current_menu">报表</li>
		  <li >留存</li>
		</ol>
		
		<div class='row' style="margin-bottom:20px;" >
			<form class="form-inline">
				&nbsp;&nbsp;
				日期：
				<div id="start_date_div" class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd" data-link-format="yyyy-mm-dd">
                    <input id="start_date" class="form-control" size="16" type="text" value=""  readonly>
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
				&nbsp;至&nbsp;
				<div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd"  data-link-format="yyyy-mm-dd">
                    <input id="end_date" class="form-control" size="16" type="text" value="" readonly>
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
                &nbsp;&nbsp;
                操作系统:
                <select id="os" class="form-control"   >
                	<option value="">全部</option>
                	<option value="android">android</option>
                	<option value="ios">ios</option>
				</select>
			</form>
		</div>	
		
<!-- 		<div id="chart" style="width:100%;height:400px;margin:0 auto;border-radius:4px; "></div> -->
		

		<table id="table"
           data-side-pagination="client"
		 >
		</table>
	</div>
	
<!-- 底部 -->
<jsp:include page="../common/footer.jsp"/>

<script type="text/javascript">
$(function(){
	//日期字段初始化
	 $('.form_date').datetimepicker({
		weekStart: 1,
       todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		format:'yyyy-mm-dd'
   });
	//初始化日期 默认查询最近10天的数据
	$("#start_date_div").datetimepicker({initialDate: new Date(new Date().getTime() - 3600*24*10*1000)});;
	$("#start_date").val(getYmdStrByMills(new Date().getTime() - 3600*24*10*1000));
	$("#end_date").val(getYmdStrByMills(new Date().getTime()));
	
	$("#start_date").on("change",search);
	$("#end_date").on("change",search);
	$("#os").on("change",search);
	
	function formatPercent(value,row,index){
		var percent = value*100/row.newUser;
		return percent? Number(percent).toFixed(2) +"%" : "";
	}
	
	function getCellColor(value, row, index, field){
		var percent = value.substr(0,value.length-1);
		var color="";
		if(percent>0 && percent<10){
			color="#66FFCC";
		}else if(percent>=10 && percent<20){
			color="#66FF99";
		}else if(percent>=20 && percent<30){
			color="#66FF66";
		}else if(percent>=30 && percent<40){
			color="#66FF33";
		}else if(percent>40){
			color="#66FF00";
		}
		
		return {css:{'background-color':color}};;
	}
	
	$('#table').bootstrapTable({
		pagination:true,
		pageList:[10, 20, 50, 100],
		striped:true,
	    columns: [ {
	        field: 'statDate',
	        align:'center',
	        width:100,
	        title: '日期'
	    }, {
	        field: 'newUser',
	        align:'center',
	        width:80,
	        title: '新增用户数'
	    }, {
	        field: 'r1',
	        align:'center',
	        width:80,
	        title: '1天',
	        formatter:formatPercent,
	        cellStyle:getCellColor
	    }, {
	        field: 'r2',
	        align:'center',
	        width:80,
	        title: '2天',
	        formatter:formatPercent,
	        cellStyle:getCellColor
	    }, {
	        field: 'r3',
	        align:'center',
	        width:80,
	        title: '3天',
	        formatter:formatPercent,
	        cellStyle:getCellColor
	    }, {
	        field: 'r4',
	        align:'center',
	        width:80,
	        title: '4天',
	        formatter:formatPercent,
	        cellStyle:getCellColor
	    }, {
	        field: 'r5',
	        align:'center',
	        width:80,
	        title: '5天',
	        formatter:formatPercent,
	        cellStyle:getCellColor
	    }, {
		    field: 'r6',
	        align:'center',
	        width:80,
	        title: '6天',
	        formatter:formatPercent,
	        cellStyle:getCellColor
	    }, {
	        field: 'r7',
	        align:'center',
	        width:80,
	        title: '7天',
	        formatter:formatPercent,
	        cellStyle:getCellColor
	    }, {
	        field: 'r10',
	        align:'center',
	        width:80,
	        title: '10天',
	        formatter:formatPercent,
	        cellStyle:getCellColor
	    }, {
	        field: 'r15',
	        align:'center',
	        width:80,
	        title: '15天',
	        formatter:formatPercent,
	        cellStyle:getCellColor
	    }, {
	        field: 'r30',
	        align:'center',
	        width:80,
	        title: '30天',
	        formatter:formatPercent,
	        cellStyle:getCellColor
	    }
	    ]
	});
	
	function search(){
		var params = {};
		params['startDate'] = $("#start_date").val();
		params['endDate'] = $("#end_date").val();
		params['os'] = $("#os").val();
		
		$.ajax({
			url:"<%=request.getContextPath()%>/report/userRetention",
			dataType : 'json',
			data:JSON.stringify(params),
			contentType : 'application/json',
			type : 'post',
			success : function(data){
				var tableData = [];
				if(data.rows.length>0){
					var temp = {};
					for(var i=0;i<data.rows.length;i++){
						//"2016-11-03", 642, 161, 86, 57, 46, 34, 24, 0, 0, 0, 0
						temp={"statDate":data.rows[i][0],
							  "newUser":data.rows[i][1],	
							  "r1":data.rows[i][2],	
							  "r2":data.rows[i][3],	
							  "r3":data.rows[i][4],	
							  "r4":data.rows[i][5],	
							  "r5":data.rows[i][6],	
							  "r6":data.rows[i][7],	
							  "r7":data.rows[i][8],	
							  "r10":data.rows[i][9],	
							  "r15":data.rows[i][10],	
							  "r30":data.rows[i][11]	
						};
						tableData.push(temp);
					}
				}
				renderTable(tableData);
			},
			error: function(xhr){
				if( xhr.status == "200"){
					location.href = "/rainbow/login";
				}
	            alert("网络异常,请刷新重试");
	        }
		});
	}
	
	function renderTable(data){
		$('#table').bootstrapTable("load",data);
	}

	search();

});
</script>
