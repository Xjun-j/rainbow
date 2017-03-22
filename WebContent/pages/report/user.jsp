<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 头部 -->
<jsp:include page="/pages/common/header.jsp"  />
	<!-- 中间 -->
	<div class="container" style="margin-bottom:30px;padding-top:60px;" >
		<ol class="breadcrumb">
		  <li><span class="glyphicon glyphicon-home"></span></li>
		  <li id="current_menu">报表</li>
		  <li >用户</li>
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
		
		<div id="chart" style="width:100%;height:400px;margin:0 auto;border-radius:4px; "></div>
		
<!-- 		<div id="toolbar"> -->
<!-- 	        <button id="add" class="btn btn-info" data-toggle="modal" data-target="#channel_panel"> -->
<!-- 	            <i class="glyphicon glyphicon-plus"  ></i> 新增 -->
<!-- 	        </button> -->
<!-- 		</div> -->

<!-- 		<table id="table" -->
<!--            data-side-pagination="client" -->
<!-- 		 > -->
<!-- 		</table> -->
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
	
	var dau = [];
	var newUser = [];
	var acc = [];
	var time = [];
	function search(){
		var params = {};
		params['startDate'] = $("#start_date").val();
		params['endDate'] = $("#end_date").val();
		params['os'] = $("#os").val();
		
		$.ajax({
			url:"userData",
			dataType : 'json',
			data:JSON.stringify(params),
			contentType : 'application/json',
			type : 'post',
			success : function(data){
				console.log(data);
				if(data.rows.length>0){
					time=[];
					dau=[];
					acc=[];
					newUser=[];
					for(var i=0;i<data.rows.length;i++){
						time.push(data.rows[i][0]);
						dau.push(data.rows[i][1]);
						newUser.push(data.rows[i][2]);
						acc.push(data.rows[i][3]);
					}
					renderChart(time,dau,newUser,acc);
				}
			},
			error: function(xhr){
				if( xhr.status == "200"){
					location.href = "/rainbow/login";
				}
	            alert("网络异常,请刷新重试");
	        }
		});
	}
	
	search();
	
	function renderChart(axis,dau,newUser,acc){
		//render echarts 
	    var myChart = echarts.init(document.getElementById('chart'),'infographic');

	    // 指定图表的配置项和数据
	    var option = {
    		backgroundColor:'#f5f5f5',
            title: {
                text: '用户报表'
            },
            tooltip: {
           	    trigger: 'axis'
            },
            legend: {
                data:['DAU','新增','累积'],
                selected: {
                    'DAU': true,
                    '新增': true,
                    '累积':false
                }
            },
            toolbox: {
                feature: {
                	dataView: {},
                    saveAsImage: {}
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: {
//             	type:'category',
				split:false,
				splitLine:{show: false},
                data: axis
            },
            yAxis: {
//                	type : 'value'
            },
            series: [{
                name: 'DAU',
                type: 'line',
                smooth: true,
                symbolSize: 8,
                data: dau
            },{
                name: '新增',
                type: 'line',
                smooth: true,
                symbolSize: 8,
                data: newUser
            },{
                name: '累积',
                type: 'line',
                smooth: true,
                symbolSize: 8,
                data: acc
            }]
        };

	    // 使用刚指定的配置项和数据显示图表。
	    myChart.setOption(option);
	}
	
	$("#start_date").on("change",search);
	$("#end_date").on("change",search);
	$("#os").on("change",search);
	
	
// 	$('#table').bootstrapTable({
// // 	    url: 'userData',
// //	     height:getHeight(),
// // 	    showToggle:true,
// //	     cardView:true,
// // 		search:true,
// // 		searchOnEnterKey:true,
// 		pagination:true,
// 		pageList:[10, 20, 50, 100],
// // 		showColumns:true,
// // 		contentType: "application/json",
// //	 	onlyInfoPagination:'true',
// //	 	showPaginationSwitch:true,
// 		striped:true,
// 		dataType:'json',
// 		method:'post',
// 	    columns: [ {
// 	        field: 'name',
// 	        align:'center',
// 	        width:100,
// 	        title: '渠道全称'
	        
// 	    }, {
// 	        field: 'alias',
// 	        align:'center',
// 	        width:80,
// 	        title: '渠道简称'
// 	    }, {
// 	        field: 'phone',
// 	        align:'center',
// 	        width:80,
// 	        title: '联系电话'
// 	    }, {
// 	        field: 'address',
// 	        align:'center',
// 	        width:100,
// 	        title: '详细地址'
// 	    }, {
// 	    	visible:false,
// 	        field: 'zipUrl',
// 	        title: '资源包链接'
// 	    }, {
// 	        field: 'zipSize',
// 	        align:'center',
// 	        width:60,
// 	        title: '文件大小'
// 	    }, {
// //	     	visible:false,
// 	        field: 'createTime',
// 	        title: '创建日期',
// 	        align:'center',
// 	        width:100,
// 	        formatter: function(value,row,index){
// 	        	return new Date(value).format("yyyy-MM-dd hh:mm:ss");
// 	        }
// 	    }
// 	    ]
// 	});


});
</script>
