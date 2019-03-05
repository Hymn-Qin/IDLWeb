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

%>

<!DOCTYPE html>
<html>
<head>
<title>富士康鄭州研發中心文件下載歷史</title>
<base href="<%=basePath%>">

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="<%=path%>/css/admin.css" type="text/css" rel="stylesheet" />
<link href="<%=path%>/css/jonathan.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="<%=path%>/js/newImage.js"></script>
<link type="text/css"
	href="<%=path%>/css/cupertino_skyBule/jquery-ui-1.8.20.custom.css"
	rel="stylesheet" />
	<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/jquery-ui-1.8.20.custom.min.js"></script>
	    <script type="text/javascript" src="<%=path%>/js/jquery.ui.datepicker.js"></script>
    <script type="text/javascript" src="<%=path%>/js/jquery-ui-timepicker-addon.js"></script>
	<script type="text/javascript">
$(document).ready(
function() {
//日期控件的格式設置
$("#datepicker").datetimepicker({
showSecond: false,
showMinute: false,
showHour: false,
changeMonth: true,
timeFormat: 'hh:mm:ss',
dateFormat: 'yy-mm-dd'
 });

 $("#datepickerDate").datetimepicker({
showSecond: false,
showMinute: false,
showHour: false,
changeMonth: true,
timeFormat: 'hh:mm:ss',
dateFormat: 'yy-mm-dd'
 });
 });
</script>
<style type="text/css">
body{
	width:100%; 	
}
#container{
	width:100%
}
#con{
 	width:100%;
 	margin-top:3%;
	margin-left:8%;
}
</style>
</head>

<body>
<table width=100% border="0" cellspacing=0 cellpadding=0 width="100%"
			style="margin-left:  0px;margin-top:0px;">
			<tr height=30>
				<td colspan="2" background=./img/title_bg1.jpg>當前位置>查询状态</td>
			</tr>
			<tr>
				<td bgcolor=#b1ceef height=1 colspan="2"></td>
			</tr>
			<tr>

			</tr>
		</table>
	<!-- <h1>
		<center>下載歷史</center>
	</h1> -->
	
		<div id="container">
		<form id="con" action="searchPhoneStatusByContent.action" method="post">
			<table border="1" class="default_table"
				style="width: 80%; table-layout: fixed;">
				<col width="17%" />
				<col width="17%" />
				<col width="17%" />
				<col width="17%" />
				<col width="17%" />
				<col width="15%" />
				<tr>
					<td
						style="text-align: left; padding-left: 5px; font-weight: bold; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11px; color: #663513; border-bottom: 1px solid #5D88BA; border-right: 1px solid #5D88BA; background: #EAE3DB;">
						借出時間</td>
					<!-- start Date -->
					<td colspan="2">
					<input type="text" id="datepicker" name ="searchKeyword.startDate" style="width: 99%;" value="<s:property value="searchKeyword.startDate"/>"/></td>
					<td
						style="font-weight: bold; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11px; color: #663513; border-bottom: 1px solid #5D88BA; border-right: 1px solid #5D88BA; background: #EAE3DB;">
						还回時間</td>
					<!-- end date -->
					<td colspan="2">
					<input type="text" id="datepickerDate" name ="searchKeyword.endDate" style="width: 99%;" value="<s:property value="searchKeyword.endDate"/>"/>
					</td>
				</tr>

				<!-- search content -->
				<tr>
					<td
						style="text-align: left; padding-left: 5px; font-weight: bold; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11px; color: #663513; border-bottom: 1px solid #5D88BA; border-right: 1px solid #5D88BA; background: #EAE3DB;">
						机柜编号</td>
					<td style="text-align: left;" colspan="5">
						<!-- search content --> 
						<input type="text" id="searchKeyword.searchContent" name ="searchKeyword.searchContent" style="width: 99%;" value="<s:property value="searchKeyword.searchContent"/>"/>
					</td>
				</tr>
				<!-- search include -->
				
				<!-- search content -->
				<tr>
					<td
						style="text-align: left; padding-left: 5px; font-weight: bold; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11px; color: #663513; border-bottom: 1px solid #5D88BA; border-right: 1px solid #5D88BA; background: #EAE3DB;">
						机箱编号</td>
					<td style="text-align: left;" colspan="5">
						<!-- search content --> 
						<input type="text" id="searchKeyword.searchContent" name ="searchKeyword.searchContent" style="width: 99%;" value="<s:property value="searchKeyword.searchContent"/>"/>
					</td>
				</tr>
				<!-- search include -->
				<!-- search content -->
				<tr>
					<td
						style="text-align: left; padding-left: 5px; font-weight: bold; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11px; color: #663513; border-bottom: 1px solid #5D88BA; border-right: 1px solid #5D88BA; background: #EAE3DB;">
						手机状态</td>
					<td style="text-align: left;" colspan="5">
						<!-- search content --> 
						<input type="text" id="searchKeyword.searchContent" name ="searchKeyword.searchContent" style="width: 99%;" value="<s:property value="searchKeyword.searchContent"/>"/>
					</td>
				</tr>
				<!-- search include -->						
				
				
				
				<tr>
					<td
						style="text-align: left; padding-left: 5px; font-weight: bold; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11px; color: #663513; border-bottom: 1px solid #5D88BA; border-right: 1px solid #5D88BA; background: #EAE3DB;">
						查詢相關</td>
					<!-- search the subject -->
					<td
						style="text-align: left; font-weight: bold; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11px; color: #663513; border-bottom: 1px solid #5D88BA; border-right: 1px solid #5D88BA; background: #EAE3DB;">
						<input type="checkbox" name="searchKeyword.includeSubject"
						value="subject" /><label>机柜编号</label>
					</td>
					<!-- search the receiver -->
					<td
						style="text-align: left; font-weight: bold; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11px; color: #663513; border-bottom: 1px solid #5D88BA; border-right: 1px solid #5D88BA; background: #EAE3DB;">
						<input type="checkbox" name="searchKeyword.includeReceiver"
						value="Receiver" /><label>机箱编号</label>
					</td>
					<!-- search the filename -->
					<td
						style="text-align: left; font-weight: bold; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11px; color: #663513; border-bottom: 1px solid #5D88BA; border-right: 1px solid #5D88BA; background: #EAE3DB;">
						<input type="checkbox" name="searchKeyword.includeFileName"
						value="FileName" /><label>手机状态</label>
					</td>
					<!-- submit the form -->
					<td colspan="2"
						style="text-align: center; font-weight: bold; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11px; color: #663513; border-bottom: 1px solid #5D88BA; border-right: 1px solid #5D88BA; background: #EAE3DB;">
						<input type="submit" value=" 搜  索 " /></td>
				</tr>
			</table>
	</form>
	<!-- searching result -->

	</div>


</body>


</html>
