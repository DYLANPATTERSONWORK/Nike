<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/style.css" rel='stylesheet' type='text/css' />
</head>
<body>

<div class="header">
   <div class="top-header">
       <div class="wrap">
           <div class="top-header-left">
               <ul>
                   <!---//cart-tonggle-script---->
                   <li><a class="cart" href="<%=request.getContextPath() %>/cart?method=myCart"><span id="clickme"> </span></a></li>
               </ul>
           </div>
           <div class="top-header-center">
               <div class="top-header-center-alert-left">
                   <h3>欢迎光临</h3>
               </div>
               <div class="top-header-center-alert-right">
                   <div class="vticker">
                     <ul>
                         <li>信息工程系软件班毕业答辩</li>
                     </ul>
                   </div>
               </div>
               <div class="clear"> </div>
           </div>
           <div class="top-header-right">
               <ul>
                   <c:if test="${loginUser eq null }">
                       <li><a href="<%=request.getContextPath() %>/user?method=loginInput" class="login">请登录</a></li>
                       <li><a href="<%=request.getContextPath() %>/user?method=registerInput" class="register">免费注册</a></li>
                   </c:if>
                   <c:if test="${loginUser ne null }">
                       <li><a href="<%=request.getContextPath() %>/user?method=myShop" class="user">${loginUser.username }</a></li>
                       <li><a href="<%=request.getContextPath() %>/user?method=logout" class="user">退出登录</a></li>
                   </c:if>
               </ul>
           </div>
           <div class="clear"> </div>
       </div>
   </div>
   <div class="mid-header">
        <div class="wrap">
            <div class="mid-grid-left">
                <form>
                    <input type="text" placeholder="您想买点什么？" />
                </form>
            </div>
            <div class="mid-grid-right">
                <a class="logo" href="index.html"><span> </span></a>
            </div>
            <div class="clear"> </div>
        </div>
    </div>
</div>
</body>
</html>