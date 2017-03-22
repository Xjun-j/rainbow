<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 头部 -->
<jsp:include page="/pages/common/header.jsp"  />
	<!-- 中间 -->
	<div class="container" style="margin-bottom:30px;padding-top:60px;" >
		<ol class="breadcrumb">
		  <li><span class="glyphicon glyphicon-home"></span></li>
		  <li id="current_menu">防伪码</li>
		  <li >文件下载</li>
		</ol>
		

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
	<!-- 删除modal end ********************************************************** -->
	
	
<!-- 底部 -->
<jsp:include page="../common/footer.jsp"/>

<script type="text/javascript">

$('#table').bootstrapTable({
    url: contextPath+'/product/findSecureNoFiles',
//     height:getHeight(),
//     showToggle:true,
//     cardView:true,
// 	search:true,
// 	searchOnEnterKey:true,
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
        field: 'modelName',
        align:'center',
        width:100,
        title: '产品型号'
    }, {
        field: 'createTime',
        title: '创建日期',
        align:'center',
        width:110,
        formatter: function(value,row,index){
        	return new Date(value).format("yyyy-MM-dd hh:mm:ss");
        }
    }, {
        field: 'fileUrl',
        align:'center',
        width:80,
        title: '下载链接',
        formatter:function(value,row,index){
        	return "<a href='"+value+"'>下载文件</a>";
        }
    }
    ]
});

function getHeight() {
    return $(window).height() - 150;
}




</script>
