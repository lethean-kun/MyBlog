<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="images/index/icon_2.png">
    <title>${sessionScope.user.username}的博客  </title>
    <link href="<%=basePath %>css/index/foot.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath %>css/index/cbody.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath %>css/index/banner.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath %>css/index/nav.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath %>css/css.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath %>css/button.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="nav">
    <a class="nav_logo"><img src="<%=basePath %>images/index/logo.png" height="30" width="100"></a>
    <div id="nav_ul">
        <ul>
            <li><a class="nav_a" href="###" target="_self"> ${user.username} </a></li>
            <li class="nav_line">|</li>
            <li><a class="nav_a"  href="${pageContext.request.contextPath }/editUser" target="_self">个人中心</a></li>
            <li class="nav_line">|</li>
            <li><a class="nav_a"  href="${pageContext.request.contextPath }/publishArticlesIndex" target="_self">发博文</a></li>
            <li class="nav_line">|</li>
            <li><a class="nav_a"  href="${pageContext.request.contextPath }/logout" target="_self">退出登录</a></li>
        </ul>
    </div>
</div>
<div class="banner">
    <img id="banner_img" src="<%=basePath %>images/index/banner.png">
    <div id="banner_text">
        <a id="banner_text_a" href="#" target="_self">${user.username}博客</a>
        <div id="banner_content" >
            <ul>
                <li><a href="${pageContext.request.contextPath }/allTopic" target="_self">博客杂谈</a></li>
                <li class="banner_line">|</li>
                <li><a href="${pageContext.request.contextPath }/myidx" target="_self">我的博文</a></li>
                <li class="banner_line">|</li>
                <li><a href="###" target="_self">图片</a></li>
                <li class="banner_line">|</li>
                <li><a href="###" target="_self">关于我</a></li>
            </ul>
        </div>
    </div>
</div>


<div class="cbody">
    <div class="cbody_left">
        <div id="gr">
            <div class="cbody_bar">
                <span><b>个人资料</b></span>
            </div>
            <div id="gr_tou">
                <img id="gr_touxiang" src="/pic/${sessionScope.user.headPic}" width="180" height="180">
            </div>
            <span id="name">${sessionScope.user.username}</span>
            <div id="weibo">
                 <form action="${pageContext.request.contextPath }/shake" method="post">
	                   		<input type="hidden" name="userid" value="${sessionScope.user.userid }">
	                   		<input type="submit" class="button gray" value="摇一摇交友"></input>
                 </form>
            </div>
            <hr>
            <div id="list_ul">
            	<ul>
                	<li>qq：<span>${sessionScope.user.qq}</span></li>
                    <li>email：<span>${sessionScope.user.email}</span></li>
                    <li>个性签名：<span>${sessionScope.user.summary}</span></li>
                    <li>关注人气：<span>3</span></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="cbody_right">
        <div id="bw">
            <div>
                <div id="cbody_bar_r">
                    <span><b>用户<a style="color: red">${userfriend.username}</a>资料</b></span>
                </div>
            </div>
           		
				<div style="text-align:center;margin-top: 110px">
					<form  action="${pageContext.request.contextPath }/editData" method="post" enctype="multipart/form-data">
                   	            头&nbsp;&nbsp;像：<img src="/pic/${userfriend.headPic}" width="100" height="100"/><br> <br> 
                    	 用户名：<input name="username" value="${userfriend.username }" type="text" style="background:transparent;border:1px solid #ffffff;height: 30px" />  <br> <br>
                        &nbsp;&nbsp;&nbsp;q&nbsp;&nbsp;&nbsp;q：<input name="qq" type="text" value="${userfriend.qq }" style="background:transparent;border:1px solid #ffffff;height: 30px" /> <br> <br>
                        &nbsp;email：<input name="email" type="text" value="${userfriend.email }" style="background:transparent;border:1px solid #ffffff;height: 30px" /> <br> <br>
                 	           个性签名：<input name="summary" type="text" value="${userfriend.summary }" style="background:transparent;border:1px solid #ffffff;height: 30px" /> <br> <br>
                       
					</form>
				</div>
				<div style="height: 50px">-</div>
        </div>
    </div>
</div>


<div class="foot">
    <p><a href="###" target="_self">BLOG意见反馈留言板</a><a href="###" target="_self">不良信息反馈</a>电话：4006900000 提示音后按1键（按当地市话标准计费）　欢迎批评指正</p>
    <ul>
        <li>Blog简介</li><li>|</li>
        <li>About Dzz</li><li>|</li>
        <li>广告服务</li><li>|</li>
        <li>联系我们</li><li>|</li>
        <li>招聘信息</li><li>|</li>
        <li>网站律师</li><li>|</li>
        <li>SINA English</li><li>|</li>
        <li>会员注册</li><li>|</li>
        <li>产品答疑</li>
    </ul>
    <p>Copyright © 1996 - 2017 DZZ Corporation, All Rights Reserved</p>
    <p>DZ公司 版权所有</p>
</div>
</body>
</html>