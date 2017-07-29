<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>计时器</title>
</head>
<script type="text/javascript">
  var num=4;
  function startCount() {
    document.getElementById('count').innerHTML =num;
    num=num-1;  
    setTimeout("startCount()",1000);
    if(num<0){
        window.location.href="login"; 
    }
  }
setTimeout("startCount()",1000);
</script>
</head>
<body>
<form>
  您还未<a href="${pageContext.request.contextPath }/login">登录</a>，<span id="count" >5</span>秒后自动跳转……

</form>
</body>
</html>