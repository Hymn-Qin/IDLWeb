<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<head>
	<title>工业互联统一账号管理系统</title>
	<meta name="keywords" content="file exchange system" />
	<meta name="description" content="file exchange system" />
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="favico.ico">
	<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
	<link href="css/templatemo_style.css" rel="stylesheet" type="text/css">	
	<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript">
	
	function changeValidateCode(obj) {
		//获取当前的时间作为参数，无具体意义
		var timenow = new Date().getTime();
		//每次请求需要一个不同的参数，否则可能会返回同样的验证码
		//这和浏览器的缓存机制有关系，也可以把页面设置为不缓存，这样就不用这个参数了。
		obj.src="rand.action?d="+timenow;
	}
	
	function checknull(){
	var username=document.getElementById("username").value;
	var password=document.getElementById("password").value;
	if(username==null||username==""){
	//alert("请输入用户名！");
	return false;
	}else if(password==null||password==""){
	//alert("请输入密码！");
	return false;
	}else{
	return true;
	}
	}
	// 登录页面若在框架内，则跳出框架
		 if(top!=self){
          if(top.location != self.location)
               top.location=self.location;
     }
     
//jquery start     
$(document).ready(
function(){
//check username is not null
$("#username").blur( function() {
var username=$("#username").val();
if(username==null||username==""){
$('#name').html("請輸入用戶名").css("color", "#AFD3FC").fadeIn();
}else{
$('#name').html("");
}
});
//check username is not null
$("#password").blur( function() {
var password=$("#password").val();
if(password==null||password==""){
$('#pass').html("請輸入密碼").css("color", "#AFD3FC").fadeIn();
}else if(password.length<6){
$('#pass').html("your password is not strong").css("color", "#AFD3FC").fadeIn();
}else{
$('#pass').html("");
}
});

//check 验证码
$("#textfield3").blur( function() {     
            var url = 'randomCheck.action'; 
            var params = {     
                 random:$("#textfield3").val()
            }
             //使用$.post方式         
             $.post(     
                 url,        //服务器要接受的url
                 params,
                 function callback(data){ //服务器返回后执行的函数 参数 data保存的就是服务器发送到客户端的数据
                     var member = eval("("+data+")");    //包数据解析为json 格式
                     if(member.random=="yes"){
                     //$('#random').html("驗證碼輸入ok!").css("color", "#AFD3FC").fadeIn();
                     }else{
                     $('#random').html("驗證碼輸入錯誤!").css("color", "red").fadeIn();
                     }
               },
               'json'  //数据传递的类型  json
             );
       });
}
);

$(document).ready(function(){	
function checkhHtml5() {   //判断当前浏览器是否支持html5
	if (typeof(Worker) !== "undefined") 
	{  	return true;
		 //alert("支持HTML5");  
	 }else {
	 	return false;
	    //alert("不支持HTML5");  
	     }
  } 
  function CheckSilverlightInstalled()   //检查浏览器是否支持silverlight
{   
var isSilverlightInstalled = false;    
try{   
try{   
var slControl = new ActiveXObject('AgControl.AgControl'); //检查IE   
isSilverlightInstalled = true;    
}   
catch(e){    
if(navigator.plugins["Silverlight Plug-In"]) //检查非IE   
{   
isSilverlightInstalled = true;    
}   
}   
}   
catch(e){}   
return isSilverlightInstalled;    
}   
  
	if(!checkhHtml5()){
		if(!CheckSilverlightInstalled()){
			var mess=document.getElementById("mess");
			var hr=document.getElementById("hr");
			hr.style.display="none";
			mess.innerHTML=("系統檢測到您的瀏覽器不支持大文件上傳,您可以選擇點擊<a href='filemanage/fileDown.jsp?file_name=Silverlight.exe'>Silverlight</a>下載插件后安裝,或者更換瀏覽器!");
		}
	}
	});
	</script>
	
	
</head>
<body class="templatemo-bg-gray" >
<hr>
<hr>
	<div class="container">
		<div class="col-md-12">
			<h1 class="margin-bottom-15">歡迎來到工业互联统一账号管理系统</h1>
			 
			<form class="form-horizontal templatemo-container templatemo-login-form-1 margin-bottom-30" role="form" action="userLogin.action" method="post" onsubmit="return checknull()">				
		        <div class="form-group">
		          <div class="col-md-12">		            
		            <div class="control-wrapper">
		            	<label for="username" class="control-label fa-label"><i class="fa fa-user fa-medium"></i></label>
		            	<input type="text" class="form-control" id="username" placeholder="用戶名" name="adminInfo.user_foxconn_id">
		            </div>
		            <div align="right">
						<span id="name"></span>
					</div>		            	            
		          </div>              
		        </div>
		        <div class="form-group">
		          <div class="col-md-12">
		          	<div class="control-wrapper">
		            	<label for="password" class="control-label fa-label"><i class="fa fa-lock fa-medium"></i></label>
		            	<input type="password" class="form-control" id="password" placeholder="密碼" name="adminInfo.user_password">
		            </div>
		            <div align="right">
						<span id="pass"></span>
					</div>
		          </div>
		        </div>
		          <div class="form-group">
		          <div class="col-md-12">
		          	<div class="control-wrapper">
		            	<!--<table>
		            	<tr>  
                <td height="35" valign="bottom"><div align="right"><font style="font-family:Arial; font-size:17px; color:#34afd5">驗證碼：</font></div></td>  
                <td width="20" valign="bottom">&nbsp;</td>  
                <td width="52" height="24" valign="bottom"><input type="text"  maxlength=6 name="random" id="textfield3" style="margin-bottom:2px; width:80px; height:25px; background-color:#eeeeee; border:solid 1px #153966; font-size:12px; color:#283439; "></td>  
                <td width="20" valign="bottom">&nbsp;</td>  
                <td width="92" valign="bottom">
                 <img src="rand.action" width="100" height="30" onclick="changeValidateCode(this)" title="點擊圖片刷新驗證碼" style="cursor: pointer"/>
                </td>  
              </tr>
              <tr><td colspan=5>
							<div>
								<span id="random"></span>
							</div>
						</td></tr>   
              </table> -->
		            </div>
		          </div>
		        </div>
		        <div class="form-group">
		          <div class="col-md-12">
		          	<div class="control-wrapper">

		          		<input type="submit" value="登 錄" class="btn btn-info" >&nbsp;&nbsp;&nbsp;
						<a href='help.jsp' target="_blank" class="text-right pull-right">幫助文檔</a>
		          	<!-- <a href="forgot-password.html" class="text-right pull-right">忘記密碼?</a>-->

		          	</div>
		          </div>
		        </div>
				<hr id="hr" >	
		        <h3 class="control-wrapper"  id="mess">
		        	
		        </h3>
		        <h3 class="control-wrapper">${requestScope.loginError}</h3>
		        <input type="hidden" name="prePage" value="${prePage}">
		      </form>
		      <div class="text-center">
		     	 <p style="font-size:15px;"><b>系統維護人員</b>&nbsp;:&nbsp;張進才(579-85975)jackie.jc.zhang@mail.foxconn.com</p>
		      	<a href="#" class="templatemo-create-new">©2019 foxconn zzdc web&server</a>
		      </div>
		</div>
	</div>
</body>
</html>
