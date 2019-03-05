<%@ page language="java" import="java.util.*" pageEncoding="Utf-8" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page import="com.zzdc.iotloc.bean.*" %>
<%@page import="com.zzdc.iotloc.util.*" %>
<%@page import="com.opensymphony.xwork2.util.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";

    AdminInfo admin = (AdminInfo) request.getSession().getAttribute("loginUser");
    String groStr = null;
    if (request.getSession().getAttribute("fileControl") != null) {
        groStr = request.getSession().getAttribute("fileControl").toString();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv=content-type content="text/html; charset=utf-8"/>
    <link href="<%=path%>/css/init.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
    <style type="text/css">
        html, body {
            margin: 0;
            padding: 0;
            overflow-x: hidden;
            overflow-y: auto;
        }

        table {
            cellspacing: 0;
            cellpadding: 0;
        }

        /*遮罩层*/
        #tinybox_1 {
            position: absolute;
            width: 1002px;
            height: 80px;
            background: #aaacb0;
            display: none;
            z-index: 99999;
            border: 0px solid;
            display: none;
            text-align: center;
            padding: 10px
        }

        table {
            text-align: left;
        }

        a:link {
            text-decoration: none;
        }

        a:visited {
            text-decoration: none;
        }

        a:hover {
            text-decoration: none;
        }

        a:active {
            text-decoration: none;
        }

        table.child2 {
            border-top: 1px solid #eaf2f5;
            border-left: 1px solid #eaf2f5;
            border-right: 0px;
            border-bottom: 0px;

        }

        .child2 TD {
            border-top: 1px solid #eaf2f5;
            border-left: 1px solid #eaf2f5;
            border-right: 0px solid #eaf2f5;
            border-bottom: 1px solid #eaf2f5;
        }

        .bg {
            background-color: #55acef
        }

        .hide {
            display: none
        }
    </style>
    <script type="text/javascript">
        function checkhHtml5() {   //判断当前浏览器是否支持html5
            var browser = navigator.appName
            var b_version = navigator.appVersion
            var version = b_version.split(";");
            var trim_Version = version[1].replace(/[ ]/g, "");
            if (browser == "Microsoft Internet Explorer" && trim_Version == "MSIE6.0") {
                return 6;
            } else if (browser == "Microsoft Internet Explorer" && trim_Version == "MSIE7.0") {
                return 7;
            } else if (browser == "Microsoft Internet Explorer" && trim_Version == "MSIE8.0") {
                return 8;
            } else if (browser == "Microsoft Internet Explorer" && trim_Version == "MSIE9.0") {
                return 9;
            }
        }

        $(document).ready(function () {
            if (checkhHtml5() < 9) {
                $(".imgBtn").css("width", "77%");
            } else {
                $(".imgBtn").css("width", "100%");
            }


        });

        function expand(el) {
            childobj = document.getElementById("child" + el);

            if (childobj.style.display == 'none') {
                childobj.style.display = '';
            } else {
                childobj.style.display = 'none';
            }

            return;
        }

        function expands(el) {
            var kf = document.getElementById("kf");
            var kfchild = document.getElementById("child5.5");
            var kfchild1 = document.getElementById("child5");
            if (kfchild.style.display == '') {
                kfchild.style.display = 'none';
                kfchild1.style.display = 'none';
            } else {
                expand(el);
            }
            return;
        }

        function myshare() {
            $("#myShare2").removeClass("hide");
            $("#myShare1").addClass("hide");
            $("#imgShare1").removeClass("hide");
            $("#imgShare2").addClass("hide");
            $("#imgDown1").removeClass("hide");
            $("#imgDown2").addClass("hide");
        }

        function imgshare() {
            $("#myShare1").removeClass("hide");
            $("#myShare2").addClass("hide");
            $("#imgShare2").removeClass("hide");
            $("#imgShare1").addClass("hide");
            $("#imgDown1").removeClass("hide");
            $("#imgDown2").addClass("hide");
        }

        function imgdown() {
            $("#myShare1").removeClass("hide");
            $("#myShare2").addClass("hide");
            $("#imgShare1").removeClass("hide");
            $("#imgShare2").addClass("hide");
            $("#imgDown2").removeClass("hide");
            $("#imgDown1").addClass("hide");
        }

    </script>

</head>
<body style="background-color:#f3f3f3">
<%
    //判断登录用户的权限
    String control = admin.getUser_role();
    //String user_proname = Users.getProject_name();
%>

<table height="100%" border=0 style="width:90%;margin-left:5%">
    <tr>
        <td>
            <%--<%--%>
            <%--//	if ("A".equals(control)) {}--%>
            <%--%>--%>
            <table style="Border:1px solid #eaf2f5;background-color:#eff2f7;" width="100%">

                <tr height=40>
                    <td>
                        <img height="15px" width="15px"
                             src="<%=path%>/img/1450882008_basics.png" style="margin-left:10px;"/>
                        <a style="font-weight: bold; color: #222;margin-left:10px;font-size:18px"
                           onclick=expand(1) href="javascript:void(0);">系统管理</a>
                    </td>
                </tr>

            </table>
            <table id=child1 style="display:none;Border:1px solid #eaf2f5;font-size:12px;width:100%">
                <tr height=40 style="background-color:#fff;" onmouseover="this.style.backgroundColor='#55acef'"
                    onmouseout="this.style.backgroundColor='#fff'" cellspacing="20">
                    <td><img height=13 style="margin-left:10px"
                             src="<%=path%>/img/menu_icon.gif" width=13>
                    </td>
                    <td><a style="color: #222;" href="usermanage.action" target="right">管理员管理</a>
                    </td>
                </tr>
                <tr height=4>
                    <td colspan=2></td>
                </tr>
            </table>

            <table style="Border:1px solid #eaf2f5;background-color:#eff2f7;" width="100%">

                <tr height=40>
                    <td>
                        <img height="15px" width="15px"
                             src="<%=path%>/img/1450882008_basics.png" style="margin-left:10px;"/>
                        <a style="font-weight: bold; color: #222;margin-left:10px;font-size:18px" onclick=expand(6)
                           href="javascript:void(0);">群組管理</a>
                    </td>
                </tr>
            </table>
            <table id=child6 style="display:none;Border:1px solid #eaf2f5;font-size:12px;width:100%">
                <tr height=40 style="background-color:#fff;" onmouseover="this.style.backgroundColor='#55acef'"
                    onmouseout="this.style.backgroundColor='#fff'" cellspacing="20">
                    <td><img height=13 style="margin-left:10px"
                             src="<%=path%>/img/menu_icon.gif" width=13/>
                    </td>
                    <td><a style="color: #222;" href="projectmanage.action" target="right">群組管理</a>
                    </td>
                </tr>
                <tr height=4>
                    <td colspan=2></td>
                </tr>
            </table>
            <%--<%--%>

            <%--%>--%>
            <!-- 上传下载模块开始
				<table style="Border:1px solid #eaf2f5;background-color:#eff2f7;" width="100%">
					<tr height=40>
						<td>
						<img height="15px" width="15px"
							src="<%=path%>/img/1450882008_basics.png"  style="margin-left:10px;"/>
							<a  style="font-weight: bold; color: #222;margin-left:10px;font-size:18px">文件列表</a>
						</td>
					</tr>
				</table>
				 -->
            <%--<br>--%>
            <table id="child2">
                <tr>
                    <td>
                        <a href="cabinetinfo.action" target="right" onclick="myshare()">
                            <img class="imgBtn" id="myShare1" style="width:100%;height:80%"
                                 src="<%=path%>/img/btn_up_normal1.png" alt="機櫃管理"/>
                            <img class="imgBtn hide" id="myShare2" style="width:100%;height:80%"
                                 src="<%=path%>/img/btn_up_focus1.png" alt="機櫃管理"/>
                        </a>
                    </td>
                </tr>
            </table>

            <%-- 				<%
                                if(groStr!=null){
                                        String[] st = groStr.split(",");
                                        if(st!=null&&st.length>=1){
                                        UserInfo u = (UserInfo)request.getSession().getAttribute("loginUser");
                                                                List l = u.getProjectList();
                                                                if(l!=null&&l.size()>0){
                                                                for(int m=0;m<l.size();m++){
                                                                    UserProject p=(UserProject)l.get(m);

                            %>
                            <tr height=40 style="background-color:#fff;" >
                                    <td><img height=9
                                        src="<%=path%>/img/ic_arrows.png" width=9 style="margin-left:10px"/>
                                    <a href="findfileid.action?file_project=<%=p.getProjectInfo().getProject_id()%>" target="right" style="color: #222;"><%=p.getProjectInfo().getProject_name()%></a>
                                    </td>
                                </tr>
                                    <%} }}}%>
                                </table> --%>
            <!-- <table id=child2 style="display: ;" cellspacing=0 cellpadding=0
					width=150 border=0>
					<tr height=20>
						<td align=middle width=30><img height=9
							<%--src="<%=path%>/img/menu_icon.gif" width=9/>--%>
						</td>
						<td><a class=menuchild href="showAddFile.action" target="right">文件上傳</a>
						</td>
					</tr>
					<tr height=4>
						<td colspan=2></td>
					</tr>

					<tr height=20>
						<td align=middle width=30><img height=9
							<%--src="<%=path%>/img/menu_icon.gif" width=9/>--%>
						</td>
						<td><a class=menuchild href="./filemanage/fileDownload.jsp" target="right">文件下載</a>
						</td>
					</tr>
					<tr height=4>
						<td colspan=2></td>
					</tr>
				</table>
            -->

            <%-- 用户管理模块开始
            <table cellspacing=0 cellpadding=0 width=150 border=0>

                <tr height=22>
                    <td
                        --%>

            <!-- 項目管理模块开始

				<table cellspacing=0 cellpadding=0 width=150 border=0>

					<tr height=22>
						<td
							background="<%=path%>/img/menu_bt.jpg"><a class=menuparent onclick=expand(6) href="javascript:void(0);">項目管理</a>
						</td>
					</tr>

					<tr height=4>
						<td></td>
					</tr>
				</table>
				<table id=child6 style="display: none;" cellspacing=0 cellpadding=0
					width=150 border=0>
					<tr height=20>
						<td align=middle width=30><img height=9
							src="<%=path%>/img/menu_icon.gif" width=9/>
						</td>
						<td><a class=menuchild href="projectmanage.action" target="right">項目管理</a>
						</td>
					</tr>
					<tr height=4>
						<td colspan=2></td>
					</tr>


				</table>
			

	<!-- 項目管理模块结束 -->

            <!-- 文件列表模块开始 -->
            <br>
            <table border=0>
                <tr>
                    <td>
                        <a href="showPhoneStatus.action" target="right" onclick="imgshare()">
                            <img class="imgBtn hide" id="imgShare1" style="width:100%;height:80%"
                                 src="<%=path%>/img/btn_share_normal.png" alt="手機追蹤"/>
                            <img class="imgBtn" id="imgShare2" style="width:100%;height:80%"
                                 src="<%=path%>/img/btn_share_focus.png" alt="手機追蹤"/>
                        </a>
                    </td>
                </tr>
            </table>

            <br>
            <table border=0>
                <tr>
                    <td>
                        <a href="showPhoneStatusAllUser.action" target="right" onclick="imgdown()">
                            <img class="imgBtn" id="imgDown1" style="width:100%;height:80%"
                                 src="<%=path%>/img/btn_download_normal.png" alt="借机追踪"/>
                            <img class="imgBtn hide" id="imgDown2" style="width:100%;height:80%"
                                 src="<%=path%>/img/btn_download_focus.png" alt="借机追踪"/>
                        </a>
                    </td>
                </tr>
            </table>
            <!--<table id=child5 style="display: none;" cellspacing=0 cellpadding=0
					width=150 border=0>
					<tr height=20>
						<td align=middle width=30><img height=9
							src="<%=path%>/img/menu_icon.gif" width=9/>
						</td>
						<td><a class=menuchild href="findfileid.action" target="right">文件列表</a>
						</td>
					</tr>
					<tr height=4>
						<td colspan=2></td>
					</tr>


				</table>  -->
            <!-- 文件列表模块结束 -->
            <%--<%--%>
                <%--if ("A".equals(control)) {--%>
            <%--%>--%>
            <table style="Border:1px solid #eaf2f5;background-color:#eff2f7;" width="100%">
                <tr height=40>
                    <td><img height="15px" width="15px"
                             src="<%=path%>/img/1450882008_basics.png" style="margin-left:10px;"/>
                        <a style="font-weight: bold; color: #222;margin-left:10px;font-size:18px" onclick=expand(3)
                           href="javascript:void(0);">状态查询</a>
                    </td>
                </tr>
            </table>

            <table id=child3 style="display:none;Border:1px solid #eaf2f5;font-size:12px;width:100%">
                <tr height=40 style="background-color:#fff;" onmouseover="this.style.backgroundColor='#55acef'"
                    onmouseout="this.style.backgroundColor='#fff'" cellspacing="20">
                    <td align=middle><img height=13 style="margin-left:10px"
                                          src="<%=path%>/img/menu_icon.gif" width=13/>
                    </td>
                    <td><a style="color: #222;" href="./searchmanage/searchPhoneStatus.jsp" target="right">状态查询</a>
                    </td>
                </tr>

                <tr height=40 style="background-color:#fff;" onmouseover="this.style.backgroundColor='#55acef'"
                    onmouseout="this.style.backgroundColor='#fff'" cellspacing="20">
                    <td align=middle><img height=13 style="margin-left:10px"
                                          src="<%=path%>/img/menu_icon.gif" width=13/>
                    </td>
                    <td><a style="color: #222;" href="./history/searchUploadHistory.jsp" target="right">上傳歷史</a>
                    </td>
                </tr>
            </table>


            <table style="Border:1px solid #eaf2f5;background-color:#eff2f7;" width="100%">
                <tr height=40>
                    <td><img height="15px" width="15px"
                             src="<%=path%>/img/1450882008_basics.png" style="margin-left:10px;"/>
                        <a style="font-weight: bold; color: #222;margin-left:10px;font-size:18px" onclick=expand(9)
                           href="javascript:void(0);">用戶反饋</a>
                    </td>
                </tr>
            </table>

            <table id=child9 style="display:none;Border:1px solid #eaf2f5;font-size:12px;width:100%">

                <tr height=40 style="background-color:#fff;" onmouseover="this.style.backgroundColor='#55acef'"
                    onmouseout="this.style.backgroundColor='#fff'" cellspacing="20">
                    <td align=middle><img height=13 style="margin-left:10px"
                                          src="<%=path%>/img/menu_icon.gif" width=13/>
                    </td>
                    <td><a style="color: #222;" href="findissue.action" target="right">查看反饋</a>
                    </td>
                </tr>
            </table>
            <% %>
            <!-- 上传下载模块结束 -->
            <!--<table cellspacing=0 cellpadding=0 width=150 border=0>
					<tr height=22>
						<td
							background="<%=path%>/img/menu_bt.jpg"><a class=menuparent href="showProject.action" target=right>OTA</a>
						</td>
					</tr>
					<tr height=4>
						<td></td>
					</tr>
				</table> 
				<table id=child3 style="display:none;" cellspacing=0 cellpadding=0
					width=150 border=0>
					<tr height=20>
						<td align=middle width=30><img height=9
							src="<%=path%>/img/menu_icon.gif" width=9>
						</td>
						<td><a class=menuchild
							href="webcontrol.action?opType=showAppUpdate" target=right>app升级管理&nbsp;&nbsp;</a>
						</td>
					</tr>
					<tr height=4>
						<td colspan=2></td>
					</tr>
					<tr height=20>
						<td align=middle width=30><img height=9
							src="<%=path%>/img/menu_icon.gif" width=9>
						</td>
						<td><a class=menuchild
							href="imageWebControl.action?opType=showmain" target=right>image升级管理</a>
						</td>
					</tr>
					<tr height=4>
						<td colspan=2></td>
					</tr>

				</table> --><!--
				<table cellspacing=0 cellpadding=0 width=150 border=0>
					<tr height=22>
						<td style="padding-left: 30px"
							background="<%=path%>/img/menu_bt.jpg"><a class=menuparent
							onclick=expand(2) href="javascript:void(0);">群组管理</a>
						</td>
					</tr>
					<tr height=4>
						<td></td>
					</tr>
				</table>
				<table id=child2 style="display:none;" cellspacing=0 cellpadding=0
					width=150 border=0>
					<tr height=20>
						<td align=middle width=30><img height=9
							src="<%=path%>/img/menu_icon.gif" width=9>
						</td>
						<td><a class=menuchild href="showGroup.action" target=right>查看群组信息</a>
						</td>
					</tr>
					<tr height=4>
						<td colspan=2></td>
					</tr>
				</table> 
				<table cellspacing=0 cellpadding=0 width=150 border=0>
					<tr height=22>
						<td
							background="<%=path%>/img/menu_bt.jpg"><a class=menuparent
							onclick=expand(4) href="javascript:void(0);">专案管理</a>
						</td>
					</tr>
					<tr height=4>
						<td></td>
					</tr>

				</table>
				<table id=child4 style="display:none;" cellspacing=0 cellpadding=0
					width=150 border=0>
					<tr height=20 >
						<td align=middle width=30><img height=9
							src="<%=path%>/img/menu_icon.gif" width=9>
						</td>
						<td><a class=menuparent
							onclick=expand(4.1) href="javascript:void(0);">ZW2专案</a>
						</td>
						<td></td>
					</tr>


					<tr height=20  id=child4.1 style="display:none;" cellspacing=0 cellpadding=0
					width=150>
						<td align=middle width=30>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height=9
							src="<%=path%>/img/menu_icon.gif" width=9>
						</td>
						<td colspan="2"><a class=menuchild href="FindAllUsers_info.action"
							target="right">ZW2用户信息</a>
						</td>
					</tr>

					<tr height=4>
						<td colspan="3"></td>
					</tr>
				</table>
					<table cellspacing=0 cellpadding=0 width="100%" border=0>
						<tr>
							<td height=10></td>
						</tr>
					</table>
-->
        </td>
    </tr>
</table>
<div><input type="hidden" id="open_1" value="確認"></div>
<!-- 遮罩层 begin -->
<div id="tinybox_1">
    <h4 style="display:none;">文件正在上傳,請保持在當前頁面耐心等待!</h4>
    <a style="display:none;" href="#" id="close_1">關閉</a>
</div>
</body>
<script type="text/javascript">
    function BtHide(id) {
        var Div = document.getElementById(id);
        if (Div) {
            Div.style.display = "none"
        }
    }

    function BtShow(id) {
        var Div = document.getElementById(id);
        if (Div) {
            Div.style.display = "block"
        }
    }

    function BtPopload(showId) {
// 高度减去 4px，避免在页面无滚动条时显示遮罩后出现流动条 
        var h = (Math.max(document.documentElement.scrollHeight, document.documentElement.clientHeight) - 4) + 'px';
        var w = document.documentElement.scrollWidth + 'px';
        var popCss = "background:#000;opacity:0.3;filter:alpha(opacity=30);position:absolute;left:0;top:0;overflow:hidden;border:0";//遮罩背景
        var rePosition_mask = function () {
            pop_Box.style.height = h;
            pop_Box.style.width = w;
            pop_Iframe.style.height = h;
            pop_Iframe.style.width = w;
            if (document.documentElement.offsetWidth < 950) {
//防止正常宽度下点击时 在 ff 下出现页面滚动到顶部 
                document.documentElement.style.overflowX = "hidden";
            }
        }
        var exsit = document.getElementById("popBox");
        if (!exsit) {
            var pop_Box = document.createElement("div");
            pop_Box.id = "popBox";
            document.getElementsByTagName("body")[0].appendChild(pop_Box);
            pop_Box.style.cssText = popCss;
            pop_Box.style.zIndex = "10";
            var pop_Iframe = document.createElement("iframe"); // 这里如果用 div 的话，在 ie6 不能把 <select> 遮住
            pop_Iframe.id = "popIframe";
            document.getElementsByTagName("body")[0].appendChild(pop_Iframe);
            pop_Iframe.style.cssText = popCss;
            pop_Iframe.style.zIndex = "9";
            rePosition_mask();
        }
        BtShow("popIframe");
        BtShow("popBox");
//BtShow(showId); 
        var pop_Win = document.getElementById(showId);
        pop_Win.style.position = "absolute";
        pop_Win.style.zIndex = "11";
        var rePosition_pop = function () {
            pop_Win.style.top = document.documentElement.scrollTop + document.body.scrollTop + document.documentElement.clientHeight / 2 - pop_Win.offsetHeight / 2 + 'px';
            pop_Win.style.left = document.documentElement.scrollLeft + document.body.scrollLeft + document.documentElement.clientWidth / 2 - pop_Win.offsetWidth / 2 + 'px';
        }
        rePosition_pop();
        window.onresize = function () {
            w = document.documentElement.offsetWidth + 'px'; // 使用 scrollWidth 不能改变宽度
            rePosition_mask();
            rePosition_pop();
        }
        window.onscroll = function () {
            rePosition_pop();
        }
    }

    function BtPopShow(Bid, Did) {
        var UploadBtn = document.getElementById(Bid);
        if (UploadBtn) {
            UploadBtn.onclick = function () {
                BtPopload(Did);
                return false;
            }
        }
    }

    function BtPopHide(Bid, Did) {
        var UploadBtn = document.getElementById(Bid);
        if (UploadBtn) {
            UploadBtn.onclick = function () {
                BtHide(Did);
                BtHide("popBox");
                BtHide("popIframe");
                return false;
            }
        }
    }

    BtPopShow("open_1", "tinybox_1");
    BtPopHide("close_1", "tinybox_1");

</script>
</html>