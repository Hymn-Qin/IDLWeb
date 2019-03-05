<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.zzdc.iotloc.bean.UserInfo"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String fileControl=(String)request.getSession().getAttribute("fileControl");
	String loginType=(String)request.getSession().getAttribute("loginType");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv=content-type content="text/html; charset=utf-8" />
<link href="<%=path%>/css/admin.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">

//jquery start     
$(document).ready(
function(){

});
function checkLogin(urlParam) {
var url = urlParam; 
var params = {     
}
//使用$.post方式         
             $.post(     
                 url,        //服务器要接受的url
                 params,
                 function callback(data){ //服务器返回后执行的函数 参数 data保存的就是服务器发送到客户端的数据
                     var member = eval("("+data+")");    //包数据解析为json 格式
                     if(member.random=="yes"){
                     $('#loginType').html("工廠文件交換模式&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"#\" style=\"color: #fff;\" onclick=checkLogin('checkLogin.action?loginType=foxconn')>點擊切換為個人網盤模式</a>").fadeIn();
                     alert("您當前已經切換為工廠文件交換模式!\n您上傳的文件可以在特定群組可見!");
                     self.window.parent.frames["right"].location.reload();
                     }else{
                     $('#loginType').html("個人網盤模式&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"#\" style=\"color: #fff;\" onclick=checkLogin('checkLogin.action?loginType=factory')>點擊切換為工廠文件交換模式</a>").fadeIn();
                     alert("您當前已經切換為個人網盤模式!\n您上傳的文件只有您自己可見!");
                     self.window.parent.frames["right"].location.reload();
                     }
               },
               'json'  //数据传递的类型  json
             );
}
</script>
</head>
<body>
	<table cellspacing=0 cellpadding=0 width="100%"
		background="<%=path%>/img/bg_banner.png" border=0>
		<tr height=56>
			<td width=59%
				style=" color: #fff; padding-top: 5px; font-size:36px">&nbsp;&nbsp;工业互联统一账号管理系统</td>
			<td style=" color: #fff; padding-top: 20px;font-size:18px"  width=18%>當前用戶： ${loginUser.user_name}</td>
                
				<%--<td style="font-weight: bold; color: #fff; padding-top: 20px">
				<span  id="loginType">
				 
				if(loginType!=null&&fileControl==null){
				   out.print("個人網盤模式&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"#\" style=\"color: #fff;\" onclick=checkLogin('checkLogin.action?loginType=factory')>點擊切換為工廠文件交換模式</a>");
				}
				if(loginType!=null&&fileControl!=null){
				   out.print("工廠文件交換模式&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"#\" style=\"color: #fff;\" onclick=checkLogin('logout.action?loginType=foxconn')>點擊切換為個人網盤模式</a>");
				}
				 %> 
				</span>
				</td>--%>
				
				<td style=" color: #fff; padding-top: 20px;font-size:18px"  width=9%>
					<a href='help.jsp' target="_blank" style="color: #fff;">幫助文檔</a>
				</td>
				<td style=" color: #fff; padding-top: 20px;font-size:18px"  width=8%>
					<a href='findrecentissue.action' target="_blank" style="color: #fff;">意見反饋</a>
				</td>
				<td style=" color: #fff; padding-top: 20px;font-size:18px" width=6%><a href="logout.action"
				style="color: #fff;"
				onclick="if (confirm('确定要退出吗？')) return true; else return false;"
				target="_parent">退出系统</a>
				</td>
		</tr>
	</table>
	<table cellspacing=0 cellpadding=0 width="100%" border=0>
		<tr bgcolor=#1c5db6 height=4>
			<td></td>
		</tr>
	</table>
</body>
</html>