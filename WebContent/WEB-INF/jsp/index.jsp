<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="images/index/icon_2.png">
    <title>${user.username}的博客  </title>
    <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>  
	<script>
	    function ok(pl) {
	    	
			if(document.getElementById(pl).style.display=='none')
				$("#"+pl).show("slow");
			else
				$("#"+pl).hide("slow");
	    }	  
	</script>  
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
                    <li><a class="nav_a"  href="${pageContext.request.contextPath }/editUser" target="_self">关于我</a></li>
                </ul>
            </div>
        </div>
    </div>


    <div class="cbody">
        <div class="cbody_left">
            <div id="gr">
                <div class="cbody_bar">
                    <span><b>我的资料</b><a class="cbody_bar_span_a" href="${pageContext.request.contextPath }/editUser" target="_self">[修改资料]</a></span>
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
                        <span><b>我的博文</b><a href="###" target="_self">[管理]</a></span>
                    </div>
                </div>
					<c:if test="${topics!=null}">
						<c:forEach items="${topics }" var="topic" varStatus="status">
			                <div class="bw_text">
			                    <span class="title_span"><a class="bw_text_title" href="${pageContext.request.contextPath }/topicInfo/${topic.topicid}">${topic.title}</a><br>(${topic.addtime })<a class="bw_text_title_bt" href="###" target="_self">[编辑]</a><a style="float: right;" class="bw_text_title_bt" href="${pageContext.request.contextPath }/deleteArticles/${topic.topicid}" target="_self">[删除]</a></span>
			                    <br />
			                    <span class="note_span">标签：<a class="note_span_a" href="###" target="_self">教程</a><a class="note_span_a" href="###" target="_self">视频</a><a class="note_span_a" href="###" target="_self">access</a>    分类：<a class="note_span_a" href="###" target="_self">二级考证</a></span>
			                    <div class="text_text">&nbsp;&nbsp;${topic.contents}</div>
			                    <br />
			                    <span class="bw_bottom"><a class="bw_bottom_bt" href="###" target="_self">阅读</a>(${topic.views} ) | <a class="bw_bottom_bt" href="###" target="_self" onclick="ok('${status.index }')">评论</a>(${topic.replys}) |  <a class="bw_bottom_bt" href="###" target="_self">收藏</a>(10)<a class="bw_bottom_bt_more" href="${pageContext.request.contextPath }/topicInfo/${topic.topicid}" target="_self">查看全文>></a></span>
			                </div>
			                
			               	<div id="${status.index}" style="width:660px;height:180px;display:none;margin-left: 30px">
    							<form action="${pageContext.request.contextPath }/review">
	    							<textarea id="tra" name="content" style="width: 660px"></textarea>
	   								<input  type="submit" value="评论"  style="float: right;height: 30px;width: 70px" /> <input  type="button" value="取消" style="float: right;height: 30px;width: 70px"/><br>
	   								<input type="hidden" name="topicid" value="${topic.topicid }">
	   								<input type="hidden" name="userid" value="${sessionScope.user.userid}">
	   							</form>
	   							<c:if test="${topic.reply.size()>=1}">
					                <c:forEach items="${topic.reply}" var="replys">
					                	<a href="${pageContext.request.contextPath }/userFriend/${replys.user.userid}"><img src="/pic/${replys.user.headPic}" width="25" height="25">${replys.user.username}</a><span>： ${replys.content}</span><br>
					                </c:forEach>
				            	</c:if>
							</div>
			                <hr class="bw_hr">
		
		                </c:forEach>
		                
	               </c:if>
	               
	               <c:if test="${topics.size()==0}">
	               		<div style="text-align:center;margin-top: 200px;margin-bottom: 211px">
	               			您还没有发表过博客，请发表您的第一个博客吧！<a style="color: red"  href="${pageContext.request.contextPath }/publishArticlesIndex" target="_self">发博文</a><br><br>
	               			您还可以看看别人发的博客！<a href="${pageContext.request.contextPath }/allTopic" target="_self">博客杂谈</a>
	               		</div>
	               </c:if>
                <br />
            </div>
        </div>
    </div>


    <div class="foot">
        <p><a href="###" target="_self">新浪BLOG意见反馈留言板</a><a href="###" target="_self">不良信息反馈</a>电话：4006900000 提示音后按1键（按当地市话标准计费）　欢迎批评指正</p>
        <ul>
            <li>新浪简介</li><li>|</li>
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