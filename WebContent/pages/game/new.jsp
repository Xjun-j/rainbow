<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 编辑窗口 -->	
	<div class="modal fade" id="edit_panel" tabindex="-1" role="dialog" aria-labelledby="editTheme" aria-hidden="true" data-backdrop="static">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <sapn class="modal-title"  style="font-size:16px;" ><b><span class="glyphicon glyphicon-edit"></span>&nbsp;&nbsp; 编 辑</b></span>
	      </div>
	      <div class="modal-body">
	        <form id="edit_form" class="form-horizontal"  onsubmit="return false;" data-toggle="validator" role="form">
	        	  <input type="hidden" name="id" id="v_id">
	        	  <input type="hidden" name="pkgSize" id="v_pkg_size">
	        	  <input type="hidden" name="os" id="v_os">
	        	  <input type="hidden" name="gameUrl" id="v_url">
       			  <div class="form-group">
				    <label for="v_title" class="col-md-2 control-label">名称<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				      <input type="text" name="title"  class="form-control" id="v_title" required>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="v_motto"  class="col-md-2 control-label" >简要描述<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				      <textarea  name="motto"   class="form-control" rows="1" id="v_motto" required></textarea>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="v_intro"  class="col-md-2 control-label" >描述</label>
				    <div class="col-md-8">
				      <textarea name="introduction"   class="form-control" rows="2" id="v_intro" ></textarea>
				    </div>
				  </div>
<!-- 				  <div class="form-group"> -->
<!-- 				    <label for="v_url"  class="col-md-2 control-label" >下载链接</label> -->
<!-- 				    <div class="col-md-8"> -->
<!-- 				      <input name="gameUrl"   class="form-control" rows="2" id="v_url" > -->
<!-- 				    </div> -->
<!-- 				  </div> -->
				  
				  <div class="form-group">
				    <label for="v_category" class="col-md-2 control-label">分类<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				       <select type="text" name="category" class="form-control" id="v_category" required>
				      		<option value="1">大型游戏</option>
				      		<option value="2">吐血推荐</option>
				      		<option value="4">最新更新</option>
				      		<option value="8">福利游戏</option>
				      		<option value="16">其他</option>
				      </select>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="v_tag" class="col-md-2 control-label">标签</span></label>
				    <div class="col-md-8">
				      <input type="text" name="tag"  class="form-control" id="v_tag" >
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="v_plat" class="col-md-2 control-label">安装条件</label>
				    <div class="col-md-8">
				      <input type="text" name="plat"  class="form-control" id="v_plat" >
				    </div>
				  </div>
				  
<!-- 				  <div class="form-group"> -->
<!-- 				    <label for="v_pkg_size" class="col-md-2 control-label">APK大小</label> -->
<!-- 				    <div class="col-md-8"> -->
<!-- 				      <input type="text" name="pkgSize"  class="form-control" id="v_pkg_size" > -->
<!-- 				    </div> -->
<!-- 				  </div> -->
				  
				  <div class="form-group">
				    <label for="v_device"  class="col-md-2 control-label" >所需设备</label>
				    <div class="col-md-8">
				      <input type="text" name="device"  class="form-control" id="v_device" >
				    </div>
				  </div>

				  <div class="form-group">
				    <label for="v_operate"  class="col-md-2 control-label" >操控方式</label>
				    <div class="col-md-8">
				      <input type="text" name="operate"  class="form-control" id="v_operate" >
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="v_feature"  class="col-md-2 control-label" >特色</label>
				    <div class="col-md-8">
				      <input type="text" name="feature"  class="form-control" id="v_feature" >
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="v_guide"  class="col-md-2 control-label" >攻略</label>
				    <div class="col-md-8">
				      <textarea type="text" name="guide"  class="form-control" id="v_guide" ></textarea>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="v_update_date"  class="col-md-2 control-label" >更新时间</label>
				    <div class="col-md-8">
				      <input type="text" name="updateDate"  class="form-control" id="v_update_date" >
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="v_author"  class="col-md-2 control-label" >作者</label>
				    <div class="col-md-8">
				      <input type="text" name="author"  class="form-control" id="v_author" >
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="v_version"  class="col-md-2 control-label" >版本</label>
				    <div class="col-md-8">
				      <input type="text" name="version"  class="form-control" id="v_version" >
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="a_pkg_name"  class="col-md-2 control-label" >包名</label>
				    <div class="col-md-8">
				      <input type="text" name="pkgName"  class="form-control" id="a_pkg_name" >
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="v_downloaders"  class="col-md-2 control-label" >下载次数</label>
				    <div class="col-md-8">
				      <input type="text" name="downloaders"  class="form-control" id="v_downloaders" >
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-md-offset-2 col-md-8">
				      <button id="update_submit" type="submit" onclick="updateGame()" class="btn btn-info" style="width:100%;">&nbsp;保&nbsp;&nbsp;存&nbsp;</button>
				      <input id="btn_reset" type="reset" style="display:none;" /> 
				    </div>
			  	</div>
	        </form>
	      </div>
<!-- 	      <div class="modal-footer"> -->
<!-- 	        <button type="button" class="btn btn-default" data-dismiss="关闭">Close</button> -->
<!-- 	        <button type="button" class="btn btn-success">上传</button> -->
<!-- 	      </div> -->
	    </div>
	  </div>
	</div>
<!-- 编辑结束 -->

<!-- 新增窗口 -->	
	<div class="modal fade" id="add_panel" tabindex="-1" role="dialog" aria-labelledby="editTheme" aria-hidden="true" data-backdrop="static">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header" style="background-color:#5bc0de">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <sapn class="modal-title"  style="font-size:16px;" ><b><span class="glyphicon glyphicon-edit"></span>&nbsp;&nbsp; 新增游戏</b></span>
	      </div>
	      <div class="modal-body">
	        
	        <form id="add_form" class="form-horizontal"  onsubmit="return false;" data-toggle="validator" role="form" >
	        	 <input type="hidden" name="id"  class="form-control" id="a_id" >
       			  <div class="form-group">
				    <label for="a_title" class="col-md-2 control-label">名称<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				      <input type="text" name="title"  class="form-control" id="a_title" required>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="a_motto"  class="col-md-2 control-label" >简要描述<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				      <textarea  name="motto"   class="form-control" rows="1" id="a_motto" required></textarea>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="a_intro"  class="col-md-2 control-label">描述</label>
				    <div class="col-md-8">
				      <textarea name="introduction"   class="form-control" rows="2" id="a_intro" ></textarea>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="a_category" class="col-md-2 control-label">分类<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				       <select type="text" name="category" class="form-control" id="a_category" required>
				      		<option value="1">大型游戏</option>
				      		<option value="2">吐血推荐</option>
				      		<option value="4">最新更新</option>
				      		<option value="8">福利游戏</option>
				      		<option value="16">其他</option>
				      </select>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="a_tag" class="col-md-2 control-label">标签</label>
				    <div class="col-md-8">
				      <input type="text" name="tag"  class="form-control" id="a_tag" >
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="a_os" class="col-md-2 control-label">操作系统<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				       <select type="text" name="os" class="form-control" id="a_os" required>
				      		<option value="android">android</option>
				      		<option value="ios">ios</option>
				      </select>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="a_plat" class="col-md-2 control-label">安装条件</label>
				    <div class="col-md-8">
				      <input type="text" name="plat"  class="form-control" id="a_plat" >
				    </div>
				  </div>
				  
<!-- 				  <div class="form-group"> -->
<!-- 				    <label for="a_pkg_size" class="col-md-2 control-label">APK大小</label> -->
<!-- 				    <div class="col-md-8"> -->
<!-- 				      <input type="text" name="pkgSize"  class="form-control" id="a_pkg_size" > -->
<!-- 				    </div> -->
<!-- 				  </div> -->
				  
				  <div class="form-group">
				    <label for="a_device"  class="col-md-2 control-label" >所需设备</label>
				    <div class="col-md-8">
				      <input type="text" name="device"  class="form-control" id="a_device" >
				    </div>
				  </div>

				  <div class="form-group">
				    <label for="a_operate"  class="col-md-2 control-label" >操控方式</label>
				    <div class="col-md-8">
				      <input type="text" name="operate"  class="form-control" id="a_operate" >
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="a_feature"  class="col-md-2 control-label" >特色</label>
				    <div class="col-md-8">
				      <input type="text" name="feature"  class="form-control" id="a_feature" >
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="a_guide"  class="col-md-2 control-label" >攻略</label>
				    <div class="col-md-8">
				      <textarea type="text" name="guide"  class="form-control" id="a_guide" ></textarea>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="a_update_date"  class="col-md-2 control-label" >更新时间</label>
				    <div class="col-md-8">
				      <input type="text" name="updateDate"  class="form-control" id="a_update_date" >
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="a_author"  class="col-md-2 control-label" >作者</label>
				    <div class="col-md-8">
				      <input type="text" name="author"  class="form-control" id="a_author" >
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="a_version"  class="col-md-2 control-label" >版本</label>
				    <div class="col-md-8">
				      <input type="text" name="version"  class="form-control" id="a_version" >
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="a_pkg_name"  class="col-md-2 control-label" >包名</label>
				    <div class="col-md-8">
				      <input type="text" name="pkgName"  class="form-control" id="a_pkg_name" >
				    </div>
				  </div>
				  
				  
   				  <div id="g_ios_url" class="form-group" style="display:none;"  >
				    <label for="g_ios_filepath"  class="col-md-2 control-label" >安装链接<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				      <input type="text" name="gameUrl" id="g_ios_filepath"   class="form-control"  disabled="disabled">
				    </div>
				  </div>
				  
   				  <div id="a_pkgsize_div" class="form-group" style="display:none;"  >
				    <label for="a_ios_pkgsize"  class="col-md-2 control-label" >包大小<span class="redstar">&nbsp;*</span></label>
				    <div class="col-md-8">
				      <input type="text" name="pkgSize" id="a_ios_pkgsize"   class="form-control"  disabled="disabled">
				    </div>
				  </div>
				  
			      <input id="btn_add_reset" type="reset" style="display:none;" /> 
			      <input id="g_img_filepath" name="imgAddr" style="display:none;" /> 
			      <input id="g_sh_filepath0" name="screenshotAddrs"  style="display:none;" /> 
			      <input id="g_sh_filepath1" name="screenshotAddrs" style="display:none;" /> 
			      <input id="g_sh_filepath2" name="screenshotAddrs" style="display:none;" /> 
			      <input id="g_app_filepath" name="gameUrl" style="display:none;" /> 
			      <input id="a_pkg_size"  name="pkgSize"  class="form-control" style="display:none;" >
			      
	        </form>
	        
	        <!-- APK上传 -->
		      <form id="g_app_form" enctype="multipart/form-data" method="post"   class="form-horizontal" data-toggle="validator" role="form" >
		      		 <div class="form-group">
		      		 	<label for="g_app" class="col-md-2 control-label">安装包<span class="redstar">&nbsp;*</span></label>
					    <div class="col-md-8">
					    	<input type="file" id="g_app" name="file"  class="form-control">
					    	 <div class="progress" style="margin-bottom:0px;margin-top:1px;height:10px;display:none;">
								  <div id="g_app_progress" class="progress-bar progress-bar-info  progress-bar-striped active" role="progressbar" aria-valuenow="0"  aria-valuemin="0" aria-valuemax="100" style="min-width:2em;width:2%">
								  </div>
							</div>
					    </div>
					    <div class="col-md-2"> <input type="submit" value="上传" > </div>
					  </div>
			  </form>
	        
	         <!-- 缩略图上传 -->
		      <form id="g_img_form" enctype="multipart/form-data" method="post"   class="form-horizontal" data-toggle="validator" role="form" >
		      		 <div class="form-group">
		      		 	<label for="g_img" class="col-md-2 control-label">缩略图<span class="redstar">&nbsp;*</span></label>
					    <div class="col-md-8">
					    	<input type="file" id="g_img" name="img"  class="form-control imgfile">
					    	<div class="progress" style="margin-bottom:0px;margin-top:1px;height:10px;display:none;">
							  <div id="g_img_progress" class="progress-bar progress-bar-info  progress-bar-striped active" role="progressbar" aria-valuenow="0"  aria-valuemin="0" aria-valuemax="100" style="min-width:2em;width:2%">
							  </div>
							</div>
					    </div>
					    <div class="col-md-2"> <input type="submit" value="上传" > </div>
					  </div>
			  </form>
			  
			  <!--游戏截图上传 -->
			  <form id="g_img_screenshots" enctype="multipart/form-data" method="post"   class="form-horizontal"  data-toggle="validator" role="form">
				    <div class="form-group">
					    <label for="g_screenshot1" class="col-md-2 control-label">截图<span class="redstar">&nbsp;*</span></label>
					    <div class="col-md-8">
						    <input type="file" id="g_screenshot1" name="screenshots"  class="form-control imgfile">
						    <input type="file" id="g_screenshot2" name="screenshots"  class="form-control imgfile">
						    <input type="file" id="g_screenshot3" name="screenshots"  class="form-control imgfile">
						    <div class="progress" style="margin-bottom:0px;margin-top:1px;height:10px;display:none;">
								  <div id="g_screenshot_progress" class="progress-bar progress-bar-info  progress-bar-striped active" role="progressbar" aria-valuenow="0"  aria-valuemin="0" aria-valuemax="100" style="min-width:2em;width:2%">
								  </div>
							</div>
					    </div>
					    <div class="col-md-2"> <br><br><input type="submit" value="上传" > </div>
				  </div>
			  </form>
	        
	        <div class="row">
			    <div class="col-md-offset-2 col-md-8">
			      <button  onclick="addGame()" class="btn btn-info" style="width:100%;">&nbsp;保&nbsp;&nbsp;存&nbsp;</button>
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
<!-- 新增结束 -->

<!-- 删除modal start********************************************************** -->
	<div class="modal fade" id="delete_panel" tabindex="-1" role="dialog" aria-labelledby="deleteDesigner" aria-hidden="true" data-backdrop="static">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="deleteDesigner"><span class="glyphicon glyphicon-star"></span> &nbsp;提示</h4>
	      </div>
	      <div class="modal-body">
	     		<p class="text-center" style="font-size:18px;"> <span class="glyphicon glyphicon-exclamation-sign" style="color:red"></span>&nbsp; &nbsp;确定删除 ? </p>
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
