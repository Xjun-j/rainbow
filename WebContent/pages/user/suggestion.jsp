<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 顶部 -->
<jsp:include page="/pages/common/header.jsp"  />

	<!-- 中间 -->
	<div class="container"  style="margin-bottom:30px;padding-top:60px;">
		<ol class="breadcrumb">
		  <li><span class="glyphicon glyphicon-home"></span></li>
		  <li id="current_menu">用户反馈</li>
		</ol>
		<table id="table"
           data-show-refresh="true"
           data-show-toggle="true"
           data-minimum-count-columns="2"
           data-pagination="true"
           data-id-field="idStr"
           data-page-list="[10, 25, 50, 100, ALL]"
           data-show-footer="false"
           data-side-pagination="server"
		 >
		</table>
	</div>
	
<!-- 底部 -->
<jsp:include page="../common/footer.jsp"/>
	

<script type="text/javascript">
// 	function switchOn(){
// 		return ['<div class="switch switch-mini">',
// 		        '<input class="switch" type="checkbox" checked />',
// 				'</div>'
// 				].join('');
// 	}
// 	function switchOff(){
// 		return [' <input class="switch" type="checkbox" />'].join('');
// 	}
// 	function getSwitch(value, row, index){
// 		return value? switchOn():switchOff();
// 	}

	$('#table').bootstrapTable({
	    url: 'suggestion/findAll',
	//  height:getHeight(),
	    showToggle:true,
	//     cardView:true,
// 		search:true,
		searchOnEnterKey:true,
		pagination:true,
		showColumns:true,
		pageList:[10, 20, 50, 100],
		contentType: "application/json",
	// 	onlyInfoPagination:'true',
	// 	showPaginationSwitch:true,
		striped:true,
		dataType:'json',
		method:'post',
	    columns: [{
	    	width:50,
	    	align:'center',
	    	visible:false,
	        field: 'id',
	        title: 'ID'
	    }, {
	    	width:90,
// 	    	visible:false,
	    	align:'center',
	        field: 'contact',
	        title: '联系方式'
	    }, {
	    	width:180,
	    	align:'center',
	        field: 'suggestion',
	        title: '反馈内容'
	    }, {
	    	width:80,
	    	align:'center',
	        field: 'phone',
	        title: '机型'
	    }, {
	    	width:70,
	    	align:'center',
	        field: 'os',
	        title: '操作系统'
	    }, {
	    	width:70,
	    	align:'center',
	        field: 'appVersion',
	        title: 'app版本'
	    }, {
	        field: 'createTime',
	        width:100,
	        align:'center',
	        title: '创建时间',
	        formatter:function(value,row,index){
				return new Date(value).format("yyyy-MM-dd hh:mm:ss");
	        }
	    }, {
	        field: 'status',
	        width:50,
	        align:'center',
	        title: '处理状态',
	        formatter:function(value,row,index){
				return !value? "未处理":"已处理";
	        }
	    }, {
	    	width:100,
	    	visible:false,
	    	align:'center',
	        field: 'updateTime',
	        title: '更新时间',
	        formatter:function(value,row,index){
				return value? new Date(value).format("yyyy-MM-dd hh:mm:ss"):"";
	        }
	    },
	    {
	    	width:90,
	    	align:'center',
	        field: '',
	        title: '操作',
	        align: 'center',
	        events: {
	            'click .edit': function (e, value, row, index) {
	            	updateStatus(row.id);
	            }
	        },
	        formatter: operateFormatter
	    } 
	    ]
	});
	
	function getHeight() {
	    return $(window).height() - 150;
	}	
	
	function operateFormatter(value, row, index) {
		if(row.status!=0){
			return "";
		}else{
		    return [
		        '<a class="edit" href="javascript:void(0)" title="标记为已处理">',
		        '<span class="glyphicon glyphicon-check"> </span>标记为已处理',
		        '</a>  '
		    ].join('');
		}
		
	}
	
	function updateStatus(id){
		$.ajax({
			url : "suggestion/changeStatus",
			dataType : 'json',
			data:{'id':id},
			type : 'post',
			success : function(data) {
				alert("修改成功");
				$('#table').bootstrapTable('refresh');
			},
			error: function(xhr){
	        	if( xhr.status == "200"){ // 兼容调试时301/302重定向导致触发error的问题
					window.location.href = "/rainbow/login";
				}
	            alert("保存失败！请重试！");
	        }
		});
	}
	
	
	
	
	
</script>