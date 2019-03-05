<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
        <meta http-equiv=content-type content="text/html; charset=utf-8" />
        <meta http-equiv=pragma content=no-cache />
        <meta http-equiv=cache-control content=no-cache />
        <meta http-equiv=expires content=-1000 />
        <link rel="shortcut icon" href="favico.ico">
        <title>工业互联统一账号管理系统</title>

    </head>
  <frameset border=0 framespacing=0 rows="60, *" frameborder=0>
        <frame name=head src="head.jsp" frameborder=0 noresize scrolling=no>
            <frameset cols="200, *">
                <frame name=left src="left.jsp" frameborder=0 noresize />
                 <frame name=right src="showPhoneStatus.action" frameborder=0 noresize scrolling=yes />
			<!--	<frame name=right src="right.jsp" frameborder=0 noresize scrolling=yes /> -->
            </frameset>
    </frameset>
</html>
