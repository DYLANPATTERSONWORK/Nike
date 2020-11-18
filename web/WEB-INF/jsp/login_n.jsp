<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
    <head>
        <title>login</title>
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <script src="js/jquery.min.js"></script>
        <!----start-alert-scroller---->
        <script type="text/javascript" src="js/jquery.easy-ticker.js"></script>
        <script type="text/javascript">
        $(document).ready(function(){
            $('#demo').hide();
            $('.vticker').easyTicker();
        });
        </script>
        <!----start-alert-scroller---->
        <!-- start menu -->
        <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/megamenu.js"></script>
        <script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
        <script src="js/menu_jquery.js"></script>
        <!-- //End menu -->
        <!---move-top-top---->
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function($) {
                $(".scroll").click(function(event){     
                    event.preventDefault();
                    $('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
                });
            });
        </script>
        <!---//move-top-top---->
        <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">
        window.onload = function() {
            changeImg();
            var username = document.getElementById("username");
            var password = document.getElementById("password");
            var btn = document.getElementById("btn");
            //光标进入焦点事件
            username.onfocus = function() {
                if(username.value == "用户名/手机号/邮箱") {
                    username.value = "";
                    this.style.color = "#000";
                    this.style.fontSize = "16px";
                }
            };
            
            //光标失去焦点事件
            username.onblur = function() {
                if(username.value == "") {
                    username.value = "用户名/手机号/邮箱";
                    this.style.color = "#999";
                    this.style.fontSize = "12px";
                }
            };
            
            password.onfocus = function() {
                if(password.value == "请输入密码") {
                    password.value = "";
                    this.style.color = "#000";
                    this.setAttribute("type","password");
                    this.style.fontSize = "16px";
                }
            };
            
            password.onblur = function() {
                if(password.value == "") {
                    password.value = "请输入密码";
                    this.style.color = "#999";
                    this.setAttribute("type","text");
                    this.style.fontSize = "16px";
                }
            };
            
            btn.onclick = function() {
                if(username.value == "用户名/手机号/邮箱" || username.value == "") {
                    alert("请输入用户名/手机号/邮箱");
                }
                else {
                    if(password.value == "请输入密码" || password.value == "") {
                        alert("请输入密码");
                    }
                    else {
                        var form = document.getElementById("form");
                        form.submit();
                    }
                }
            };
        };
        function changeImg(){
            var currentImg = Math.floor(Math.random()*2);
            var imgArr = ["login_bg01.png","login_bg02.png"];
            var img = document.getElementById("login");
            img.style.backgroundImage="url(<%=request.getContextPath() %>/img/" + imgArr[currentImg] + ")";
        };
    </script>
    </head>
    <body>
        <!---start-wrap---->
            <!---start-header---->
            <jsp:include page="head_n.jsp"></jsp:include>
            <!---//End-header---->
        <!--- start-content---->
        <div class="content login-box">
            <div class="login-main">
                <div class="wrap">
                    <h1>注册或登录</h1>
                    <div class="login-left">
                        <h3>新用户注册</h3>
                        <p>通过在我们的商店中创建帐户，您将能够更快地完成结帐流程，存储多个送货地址，查看和跟踪帐户中的订单等等。</p>
                        <a class="acount-btn" href="<%=request.getContextPath() %>/user?method=registerInput">注册</a>
                    </div>
                    <div class="login-right">
                        <h3>老用户登录</h3>
                        <p>如果您拥有我们的帐户，请登录。</p>
                        <form action="<%=request.getContextPath() %>/user?method=login" method="post" id="form">
                            <table >
                    
                    <tr>
                        <td>
                            <span>用户名<label>*</label></span>
                            <input type="text" name="username" value="" id="username" class="in" autocomplete="off">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>密码<label>*</label></span>
                            <input type="password" name="password" value="" id="password" class="in" autocomplete="off">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" value="登&nbsp;&nbsp;录" id="btn" class="su">
                        </td>
                    </tr>
                </table>
                        </form>
                    </div>
                    <div class="clear"> </div>
                </div>
            </div>
        </div>
        <!---- start-bottom-grids---->
        
        <!---- //End-bottom-grids---->
        <!--- //End-content---->
        <!---start-footer---->
        <jsp:include page="footer_n.jsp"></jsp:include>
        <!---//End-footer---->
        <!---//End-wrap---->
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>