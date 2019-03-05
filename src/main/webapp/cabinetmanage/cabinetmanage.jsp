<%@page import="com.alibaba.druid.sql.visitor.functions.If"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@page import="com.opensymphony.xwork2.util.*"%>
<%@page import="com.zzdc.iotloc.bean.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	ValueStack vs = (ValueStack) request.getAttribute("struts.valueStack");
	List<CabinetInfo> al = (List<CabinetInfo>) vs.findValue("cabinetInfo");
	List<CabinetInfo> checkcabinetinfo = (List<CabinetInfo>) vs.findValue("checkCabinetBoxInfo");
	AdminInfo admin = (AdminInfo) request.getSession().getAttribute("loginUser");
	String uname = admin.getUser_foxconn_id();
	//Map m = UserRoleCache.getRoleMap();
	String valueOS = System.getProperty("os.name");
	String upl = request.getParameter("upl");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>機櫃信息</title>

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
<script type="text/javascript">
	$(document).ready(function() {
		//button 的樣式           
		$("#confirm").button();
		$("#back").button();
		$("#add").button();
		$("#add").click(function() {
			$("#form1").attr("action", "showAddUserWeb.action").submit();
		});
	});

	function selectall() {
		for (var i = 0; i < document.getElementsByName("ch").length; i++) {
			document.getElementsByName("ch")[i].checked = document
				.getElementById("cbox").checked;
		}
	}
	/**
	 * 修改前確認
	 * 
	 */
 	function check_cabinetinfo() {
		var incabinetid = document.getElementById("cabinetid").value;
		var inboxid = document.getElementById("boxid").value;
		if (incabinetid == null || incabinetid == "") {
		if (inboxid == null || inboxid == ""){
			alert("請輸入機櫃和機箱ID！");
			return false;
			}else {
			alert("機箱ID不能為空！");
			return false;
			}
		} else {
			return true;
		}
	}
	function check_del() {
		if (confirm("您確定刪除該文件嗎？")) {
			return true;
		} else {
			return false;
		}
	}



	function checkhHtml5() { //判断当前浏览器是否支持html5
		if (typeof (Worker) !== "undefined") {
			return true;
		//alert("支持HTML5");  
		} else {
			return false;
		//alert("不支持HTML5");  
		}
	}
	function checkIE() { //判断当前浏览器是否支持html5
		var browser = navigator.appName;
		if (browser == "Microsoft Internet Explorer") {
			return true;
		} else {
			return false;
		}
	}
</script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
#total {
	width: 100%;
	height: 100%;
}

#copycardid {
	z-index: 999;
}
/*遮罩层*/
#tinybox_1 {
	margin: auto;
	position: absolute;
	width: 800px;
	height: 120px;
	background: #FFFFFF;
	display: none;
	z-index: 15;
	border: 1px solid gray;
	display: none;
	text-align: center;
	padding: 10 px
}

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

.line {
	margin-bottom: 20px;
}
/* 复制提示 */
.copy-tips {
	position: fixed;
	z-index: 14;
	bottom: 50%;
	left: 50%;
	margin: 0 0 -20px -80px;
	background-color: rgba(0, 0, 0, 0.2);
	filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr=#30000000,
		endColorstr=#30000000);
	padding: 6px;
}

.copy-tips-wrap {
	padding: 10px 20px;
	text-align: center;
	border: 1px solid #F4D9A6;
	background-color: #FFFDEE;
	font-size: 14px;
}
</style>
</head>

<body style=" background:#eef2fb;">
	<form action="checkcabinetid.action" method="post" id="form1" onsubmit="return check_cabinetinfo()">
		<table width=100% border="0" cellspacing=0 cellpadding=0 width="100%">
			<tr height=30>

				<td colspan="6" background=./img/title_bg1.jpg>當前位置>機櫃管理</td>
			</tr>
			<tr>
				<td bgcolor=#b1ceef height=1 colspan="5"></td>
			</tr>
			<tr height=28>
				<td align="left" background=./img/title_bg1.jpg>&nbsp;&nbsp;機櫃編號&nbsp;:&nbsp;<input
					type="text" id="cabinetid" name="cabinetBoxInfo.cabinet_id" ></td>
				<td align="left" background=./img/title_bg1.jpg>&nbsp;&nbsp;機箱編號&nbsp;:&nbsp;<input
					type="text" id="boxid" name="cabinetBoxInfo.box_id" ></td>
				<td align="center" background=./img/title_bg1.jpg><input
					type="submit" value="確定" name="btn1" id="confirm"
					style="font-size:11px;font-family:Arial"></td>
				<!-- <td align="center" background=./img/title_bg1.jpg><input
					type="submit" value="新增" name="btn1" id="add"
					style="font-size:11px;font-family:Arial"></td> -->
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
			<td>機櫃編號</td>
			<td>機箱編號</td>
			<td>機箱狀態</td>
			<td>手機狀態</td>
		</tr>


		<%
			int i = 0;
			if (al != null && al.size() > 0) {
				Iterator itor = al.iterator();
				while (itor.hasNext()) {
					CabinetInfo list = (CabinetInfo) itor.next();
					String snNote = "";
					String faultNote = "";
					String[] faultArray = list.getFault_type().split(",");
					//out.println("faultArray = "+faultArray.length);
					snNote = list.getSn();
					//int faultinfo=faultlist.getfault_type();
					if (i % 2 == 0) {
						out.println(
								"<tr class=tr bgcolor=#FFFFFF onMouseOver=mouseOver(this,'#AFD3FC'); onMouseOut=mouseOut(this,'#FFFFFF');>");
					} else {
						out.println(
								"<tr class=tr bgcolor=#EAF2F5 onMouseOver=mouseOver(this,'#AFD3FC'); onMouseOut=mouseOut(this,'#EAF2F5');>");
					}

					out.println("<td height='40px'>&nbsp;" + (i + 1) + "</td>");
					out.println("<td height='40px'>&nbsp;" + list.getCabinet_id() + "</td>");
					out.println("<td height='40px'>&nbsp;" + list.getBox_id() + "</td>");
					if ("".equals(snNote)||snNote==null) {
						snNote = "機箱為空";
						out.println("<td height='40px'>&nbsp;" + snNote + "</td>");
					} else {
						out.println("<td height='40px'>&nbsp;" + snNote + "</td>");
						if(!"".equals(list.getFault_type())) {
							for (int j = 0; j < faultArray.length; j++) {
								if (faultArray[j].trim() != null) {
									switch (faultArray[j].trim()) {
										case "1" :
											faultNote += "手機不關機,";
											break;
										case "2" :
											faultNote += "手機觸屏失靈,";
											break;
										case "3" :
											faultNote += "手機無法連接WIFI,";
											break;
										case "4" :
											faultNote += "手機屏幕破損,";
											break;
										case "5" :
											faultNote += "手機麥克風異常,";
											break;
										case "6" :
											faultNote += "手機按鍵失效,";
											break;
										case "7" :
											faultNote += "手機其他故障,";
											break;
									}
								}
							}
						}else{
							faultNote = "手機完好";
						}
						
					}
					out.println("<td height='40px'>&nbsp;" + faultNote + "</td>");
					out.println("</tr>");
					i++;
				}
			}
		%>

	</table>
	<input id="pagetotal" type="hidden"
		value="<s:property value="pageInfo.total"/>">
	<input id="pagenext" type="hidden"
		value="<s:property value="%{pageInfo.pageNum+1}"/>">
	<input id="pagebefore" type="hidden"
		value="<s:property value="%{pageInfo.pageNum-1}"/>">
	<jsp:include page="../pageUtil.jsp" flush="true">
		<jsp:param name="pageInfo" value="pageInfo" />
	</jsp:include>


</body>
<script language='javascript'>
	$(document).ready(function (){
var pagetotal=document.getElementById("pagetotal").value;
var pagenext=document.getElementById("pagenext").value;
var pagebefore=document.getElementById("pagebefore").value;
var fristpage=1;
$("#lastPage").attr("href","cabinetinfo.action?pageInfo.nextPage="+pagetotal+"");
$("#nextPage").attr("href","cabinetinfo.action?pageInfo.nextPage="+pagenext+"");
$("#prePage").attr("href","cabinetinfo.action?pageInfo.nextPage="+pagebefore+"");
$("#firstPage").attr("href","cabinetinfo.action?pageInfo.pageNum="+fristpage+"");
	  });
 </script>
</html>
