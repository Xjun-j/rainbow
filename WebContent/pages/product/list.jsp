<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 头部 -->
<jsp:include page="/pages/common/header.jsp"  />
	<!-- 中间 -->
	<div class="container" style="margin-bottom:30px;padding-top:60px;" >
		<ol class="breadcrumb">
		  <li><span class="glyphicon glyphicon-home"></span></li>
		  <li id="current_menu">产品型号</li>
		</ol>
		
		<ul class="nav nav-tabs">
		  <li role="presentation" class="active" ><a data-toggle="tab" href="#tab_product">产品</a></li>
		  <li role="presentation"  ><a data-toggle="tab" href="#tab_model">型号</a></li>
		</ul>
		<div class="tab-content">
		  <div class="tab-pane fade in active" id="tab_product">
		  	<div id="toolbar">
		        <button id="add" class="btn btn-info" data-toggle="modal" data-target="#product_panel">
		            <i class="glyphicon glyphicon-plus"  ></i> 新增产品
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
		
		<div class="tab-pane fade" id="tab_model">
			<div id="m_toolbar">
		        <button id="add_model" class="btn btn-success" data-toggle="modal" data-target="#model_panel">
		            <i class="glyphicon glyphicon-plus"  ></i> 新增型号
		        </button>
			</div>
			<table id="m_table"
			   data-toolbar="#m_toolbar"
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
	  </div>
	</div>
	
<!-- 产品  编辑 新增 窗口 -->	
	<div class="modal fade" id="product_panel" tabindex="-1" role="dialog" aria-labelledby="editTheme" aria-hidden="true" data-backdrop="static">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <sapn class="modal-title"  style="font-size:16px;" ><b><span class="glyphicon glyphicon-edit"></span></b></span>
	      </div>
	      <div class="modal-body">
	       <style>
	       	.form-group{
	 			margin-bottom:20px;
	 		}
	       </style>
	        <form id="product_form" class="form-horizontal"   onsubmit="return false;" data-toggle="validator" role="form">
	        	  <input type="hidden" name="id" id="p_id" value="0">
	        	  
       			  <div class="form-group">
				    <label for="p_name" class="col-sm-3 control-label">产品名称<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				      <input type="text" name="name"  class="form-control" id="p_name" maxlength="30"  placeholder="产品名称,不可重复..." required >
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="p_desc" class="col-sm-3 control-label">产品描述<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				      <input type="text" name="description"  class="form-control" maxlength="128"  id="p_desc" required >
				    </div>
				  </div>
				  
					<div class="form-group ">
						<label class="col-sm-3"></label>
						<div class="col-md-8" >
							<button type="submit" onclick="updateOrSave()" class="btn btn-info" style="width:100%;">&nbsp;保&nbsp;&nbsp;存&nbsp;</button>
						</div>
					</div>
					
				</form>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 型号  编辑 新增 窗口 -->	
	<div class="modal fade" id="model_panel" tabindex="-1" role="dialog" aria-labelledby="editTheme" aria-hidden="true" data-backdrop="static">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <sapn class="modal-title"  style="font-size:16px;" ><b><span class="glyphicon glyphicon-edit"></span></b></span>
	      </div>
	      <div class="modal-body">
	       <style>
	       	.form-group{
	 			margin-bottom:20px;
	 		}
	       </style>
	        <form id="model_form" class="form-horizontal"   onsubmit="return false;" data-toggle="validator" role="form">
	        	  <input type="hidden" name="id" id="m_id" value="0">
	        	  
       			  <div class="form-group">
				    <label for="m_product" class="col-sm-3 control-label">产品名称<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				      <select id="m_product" name="productId" class="form-control"   required></select>
				    </div>
				  </div>
				  
       			  <div class="form-group">
				    <label for="m_name" class="col-sm-3 control-label">型号名称<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				      <input type="text" name="name"  class="form-control" id="m_name" maxlength="30"  placeholder="产品名称,不可重复..." required >
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="m_desc" class="col-sm-3 control-label">型号描述<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				      <input type="text" name="description"  class="form-control" maxlength="128"  id="m_desc" required >
				    </div>
				  </div>
				  
					<div class="form-group ">
						<label class="col-sm-3"></label>
						<div class="col-md-8" >
							<button type="submit" onclick="updateOrSaveModel()" class="btn btn-info" style="width:100%;">&nbsp;保&nbsp;&nbsp;存&nbsp;</button>
						</div>
					</div>
					
				</form>
	      </div>
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
	     		<input type="hidden" id="delete_type">
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
	// 产品列表
	$.ajax({
		url : contextPath+"/product/findAllForSelect",
		dataType : 'json',
		data:{},
		type : 'post',
		success : function(data){
			var select = $("#m_product");
			select.empty();
			var options ="<option value=''>选择产品</option>";
			for(var i=0; i<data.rows.length; i++){
				options += "<option value='"+data.rows[i].id+"'>"+data.rows[i].name+"</option>";
			}
			select.append(options);
// 			select.selectpicker("refresh");
			
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
	/* search:true, */
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
        title: '产品名称'
        
    }, {
        field: 'description',
        align:'center',
        width:80,
        title: '产品描述'
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
				$("#product_form").resetForm();
				$("#p_id").val(row.id);
				$("#p_name").val(row.name);
				$("#p_desc").val(row.description);
            }, 
            'click .delete': function (e, value, row, index) {
//              alert('You click like action, row: ' + JSON.stringify(row));
				$("#delete_id").val(row.id);
				$("#delete_type").val("product");
         }
        },
        formatter: productOperateFormatter
    } ]
});

//型号
$('#m_table').bootstrapTable({
    url: 'findAllModel',
//     height:getHeight(),
    showToggle:true,
//     cardView:true,
	/* search:true, */
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
        field: 'productName',
        align:'center',
        width:100,
        title: '产品名称'
        
    }, {
        field: 'name',
        align:'center',
        width:100,
        title: '型号名称'
        
    }, {
        field: 'description',
        align:'center',
        width:80,
        title: '型号描述'
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
				$("#model_form").resetForm();
            	$("#m_id").val(row.id);
            	$("#m_product").val(row.productId);
 				$("#m_name").val(row.name);
 				$("#m_desc").val(row.description);
            }, 
            'click .delete': function (e, value, row, index) {
//              alert('You click like action, row: ' + JSON.stringify(row));
				$("#delete_id").val(row.id);
				$("#delete_type").val("model");
         }
        },
        formatter: modelOperateFormatter
    } ]
});


function getHeight() {
    return $(window).height() - 150;
}

function modelOperateFormatter(value, row, index) {
    return [
        '<a class="edit" href="javascript:void(0)" title="编辑">',
        '<i class="glyphicon glyphicon-edit" data-toggle="modal" data-target="#model_panel"></i>',
        '</a>&nbsp;&nbsp;',
        '<a class="delete" href="javascript:void(0)" title="删除">',
        '<i class="glyphicon glyphicon-trash" data-toggle="modal" data-target="#delete_panel"></i>',
        '</a>  '
    ].join('');
}
function productOperateFormatter(value, row, index) {
    return [
        '<a class="edit" href="javascript:void(0)" title="编辑">',
        '<i class="glyphicon glyphicon-edit" data-toggle="modal" data-target="#product_panel"></i>',
        '</a>&nbsp;&nbsp;',
        '<a class="delete" href="javascript:void(0)" title="删除">',
        '<i class="glyphicon glyphicon-trash" data-toggle="modal" data-target="#delete_panel"></i>',
        '</a>  '
    ].join('');
}

function updateOrSave(){
	var productForm = $("#product_form");
	var hasError = productForm.validator('validate').has('.has-error').length;
	if(!hasError){
		productForm.ajaxSubmit({
	        url:"save",
	        dataType:"json",
	        type:"POST",
	        success: function(data){
	        	if(data.error){
	        		alert(data.error);
	        		return false;
	        	}
				$("#product_panel").modal('hide');
	            alert("保存成功！");
	            productForm.resetForm();
				$('#table').bootstrapTable('refresh');
          	},
	        error: function(xhr){
	        	if( xhr.status == "200"){ // 兼容调试时301/302重定向导致触发error的问题
					location.href = "/rainbow/login";
				}
	            alert("保存失败！请重试！");
	        }
	    });
	}
}

function updateOrSaveModel(){
	var productForm = $("#model_form");
	var hasError = productForm.validator('validate').has('.has-error').length;
	if(!hasError){
		productForm.ajaxSubmit({
	        url:"saveModel",
	        dataType:"json",
	        type:"POST",
	        success: function(data){
	        	if(data.error){
	        		alert(data.error);
	        		return false;
	        	}
				$("#model_panel").modal('hide');
	            alert("保存成功！");
	            productForm.resetForm();
				$('#m_table').bootstrapTable('refresh');
          	},
	        error: function(xhr){
	        	if( xhr.status == "200"){ // 兼容调试时301/302重定向导致触发error的问题
					location.href = "/rainbow/login";
				}
	            alert("保存失败！请重试！");
	        }
	    });
	}
}

$("#delete_confrim").on("click",function(){
	var id = $("#delete_id").val();
	var type = $("#delete_type").val();
	$.ajax({
		url : "delete",
		dataType : 'json',
		data:{'id':id,'type':type},
		type : 'post',
		success : function(data) {
			$("#delete_panel").modal("hide");
			if(type=='product'){
				$('#table').bootstrapTable('refresh');
			}else{
				$('#m_table').bootstrapTable('refresh');
			}
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
	$("#product_form").resetForm();
});
$("#add_model").on("click",function(){
	$("#model_form").resetForm();
});



</script>
