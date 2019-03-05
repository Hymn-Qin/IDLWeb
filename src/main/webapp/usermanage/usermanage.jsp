<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@page import="com.opensymphony.xwork2.util.*"%>
<%@page import="com.zzdc.iotloc.bean.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
ValueStack vs = (ValueStack) request.getAttribute("struts.valueStack");
List<AdminInfo> adminList=  (List<AdminInfo>)vs.findValue("adminList");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>This is adduser jsp</title>

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
<script language='javascript'>
	$(document).ready(function (){
//button 的樣式           
$("#confirm").button();
$("#back").button();
$("#add").button(); 
$("#add").click(function(){$("#form1").attr("action","showAddAdminWeb.action").submit();});
	  });
 
function check_del() {
    var msg = "真的要刪除嗎？\n\n請確認！";
    if (confirm(msg)){
        return true;
     }else{
        return false;
     }
}

 </script>
<style type="text/css">
TABLE.colorTest {
	border-top: 1px solid #659ACC;
	border-left: 1px solid #659ACC;
	border-right: 0px;
	border-bottom: 0px;
}

.colorTest TD {
	border-top: 1px solid #FFFFFF;
	border-left: 1px solid #FFFFFF;
	border-right: 1px solid #659ACC;
	border-bottom: 1px solid #659ACC;
}

</style>
</head>

<body style=" background:#eef2fb;">
	<form action="usermanagebyuser.action" method="post" id="form1">
		<table width=100% border="0" cellspacing=0 cellpadding=0 width="100%">
			<tr height=30>

				<td colspan="6" background=./img/title_bg1.jpg>當前位置>管理员管理</td>
			</tr>
			<tr>
				<td bgcolor=#b1ceef height=1 colspan="5"></td>
			</tr>
			<tr height=28>
				<td align="left" background=./img/title_bg1.jpg>&nbsp;&nbsp;工號&nbsp;:&nbsp;<input
					type="text" id="userid" name="admin.user_foxconn_id"></td>
				<td align="left" background=./img/title_bg1.jpg>&nbsp;&nbsp;姓名&nbsp;:&nbsp;<input
					type="text" id="username" name="admin.user_name"></td>
				<td align="center" background=./img/title_bg1.jpg><input
					type="submit" value="確定" name="btn1" id="confirm"
					style="font-size:11px;font-family:Arial"></td>
				<td align="center" background=./img/title_bg1.jpg><input
					type="submit" value="新增" name="btn1" id="add"
					style="font-size:11px;font-family:Arial">
				</td>
				<!-- <td align="center" background=./img/title_bg1.jpg><input
					type="reset" value="返回" name="btn1" id="back"
					style="font-size:11px;font-family:Arial"
					onclick="window.location.href='javascript:history.back(-1);'">
				</td> -->
			</tr>
			<tr>

			</tr>
		</table>
		<p>
		<h3 class="control-wrapper">${requestScope.logError}</h3>
		</p>


	</form>
	<!-- <HR width="100%" color=#296FC4 SIZE=10 /> -->

	<table cellspacing=0 cellpadding=0 width="99%" align=center border=1
		class="colorTest" id="tab">
		<tr class=tr_t>
			<td>序號</td>
			<td>工號</td>
			<td>姓名</td>
			<td>郵箱</td>
			<td>創建時間</td>
			<td>用戶權限</td>
			<td colspan="3" align="center">操作</td>
		</tr>


		<%
			int i = 0;
			if (adminList != null && adminList.size() > 0) {
				Iterator<AdminInfo> itor = adminList.iterator();
				while (itor.hasNext()) {
					AdminInfo u = (AdminInfo) itor.next();
					if (i % 2 == 0) {
						out.println("<tr class=tr bgcolor=#FFFFFF onMouseOver=mouseOver(this,'#AFD3FC'); onMouseOut=mouseOut(this,'#FFFFFF');>");
					} else {
						out.println("<tr class=tr bgcolor=#EAF2F5 onMouseOver=mouseOver(this,'#AFD3FC'); onMouseOut=mouseOut(this,'#EAF2F5');>");
					}
					String status = "";
					String usercontrol = "";
					String del = "<a onclick='javascript: return check_del()'   class=menuparent href='deleteuser.action?admin.user_foxconn_id="
							+ u.getUser_foxconn_id() + "'/>刪除用戶</a>";
					String upd = "<a   class=menuparent href='findSeletedUserInfo.action?admin.user_foxconn_id="
							+ u.getUser_foxconn_id() + "'/>修改用戶</a>";
							String editPass="<a   class=menuparent href='showUpdatePassWord.action?admin.user_foxconn_id="
							+ u.getUser_foxconn_id() + "'/>修改密码</a>";
/* 					if ("Y".equals(u.getUser_flag())) {
						status = "可用";
					} else {
						status = "不可用";
					} */
 					if ("A".equals(u.getUser_role())) {
						usercontrol = "系統管理員";
					}
					if ("B".equals(u.getUser_role())) {
						usercontrol = "一般用户";
					} 
					out.println("<td height='40px'>&nbsp;" + (i + 1) + "</td>");
					out.println("<td>&nbsp;" + u.getUser_foxconn_id() + "</td>");
					out.println("<td>&nbsp;" + u.getUser_name() + "</td>");
					out.println("<td>&nbsp;" + u.getUser_mail() + "</td>");
					out.println("<td>&nbsp;" + u.getCreate_date() + "</td>");
					out.println("<td>&nbsp;" + usercontrol + "</td>");
					out.println("<td>&nbsp;" + editPass + "</td>");
					out.println("<td>&nbsp;" + del + "</td>");
					out.println("<td>&nbsp;" + upd + "</td>");
					i++;
				}
			}
		%>

	</table>
<input id="pagetotal" type="hidden" value="<s:property value="pageInfo.total"/>">
	<input id="pagenext" type="hidden" value="<s:property value="%{pageInfo.pageNum+1}"/>">
	<input id="pagebefore" type="hidden" value="<s:property value="%{pageInfo.pageNum-1}"/>">
	<jsp:include page="../pageUtil.jsp" flush="true">     
     <jsp:param name="pageInfo" value="pageInfo"/> 
</jsp:include> 
	
	
</body>
<script language='javascript'>
	$(document).ready(function (){
var pagetotal=document.getElementById("pagetotal").value;
var pagenext=document.getElementById("pagenext").value;
var pagebefore=document.getElementById("pagebefore").value;
var fristpage=1;
$("#lastPage").attr("href","usermanage.action?pageInfo.nextPage="+pagetotal+"");
$("#nextPage").attr("href","usermanage.action?pageInfo.nextPage="+pagenext+"");
$("#prePage").attr("href","usermanage.action?pageInfo.nextPage="+pagebefore+"");
$("#firstPage").attr("href","usermanage.action?pageInfo.pageNum="+fristpage+"");
	  });
 </script>
</html>
