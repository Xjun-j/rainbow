// 对Date的扩展，将 Date 转化为指定格式的String 
// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符， 
// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) 
// 用法： 
// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423 
// (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18 
Date.prototype.format = function(fmt) 
{ 
  var o = { 
    "M+" : this.getMonth()+1,                 //月份 
    "d+" : this.getDate(),                    //日 
    "h+" : this.getHours(),                   //小时 
    "m+" : this.getMinutes(),                 //分 
    "s+" : this.getSeconds(),                 //秒 
    "q+" : Math.floor((this.getMonth()+3)/3), //季度 
    "S"  : this.getMilliseconds()             //毫秒 
  }; 
  if(/(y+)/.test(fmt)) 
    fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
  for(var k in o) 
    if(new RegExp("("+ k +")").test(fmt)) 
  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length))); 
  return fmt; 
}


function getYesterdayStr() {
	var date = new Date();
	date = new Date(date.getTime() - 24 * 60 * 60 * 1000);
	var month = date.getMonth() + 1;
	month = month < 10 ? "0" + month : month;
	var day = date.getDate();// 默认显示昨天
	day = day < 10 ? "0" + day : day;
	return date.getFullYear() + "-" + month + "-" + day;
}
/**
 * 根据毫秒数得到 yyyy-mm-dd格式的日期字符串
 * @param mills
 * @returns {String}
 */
function getYmdStrByMills(mills){
	date = new Date(mills);
	var month = date.getMonth() + 1;
	month = month < 10 ? "0" + month : month;
	var day = date.getDate();// 默认显示昨天
	day = day < 10 ? "0" + day : day;
	return date.getFullYear() + "-" + month + "-" + day;
}

/*获得 数字 每三个字符用逗号隔开的字符串  ***,***,*** */
function getNumStr(nStr) {
	 nStr += '';
	 var x = nStr.split('.');
	 var x1 = x[0];
	 var x2 = x.length > 1 ? '.' + x[1] : '';
	 var rgx = /(\d+)(\d{3})/;
	 while (rgx.test(x1)) {
	  x1 = x1.replace(rgx, '$1' + ',' + '$2');
	 }
	 return x1 + x2;
}