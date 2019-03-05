<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<%
String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'fileDetailTest.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link href="<%=path%>/css/admin.css" type="text/css" rel="stylesheet" />
  </head>
  
  <body>
	
		<table border="0" width="100%">
		<tr>
		<td width="30%">
		共<s:property value="pageInfo.total"/>條記錄
		共<s:property value="pageInfo.pages"/>頁
		當前第<s:property value="pageInfo.pageNum"/>頁
		</td>
		<td colspan="3"></td>
		</tr>
		<tr><td></td><td width="20%">
		<s:if test="%{pageInfo.pageNum==1}">第一頁&nbsp;&nbsp;&nbsp;&nbsp;上一頁</s:if>
		<s:else><a id="firstPage" class=menuchild>第一頁</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a class=menuchild id="prePage">上一頁</a>
		</s:else>
		</td>
		<td width="20%">
		<s:if test="%{pageInfo.pageNum!=pageInfo.pages}">
		<a id="nextPage" class=menuchild>下一頁</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a id="lastPage" class=menuchild>最後一頁</a>		
		</s:if>
		<s:else>
		下一頁&nbsp;&nbsp;&nbsp;&nbsp;最後一頁
		</s:else>
		</td>
		<td width="30%"><br></td></tr>
		</table>	
	
  </body>
</html>
