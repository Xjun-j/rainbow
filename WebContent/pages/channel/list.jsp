<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 头部 -->
<jsp:include page="/pages/common/header.jsp"  />
	<!-- 中间 -->
	<div class="container" style="margin-bottom:30px;padding-top:60px;" >
		<ol class="breadcrumb">
		  <li><span class="glyphicon glyphicon-home"></span></li>
		  <li id="current_menu">渠道管理</li>
		</ol>
		
		<div id="toolbar">
	        <button id="add" class="btn btn-info" data-toggle="modal" data-target="#channel_panel">
	            <i class="glyphicon glyphicon-plus"  ></i> 新增
	        </button>
		</div>
		<table id="table"
		   data-toolbar="#toolbar"
           data-search="true"
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
	<div class="modal fade" id="channel_panel" tabindex="-1" role="dialog" aria-labelledby="editTheme" aria-hidden="true" data-backdrop="static">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <sapn class="modal-title"  style="font-size:16px;" ><b><span class="glyphicon glyphicon-edit"></span></b></span>
	      </div>
	      <div class="modal-body">
	        <form id="channel_form" class="form-horizontal"   onsubmit="return false;">
	        	  <input type="hidden" name="id" id="id">
	        	  <input type="hidden" name="zipUrl" id="zip_url">
	        	  <input type="hidden" name="zipSize" id="size">
	        	  <input type="hidden" name="md5" id="md5">
	        	  
       			  <div class="form-group">
				    <label for="name" class="col-sm-2 control-label">渠道全称<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				      <input type="text" name="name"  class="form-control" id="name" required >
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="alias" class="col-sm-2 control-label">渠道简称<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				      <input type="text" name="alias"  class="form-control" id="alias" required >
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="phone" class="col-sm-2 control-label">联系电话<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				      <input type="text" name="phone"  class="form-control" id="phone" required >
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="address" class="col-sm-2 control-label">详细地址<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				      <textarea rows="2" name="address"  class="form-control" id="address" required></textarea>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="categories" class="col-sm-2 control-label">视频分类<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				      <select  name="categoriesId"  class="form-control selectpicker" id="categories" multiple required >
				      </select>
				    </div>
				  </div>
				  
				  <div class="form-group" id="ios_url_div" style="display:none">
				    <label for="url" class="col-sm-2 control-label">下载链接<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				      <input type="text" name="url"  class="form-control" id="ios_url" disabled="disabled" required>
				    </div>
				  </div>
				  
<!-- 				  <div class="form-group"> -->
<!-- 	  			      <div class="col-md-offset-2 col-md-8"> -->
				      	<button type="submit" style="display:none" id="hide_submit"></button>
<!-- 				      </div> -->
<!-- 			      </div> -->
	        </form>
<!-- 	        APK上传 -->
		      <form id="zip_form" enctype="multipart/form-data" method="post"   class="form-horizontal" >
		      		 <div class="form-group">
		      		 	<label for="zip" class="col-md-2 control-label">资源包<span id="zip_redstar" class="redstar">&nbsp;*</span></label>
					    <div class="col-md-8">
					    	 <input type="file" name="file"  class="form-control" id="zip" required>
					    	 <div class="progress" style="margin-bottom:0px;margin-top:1px;height:10px;display:none;">
								  <div id="zip_progress" class="progress-bar progress-bar-info  progress-bar-striped active" role="progressbar" aria-valuenow="2"  
								  aria-valuemin="0" aria-valuemax="100" style="min-width:1%;">
								  </div>
							</div>
					    </div>
					    <div class="col-md-2"> <input class="btn btn-default" type="submit" value="上传" > </div>
					  </div>
			  </form>
		        
			  <div class="row" style="margin-top:15px;">
			    <div class="col-md-offset-2 col-md-8">
			      <button  onclick="updateOrSave()" class="btn btn-info" style="width:100%;">&nbsp;保&nbsp;&nbsp;存&nbsp;</button>
<!-- 			      <input id="btn_reset" type="reset" style="display:none;" />  -->
			    </div>
		  	  </div>
		        
	      </div>
<!-- 	      <div class="modal-footer"> -->
<!-- 	        <button type="button" class="btn btn-default" data-dismiss="关闭">Close</button> -->
<!-- 	        <button type="button" class="btn btn-success">上传</button> -->
<!-- 	      </div> -->
	    </div>
	  </div>
	</div>
	
	
	<!-- 删除modal start********************************************************** -->
	<div class="modal fade" id="delete_panel" tabindex="-1" role="dialog" aria-labelledby="deleteDesigner" aria-hidden="true" data-backdrop="static">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="deleteDesigner">提示</h4>
	      </div>
	      <div class="modal-body">
	     		<p class="text-center" style="font-size:16px;"> <span class="glyphicon glyphicon-exclamation-sign" style="color:red"></span>&nbsp; &nbsp;确定删除 ? </p>
	     		<input type="hidden" id="delete_id">
	      </div>
	      
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button id="delete_confrim" type="button" class="btn btn-info">确定</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 删除modal end********************************************************** -->
	
	
<!-- 底部 -->
<jsp:include page="../common/footer.jsp"/>

<script type="text/javascript">
$(function(){
	// 分类列表
	$.ajax({
		url : contextPath+"/video/category/findCategoryList",
		dataType : 'json',
		data:JSON.stringify({"parentId" : "1"}),
		contentType : 'application/json',
// 		data:{'id':id},
		type : 'post',
		success : function(data){
			var categories = $("#categories");
			categories.empty();
			var options ="";
			for(var i=0; i<data.rows.length; i++){
				options += "<option value='"+data.rows[i].id+"'>"+data.rows[i].name+"</option>";
			}
			categories.html(options);
			categories.selectpicker("refresh");
			
		},
		error: function(xhr){
			if( xhr.status == "200"){
				location.href = "/rainbow/login";
			}
            alert("网络异常,请刷新重试");
        }
	});
});


$('#table').bootstrapTable({
    url: 'findAll',
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
        field: 'name',
        align:'center',
        width:100,
        title: '渠道全称'
        
    }, {
        field: 'alias',
        align:'center',
        width:80,
        title: '渠道简称'
    }, {
        field: 'phone',
        align:'center',
        width:80,
        title: '联系电话'
    }, {
        field: 'address',
        align:'center',
        width:100,
        title: '详细地址'
    }, {
    	visible:false,
        field: 'zipUrl',
        title: '资源包链接'
    }, {
        field: 'zipSize',
        align:'center',
        width:60,
        title: '文件大小'
    }, {
//     	visible:false,
        field: 'createTime',
        title: '创建日期',
        align:'center',
        width:100,
        formatter: function(value,row,index){
        	return new Date(value).format("yyyy-MM-dd hh:mm:ss");
        }
    }, {
//         field: 'operate',
		width:60,
        title: '操作',
        align: 'center',
        events: {
            'click .edit': function (e, value, row, index) {
//                 alert('You click like action, row: ' + JSON.stringify(row));
			    $("#zip_redstar").hide();
				$("#id").val(row.id);
				$("#name").val(row.name);
				$("#alias").val(row.alias);
				$("#phone").val(row.phone);
				$("#address").val(row.address);
				$("#zip_url").val(row.zipUrl);
				$("#size").val(row.zipSize);
				$("#categories").selectpicker('val',row.categoriesId.split(","));
            },
            'click .delete': function (e, value, row, index) {
//              alert('You click like action, row: ' + JSON.stringify(row));
				$("#delete_id").val(row.id);
         }
        },
        formatter: operateFormatter
    } ]
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

function updateOrSave(){
	
	$("#hide_submit").click();
	
	if( !$("#name").val() || !$("#alias").val() || !$("#phone").val() || !$("#address").val() || !$("#categories").val()){
		return false;
	}
	
	if(  !$("#zip_url").val() ){
		if(!$("#id").val()){
			alert("请上传资源包！");
			return false;
		}
	}
	if($("#id").val()){
		var width = $("#zip_progress").width();
		var total = $("#zip_progress").parent(".progress").width();
		var rate = width/total*100;
		if( rate >2 && rate <100){
			alert("资源包正在上传,请稍等！");
			return false;
		}
	}
	
	$("#channel_form").ajaxSubmit({
        url:"save",
        dataType:"json",
        type:"POST",
        success: function(data){
//             console.log("data",data);
			$("#channel_panel").modal('hide');
            alert("保存成功！");
            $("#channel_form").resetForm();
			$('#table').bootstrapTable('refresh');
			$("#zip_form").resetForm();
			$("#zip_progress").parent(".progress").hide();
        },
        error: function(xhr){
        	if( xhr.status == "200"){ // 兼容调试时301/302重定向导致触发error的问题
				location.href = "/rainbow/login";
			}
            alert("保存失败！请重试！");
        }
    });
}


$("#zip").on('change',function(e){
	var localfile = e.target.value;
	var suffix = localfile.substring(localfile.lastIndexOf("."));
	$("#zip_progress").width("0%");
	if(suffix !='.zip'  ){
		alert(" 亲,请上传 zip 文件！");
		e.target.value="";
		return false;
	}
});

$("#zip_form").submit(function(e){
    e.preventDefault();
    if(!$("#zip").val()){
		alert("请选择资源包！");
		return false;
	}
    $("#zip_form").ajaxSubmit({
//         url:"upload/zip",
		url:contextPath+"/upload/oss/file",
        dataType:"json",
        type:"POST",
        success: function(data){
//             console.log("data",data);
            $("#zip_url").val(data.url);
            $("#size").val(data.size);
            $("#zip_progress").width("100%");
        },
        error: function(xhr){
        	if( xhr.status == "200"){ // 兼容调试时301/302重定向导致触发error的问题
				location.href = "/rainbow/login";
			}
//             console.log("error",error);
            alert("保存失败！请重试！");
        }
    });
    
    $("#zip_progress").parent(".progress").show();
    var intervalId = setInterval(function(){
    	$.ajax({
			url : contextPath+"/upload/progress",
			data:{},
			dataType : 'json',
			type : 'post',
			success : function(data){
				if(data.result.uploaded == data.result.total){
					console.log(new Date()+"finish:"+data.result.uploaded);
					$("#zip_progress").width("90%");
					clearInterval(intervalId);
				}else{
					console.log("interval:"+Math.ceil(data.result.uploaded/data.result.total*100));
					$("#zip_progress").width(Math.ceil(data.result.uploaded/data.result.total*100)+"%");
				}
			},
			error: function(xhr){
	        	if( xhr.status == "200"){ // 兼容调试时301/302重定向导致触发error的问题
					location.href = "/rainbow/login";
				}
	            alert("上传失败！请重试！");
	        }
		});
    },500);
    
});



$("#delete_confrim").on("click",function(){
	var id = $("#delete_id").val();
	$.ajax({
		url : "delete",
		dataType : 'json',
		data:{'id':id},
		type : 'post',
		success : function(data) {
			$("#delete_panel").modal("hide");
			$('#table').bootstrapTable('refresh');
		},
		error: function(xhr){
        	if( xhr.status == "200"){ // 兼容调试时301/302重定向导致触发error的问题
				location.href = "/rainbow/login";
			}
            alert("保存失败！请重试！");
        }
	});
});

$("#add").on("click",function(){
	$("#zip_redstar").show();
	$("#channel_form").resetForm();
	$("#categories").selectpicker('val',[]);
});




</script>
