<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 顶部 -->
<jsp:include page="/pages/common/header.jsp"  />

	<!-- 中间 -->
	<div class="container"  style="margin-bottom:30px;padding-top:60px;">
		<ol class="breadcrumb">
		  <li><span class="glyphicon glyphicon-home"></span></li>
		  <li id="current_menu">分类管理</li>
		</ol>
		<div id="toolbar">
	        <button id="add" class="btn btn-info" data-toggle="modal" data-target="#add_panel">
	            <i class="glyphicon glyphicon-plus"  ></i> 新增
	        </button>
		</div>
		<table id="table"
		   data-toolbar="#toolbar"
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
	
<!-- 编辑 新增 窗口 -->	
	<div class="modal fade" id="add_panel" tabindex="-1" role="dialog" aria-labelledby="editTheme" aria-hidden="true" data-backdrop="static">
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
	        <form id="category_form" class="form-horizontal"   onsubmit="return false;" data-toggle="validator" role="form">
	        	  <input type="hidden" name="id" id="id" value="0">
	        	  
<!--        			  <div class="form-group">
				    <label for="code" class="col-sm-3 control-label">分类编码<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				      <input type="text" name="code" pattern="^[1-9]\d*$"  class="form-control" id="code" placeholder="请输入正整数" required >
				    </div>
				  </div> -->
				  
				  <div class="form-group">
				    <label for="level" class="col-sm-3 control-label"></label>
				    <div class="col-md-8">
				      <input type="radio" name="level"   checked="checked" value="1" > 一级分类
				      &nbsp;&nbsp;&nbsp;&nbsp;
				      <input type="radio" name="level"   value="2"  >二级分类
				    </div>
				  </div>
				  
				  <div class="form-group" id="parent_id_div" style="display:none;">
				    <label for="parent_id" class="col-sm-3 control-label">父分类<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				      <select  name="parentId"  class="form-control" id="parent_id" disabled >
				      </select>
				    </div>
				  </div>
				  
				  
				  <div class="form-group">
				    <label for="name" class="col-sm-3 control-label">分类名称<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				      <input type="text" name="name"  class="form-control" id="name" required >
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="status" class="col-sm-3 control-label">状态(Andoird)<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				      <select id="status" name="status" class="form-control" required>
				       		<option value="0">不生效</option>
				       		<option value="1">生效</option>
				       </select>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="ios_status" class="col-sm-3 control-label">状态(IOS)<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				       <select id="ios_status" name="iosStatus" class="form-control" required>
				       		<option value="0">不生效</option>
				       		<option value="1">生效</option>
				       </select>
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

<!-- 底部 -->
<jsp:include page="../common/footer.jsp"/>
	

<script type="text/javascript">
	function switchOn(){
		return ['<div class="switch switch-mini">',
		        '<input class="switch" type="checkbox" checked />',
				'</div>'
				].join('');
	}
	function switchOff(){
		return [' <input class="switch" type="checkbox" />'].join('');
	}
	function getSwitch(value, row, index){
		return value? switchOn():switchOff();
	}

	$('#table').bootstrapTable({
	    url: 'findCategoryList',
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
	        field: 'id',
	        title: 'ID'
	    }, {
	    	width:100,
	    	visible:false,
	    	align:'center',
	        field: 'code',
	        title: '分类编码'
	    }, {
	    	width:60,
	    	align:'center',
	        field: 'parentId',
	        title: '父类ID',
	        formatter:function(value){
	        	return value===1? "":value; 
	        }
	    },{
	    	width:100,
	    	align:'center',	    	
	        field: 'name',
	        title: '分类名称'
	    }, {
	    	width:100,
	    	align:'center',
	        field: 'status',
	        title: '状态(Android)',
	        formatter:getSwitch,
	        events:{
	        	'click .switch': function (e, value, row, index) {
	        		updateStatus(value,row.id,"android");
	        	}
	        }
	    }, {
	    	width:100,
	    	align:'center',
	        field: 'iosStatus',
	        title: '状态(IOS)',
	        formatter:function(value,row,index){
				return value? switchOn():switchOff();
	        },
	        events:{
	        	'click .switch': function (e, value, row, index) {
	        		updateStatus(value,row.id,"ios");
	        	}
	        }
	    }, {
	        field: 'createTime',
	        width:120,
	        align:'center',
	        title: '创建时间',
	        formatter:function(value,row,index){
				return new Date(value).format("yyyy-MM-dd hh:mm:ss");
	        }
	    }, {
	    	width:120,
	    	align:'center',
	    	visible:false,
	        field: 'updateTime',
	        title: '更新时间',
	        formatter:function(value,row,index){
				return value? new Date(value).format("yyyy-MM-dd hh:mm:ss"):"";
	        }
	    },
	    {
	    	width:80,
	    	align:'center',
	        field: '',
	        title: '操作',
	        align: 'center',
	        events: {
	            'click .edit': function (e, value, row, index) {
// 	            	 getParentCategory();
	            	if(row.parentId ==1){
	            		$("#category_form input[name='level']").get(0).checked=true;
	            		$("#parent_id_div").hide();
	    				$("#parent_id").attr("disabled","disabled");
	            	}else{
	            		$("#category_form input[name='level']").get(1).checked=true;
	            		$("#parent_id_div").show();
	    				$("#parent_id").removeAttr("disabled");
	    				$("#parent_id").val(row.parentId);
	            	}
					$("#id").val(row.id);
					//$("#code").val(row.code);
					$("#name").val(row.name);
					$("#status").val(row.status);
					$("#ios_status").val(row.iosStatus);
					$("#level").val(row.level);
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
	    return [
	        '<a class="edit" href="javascript:void(0)" title="编辑">',
	        '<i class="glyphicon glyphicon-edit" data-toggle="modal" data-target="#add_panel"></i>',
	        '</a>  '
	    ].join('');
	}
	
	function updateStatus(status,id,os){
		$.ajax({
			url : "changeStatus",
			dataType : 'json',
			data:{'id':id,'status':status,'os':os},
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
	
	function updateOrSave(){
// 		if( !$("#name").val() || !$("#code").val() || !$("#status").val() || !$("#ios_status").val() ){
// 			return false;
// 		}
		var hasError = $("#category_form").validator('validate').has('.has-error').length;
		if(!hasError){
			
			$("#category_form").ajaxSubmit({
		        url:"save",
		        dataType:"json",
		        type:"POST",
		        success: function(data){
		        	if(data.error){
		        		alert(data.error);
		        		return false;
		        	}
					$("#add_panel").modal('hide');
		            alert("保存成功！");
		            $("#category_form").resetForm();
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
	
	$("#add").on("click",function(){
		$("#category_form").resetForm();
		
	});
	
	getParentCategory();
	function getParentCategory(){
		$.ajax({
			url :"findCategoryList",
			data:JSON.stringify({"parentId" : "1"}),
			contentType : 'application/json',
			dataType :'json',
			type : 'post',
			success : function(data){
				var options = "";
				var parent = $("#parent_id");
				parent.empty();
				for(var i=0; i<data.rows.length; i++){
					options +="<option value='"+data.rows[i].id+"'>"+data.rows[i].name+"</option>";
				}
				parent.append(options);
			},
			error: function(xhr){
	        	if( xhr.status == "200"){ // 兼容调试时301/302重定向导致触发error的问题
					location.href = "/rainbow/login";
				}
	            alert("未查询到数据！");
	        }
		});
	}
	
	$("#category_form input[name='level']").on("click",function(e){
		if(e.target.value==1){
			$("#parent_id_div").hide();
			$("#parent_id").attr("disabled","disabled");
		}else{
			$("#parent_id_div").show();
			$("#parent_id").removeAttr("disabled");
		}
	});
	
	
	
</script>