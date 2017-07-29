<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>登录</title>
 <link href="<%=basePath %>css/login.css" rel="stylesheet" type="text/css">
 <script src="<%=basePath %>js/jquery-2.1.1.min.js" type="text/javascript"></script>
 <script src="<%=basePath %>js/login.js" type="text/javascript"></script>

</head>
<body>
<div class="htmleaf-container">
	<h3 align="center">个人博客登录</h3>
	<div></div>
	<div id="wrapper" class="login-page">
	  <div id="login_form" class="form">
		<form class="register-form" action="${pageContext.request.contextPath }/register" method="post" >
		  <input type="text" placeholder="用户名" name="username"/>
		  <input type="password" placeholder="密码" name="password" />
		  <input type="text" placeholder="qq" name="qq"/>
		  <input type="text" placeholder="电子邮件" name="emial"/>
		  
		  <button id="create">创建账户</button>
		  <p class="message">已经有了一个账户? <a href="#">立刻登录</a></p>
		</form>
		<form class="login-form" action="${pageContext.request.contextPath }/index" method="post">
		  <input type="text" placeholder="用户名" name="username"/>
		  <input type="password" placeholder="密码" name="password"/>
		  
		  ${error}
		  ${message}
		  <button id="login">登　录</button>
		  <p class="message">还没有账户? <a href="#">立刻创建</a></p>
		</form>
	  </div>
	</div>
</div>
</body>
</html>