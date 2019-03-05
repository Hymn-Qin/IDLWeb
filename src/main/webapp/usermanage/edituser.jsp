<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@page import="com.opensymphony.xwork2.util.*"%>
<%@page import="com.zzdc.iotloc.bean.*"%>
<%@page import="com.zzdc.iotloc.util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
ValueStack vs = (ValueStack) request.getAttribute("struts.valueStack");  
AdminInfo userinfo=(AdminInfo)vs.findValue("admin");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>This is adduser.jsp</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="<%=path%>/css/admin.css" type="text/css" rel="stylesheet" />
<link href="<%=path%>/css/jonathan.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="<%=path%>/js/newImage.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
<link type="text/css"
	href="<%=path%>/css/cupertino_skyBule/jquery-ui-1.8.20.custom.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="<%=path%>/js/jquery-ui-1.8.20.custom.min.js"></script>

<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	$(document).ready(function() {
		//button 的樣式           
		$("#reset").button();
		$("#confirm1").button();
		$("#confirm").button();
		$("#back").button();
		$("#add").button();
	});

	function check_null() {
		var loginname = document.getElementById("loginname").value;
		var ln = loginname.replace(/(^\s*)|(\s*$)/g, "");
		var username = document.getElementById("username").value;
		var un = username.replace(/(^\s*)|(\s*$)/g, "");
		/* var loginpass = document.getElementById("loginpass").value;
		var lp = loginpass.replace(/(^\s*)|(\s*$)/g, "");
		var rpass = document.getElementById("rpass").value;
		var rp = rpass.replace(/(^\s*)|(\s*$)/g, ""); */
		if (ln == null || ln == "") {
			alert("請輸入登錄名！");
			return false;
		}
		if (un == null || un == "") {
			alert("請輸入用戶名！");
			return false;
		}
		/* if (lp == null || lp == "") {
			alert("請輸入密碼！");
			return false;
		}
		if (rp == null || rp == "") {
			alert("請確認密碼！");
			return false;
		}
		if (rp != lp) {
			alert("确认密码与密码输入不一致!");
			return false;
		}  */else {
			return true;
		}
	}
</script>
</head>

<body>
	<!--  <HR width="100%" color=#296FC4 SIZE=10 />-->
	<div align="center">
		<form name="modifyuserform" action="modifyUserInfo.action" method="post">
			<table width="100%" border="0"
				style="margin-left: 20px;margin-top: 20px;">
				<tr>
					<td align="center">登录名：</td>
					<td><input type="text" id="loginname" name="admin.user_foxconn_id" value="<s:property value="admin.user_foxconn_id"/>" readonly="readonly"/>
					<%-- <input type="hidden" id="user_id" name="admin.user_name" value="<s:property value="userinfo.user_name"/>" /> --%>
					</td>
				</tr>
				<tr>
					<td align="center">用户姓名：</td>
					<td><input type="text" id="username" name="admin.user_name" value="<s:property value="admin.user_name"/>" />
					</td>
				</tr>
				<tr>
					<td align="center">邮箱：</td>
					<td><input type="text" id="email" name="admin.user_mail" value="<s:property value="admin.user_mail"/>" />
					</td>
				</tr>
				
				<!-- <tr>
					<td align="center">所属专案：</td>
					<td><table><tr>
					</tr></table></td>
				</tr> -->
				<tr>
					<td align="center">用户权限：</td>
					<td><select name="admin.user_role">
							<option value="A" <%="A".equals(userinfo.getUser_role())?"selected":"" %>>&nbsp;系统管理员</option>
							<option value="B" <%="B".equals(userinfo.getUser_role())?"selected":"" %>>&nbsp;一般用户</option>
					</select></td>
				</tr>
				<tr>
					<td align="center"><input type="submit" id="confirm1"
						value="確認" onclick="javascript: return check_null()">
					</td>

					<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;<input id="reset"
						type="reset" value="重置">
					</td>
				</tr>
			</table>
		</form>

	</div>
</body>
</html>
