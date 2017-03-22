<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 头部 -->
<jsp:include page="/pages/common/header.jsp"  />
	<!-- 中间 -->
	<div class="container" style="margin-bottom:30px;padding-top:60px;" >
		<ol class="breadcrumb">
		  <li><span class="glyphicon glyphicon-home"></span></li>
		  <li id="current_menu">防伪码</li>
		  <li >导入</li>
		</ol>
		
		<div id="toolbar">
	        <button id="add" class="btn btn-info" data-toggle="modal" data-target="#version_panel">
	            <i class="glyphicon glyphicon-plus"  ></i> 导入
	        </button>
		</div>
		
		<table id="table"
		   data-toolbar="#toolbar"
           data-show-refresh="true"
           data-show-toggle="true"
           data-show-columns="true"
           data-minimum-count-columns="2"
           data-pagination="true"
           data-id-field="idStr"
           data-page-list="[10, 25, 50, 100, ALL]"
           data-show-footer="false"
           data-side-pagination="server"
		 >
		</table>
	</div>
	
	<!-- 编辑 新增 窗口 -->	
	<div class="modal fade" id="version_panel" tabindex="-1" role="dialog" aria-labelledby="editTheme" aria-hidden="true" data-backdrop="static">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <sapn class="modal-title"  style="font-size:16px;" ><b><span class="glyphicon glyphicon-edit"></span></b></span>
	      </div>
	      <div class="modal-body">
<!-- 	        数据导入 -->
		      <form id="apk_form" enctype="multipart/form-data" method="post"   class="form-horizontal"  >
		      		 <div class="form-group">
		      		 	<label for="apk" class="col-md-2 control-label">数据文件<span id="zip_redstar" class="redstar">&nbsp;*</span></label>
					    <div class="col-md-8">
					    	 <input type="file" name="file"  class="form-control" id="apk" required>
					    	 <div class="progress" style="margin-bottom:0px;margin-top:1px;height:10px;display:none;">
								  <div id="app_progress" class="progress-bar progress-bar-info  progress-bar-striped active" role="progressbar" aria-valuenow="2"  
								  aria-valuemin="0" aria-valuemax="100" style="min-width:1%;">
								  </div>
							</div>
					    </div>
					    <div class="col-md-2"> <input type="submit" value="导入" > </div>
					  </div>
			  </form>
		        
	      </div>
	    </div>
	  </div>
	</div>
	
	
<!-- 底部 -->
<jsp:include page="../common/footer.jsp"/>

<script type="text/javascript">

$('#table').bootstrapTable({
    url: 'findAllSecureNo',
//     height:getHeight(),
    showToggle:true,
//     cardView:true,
	search:true,
	searchOnEnterKey:true,
	pagination:true,
	pageList:[10, 20, 50, 100],
	showColumns:true,
	contentType: "application/json",
// 	onlyInfoPagination:'true',
// 	showPaginationSwitch:true,
	striped:true,
	dataType:'json',
	method:'post',
    columns: [{
    	visible:false,
        field: 'id',
        title: 'ID'
    }, {
        field: 'uidcode',
        align:'center',
        width:80,
        title: '防伪码'
    }, {
//     	visible:false,
        field: 'createTime',
        title: '创建日期',
        align:'center',
        width:110,
        formatter: function(value,row,index){
        	return new Date(value).format("yyyy-MM-dd hh:mm:ss");
        }
    }, {
        field: 'status',
        align:'center',
        width:60,
        title: '激活状态',
        formatter:function(value,row,index){
        	return value? '已激活':'未激活';
        }
    }, {
//     	visible:false,
        field: 'activeTime',
        title: '激活日期',
        align:'center',
        width:110,
        formatter: function(value,row,index){
        	return value? new Date((parseInt(value)-28800)*1000).format("yyyy-MM-dd hh:mm:ss"):'';
        }
    }, {
//     	visible:false,
        field: 'activeArea',
        title: '激活IP',
        align:'center',
        width:60
    }, {
//     	visible:false,
        field: 'imei',
        title: 'imei',
        align:'center',
        width:60
    }
    ]
});

function getHeight() {
    return $(window).height() - 150;
}

function operateFormatter(value, row, index) {
    return [
        '<a class="edit" href="javascript:void(0)" title="编辑">',
        '<i class="glyphicon glyphicon-edit" data-toggle="modal" data-target="#channel_panel"></i>',
        '</a>&nbsp;&nbsp;',
        '<a class="delete" href="javascript:void(0)" title="删除">',
        '<i class="glyphicon glyphicon-trash" data-toggle="modal" data-target="#delete_panel"></i>',
        '</a>  '
    ].join('');
}



function generateNo(){
	var hasError = $("#generate_form").validator('validate').has('.has-error').length;
	if(!hasError){
		$("#loading-mask").show();
		$("#generate_form").ajaxSubmit({
	        url:"generateSecureNo",
	        dataType:"json",
	        type:"post",
	        success: function(data){
	            $("#generate_form").resetForm();
	            $("#p_model").attr("disabled","disabled");
				$('#table').bootstrapTable('refresh');
				window.open(data.success);
				$("#loading-mask").hide();
	        },
	        error: function(xhr){
	        	$("#loading-mask").hide();
	        	if( xhr.status == "200"){ // 兼容调试时301/302重定向导致触发error的问题
					location.href = "/rainbow/login";
				}
	            alert("保存失败！请重试！");
	        }
	    });
	}else{
		return false;
	}
	
}


$("#apk_form").submit(function(e){
    e.preventDefault();
    if(!$("#apk").val()){
		alert("请选择数据文件！");
		return false;
	}
    $("#apk_form").ajaxSubmit({
//         url:"upload/app",
        url:contextPath+"/product/importFWM",
        dataType:"json",
        type:"POST",
        success: function(data){
        	console.log(new Date()+data.url);
            $("#app_progress").width("100%");
            alert("导入成功！");
            $("#version_panel").modal('hide');
			$('#table').bootstrapTable('refresh');
			$("#apk_form").resetForm();
			$("#app_progress").parent(".progress").hide();
        },
        error: function(xhr){
        	if( xhr.status == "200"){ // 兼容调试时301/302重定向导致触发error的问题
				location.href = "/rainbow/login";
			}
            alert("保存失败！请重试！");
        }
    });
    
    
    $("#app_progress").parent(".progress").show();
    var intervalId = setInterval(function(){
    	$.ajax({
			url : contextPath+"/upload/progress",
			data:{},
			dataType : 'json',
			type : 'post',
			success : function(data){
				if(data.result.uploaded == data.result.total){
					console.log(new Date()+"finish:"+data.result.uploaded);
					$("#app_progress").width("90%");
					clearInterval(intervalId);
				}else{
					var progress = Math.ceil(data.result.uploaded/data.result.total*100);
					console.log("interval:"+progress);
					$("#app_progress").width( (progress>90? 90:progress )+"%");
				}
			},
			error: function(xhr){
	        	if( xhr.status == "200"){ // 兼容调试时301/302重定向导致触发error的问题
					location.href = "/rainbow/login";
				}
	            alert("导入失败！请重试！");
	        }
		});
    },500);
    
});

$("#add").on("click",function(){
	$("#zip_redstar").show();
});






</script>
