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
List<PhoneStatusInfo> listPhone=  (List<PhoneStatusInfo>)vs.findValue("listPhone");
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
	<form action="searchPhoneStatusByUser.action" method="post" id="form1">
		<table width=100% border="0" cellspacing=0 cellpadding=0 width="100%">
			<tr height=30>

				<td colspan="6" background=./img/title_bg1.jpg>當前位置>借机追踪</td>
			</tr>
			<tr>
				<td bgcolor=#b1ceef height=1 colspan="5"></td>
			</tr>
			<tr height=28>
				<td align="left" background=./img/title_bg1.jpg>&nbsp;&nbsp;工号&nbsp;:&nbsp;<input
					type="text" id="userid" name="user.usernum"></td>
				<td align="center" background=./img/title_bg1.jpg><input
					type="submit" value="確定" name="btn1" id="confirm"
					style="font-size:11px;font-family:Arial"></td>
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
			<td>借出人</td>
			<td>工号</td>
			<td>SN</td>
 			<td>借出時間</td>
			<td>还机时间</td>
		</tr>


		<%
			int i = 0;
			if (listPhone != null && listPhone.size() > 0) {
				Iterator<PhoneStatusInfo> itor = listPhone.iterator();
				while (itor.hasNext()) {
					PhoneStatusInfo u = (PhoneStatusInfo) itor.next();
					if (i % 2 == 0) {
						out.println("<tr class=tr bgcolor=#FFFFFF onMouseOver=mouseOver(this,'#AFD3FC'); onMouseOut=mouseOut(this,'#FFFFFF');>");
					} else {
						out.println("<tr class=tr bgcolor=#EAF2F5 onMouseOver=mouseOver(this,'#AFD3FC'); onMouseOut=mouseOut(this,'#EAF2F5');>");
					}
					String borrow_user = "未借出";
					String borrow_user_id = "未借出";
					String cabine_id = "借出";
					String box_id = "借出";
					String fault_type = "正常";
					String del = "<a onclick='javascript: return check_del()'   class=menuparent href='updateuser.action?use.user_id="
							+ u.getSn() + "'/>刪除手机</a>";
					String upd = "<a   class=menuparent href='findUser.action?use.user_id="
							+ u.getSn() + "'/>修改手机状态</a>";
					if(u.getBorrowInfo().getBorrow_time()!=null&&u.getBorrowInfo().getReturn_time()==null){
						borrow_user = u.getBorrowInfo().getUser().getName();
						borrow_user_id = u.getBorrowInfo().getUser_id();
					}else{
						cabine_id = u.getCabinet().getCabinet_id();
						box_id = u.getCabinet().getBox_id();
						fault_type = u.getCabinet().getFault_type();
					}
					 
					out.println("<td height='40px'>&nbsp;" + (i + 1) + "</td>");
					out.println("<td>&nbsp;" + u.getBorrowInfo().getUser().getName() + "</td>");
					out.println("<td>&nbsp;" + u.getBorrowInfo().getUser().getUsernum() + "</td>");
					out.println("<td>&nbsp;" + u.getSn() + "</td>");
					out.println("<td>&nbsp;" + u.getBorrowInfo().getBorrow_time() + "</td>");
					out.println("<td>&nbsp;" + u.getBorrowInfo().getReturn_time() + "</td>");
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
$("#lastPage").attr("href","showPhoneStatusByUser.action?pageInfo.nextPage="+pagetotal+"");
$("#nextPage").attr("href","showPhoneStatusByUser.action?pageInfo.nextPage="+pagenext+"");
$("#prePage").attr("href","showPhoneStatusByUser.action?pageInfo.nextPage="+pagebefore+"");
$("#firstPage").attr("href","showPhoneStatusByUser.action?pageInfo.pageNum="+fristpage+"");
	  });
 </script>
</html>
