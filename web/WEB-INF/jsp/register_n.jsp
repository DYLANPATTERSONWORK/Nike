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
        <title>REGISTER</title>
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!----webfonts---->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
        <!----//webfonts---->
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
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.js"></script>
    <script type="text/javascript">
        window.onload = function() {
            var username = document.getElementById("username");
            var pwd1 = document.getElementById("pwd1");
            var pwd2 = document.getElementById("pwd2");
            var phone = document.getElementById("phone");
            var email = document.getElementById("email");
            var btn = document.getElementById("btn");
            //光标进入焦点事件
            username.onfocus = function() {
                if(username.value == "请输入一个用户明名") {
                    username.value = "";
                    this.style.color = "#000";
                    this.style.fontSize = "16px";
                }
            };
            
            //光标失去焦点事件
            username.onblur = function() {
                if(username.value == "") {
                    username.value = "请输入一个用户明名";
                    this.style.color = "#999";
                    this.style.fontSize = "12px";
                    var reg = /^[a-zA-Z][a-zA-Z0-9]\w{4,14}$/;//正则表达式匹配字母开头,字母数字下划线组合,6-18位
                }
            };
            
            pwd1.onfocus = function() {
                if(pwd1.value == "请输入密码") {
                    pwd1.value = "";
                    this.style.color = "#000";
                    this.setAttribute("type","password");
                    this.style.fontSize = "16px";
                }
            };
            
            pwd1.onblur = function() {
                if(pwd1.value == "") {
                    pwd1.value = "请输入密码";
                    this.style.color = "#999";
                    this.setAttribute("type","text");
                    this.style.fontSize = "12px";
                }
            };
            
            pwd2.onfocus = function() {
                if(pwd2.value == "确认密码") {
                    pwd2.value = "";
                    this.style.color = "#000";
                    this.setAttribute("type","password");
                    this.style.fontSize = "16px";
                }
            };
            
            pwd2.onblur = function() {
                if(pwd2.value == "") {
                    pwd2.value = "确认密码";
                    this.style.color = "#999";
                    this.setAttribute("type","text");
                    this.style.fontSize = "12px";
                }
            };
            
            phone.onfocus = function() {
                if(phone.value == "请输入手机号") {
                    phone.value = "";
                    this.style.color = "#000";
                    this.style.fontSize = "16px";
                }
            };
            
            phone.onblur = function() {
                if(phone.value == "") {
                    phone.value = "请输入手机号";
                    this.style.color = "#999";
                    this.style.fontSize = "12px";
                    var reg = /^1[3|4|5|7|8][0-9]\d{8}/;//正则表达式匹配手机号
                }
            };
            
            email.onfocus = function() {
                if(email.value == "请输入邮箱") {
                    email.value = "";
                    this.style.color = "#000";
                    this.style.fontSize = "16px";
                }
            };
            
            email.onblur = function() {
                if(email.value == "") {
                    email.value = "请输入邮箱";
                    this.style.color = "#999";
                    this.style.fontSize = "12px";
                }
            };
            
            btn.onclick = function() {
                if(username.value == "请输入一个用户明名" || username.value == "") {
                    alert("请输入用户名");
                }
                else {
                    if(pwd1.value == "请输入密码" || pwd1.value == "") {
                        alert("请输入密码");
                    }
                    else {
                        if(pwd1.value != pwd2.value) {
                            alert("两次密码不一致");
                        }
                        else {
                            if(phone.value == "请输入手机号" || phone.value == "") {
                                alert("请输入手机号");
                            }
                            else {
                                if(email.value == "请输入邮箱" || email.value == "") {
                                    alert("请输入邮箱");
                                }
                                else {
                                    var form = document.getElementById("form");
                                    form.submit();
                                }
                            }
                        }
                    }
                }
            };
        };
        
        $(function() {
            //注册时用户名是否存在验证
            //注册光标失去焦点事件
            $("#username").blur(function() {
                //获取输入的用户名
                var uname = $("#username").val();
                //jquery发送AJAX请求
                $.ajax({
                    type:"post",
                    url:"user",
                    data:{method:"rejUsername", username:uname},
                    success:function(data) {
                        if(data == "yes") {
                            alert("该用户名已存在,请更换用户名");
                            $("#username").val("请输入一个用户明名").css("color", "#999").css("font-size", "12px");
                        }
                    }
                });
            });
            //注册时手机号是否存在验证
            $("#phone").blur(function() {
                var phone = $("#phone").val();
                //jquery发送AJAX请求
                $.ajax({
                    type:"post",
                    url:"user",
                    data:{method:"rejPhone", phone:phone},
                    success:function(data) {
                        if(data == "yes") {
                            alert("该手机号已存在,请更换手机号");
                            $("#phone").val("请输入手机号").css("color", "#999").css("font-size", "12px");
                        }
                    }
                });
            });
            //注册时邮箱是否存在验证
            $("#email").blur(function() {
                var email = $("#email").val();
                //jquery发送AJAX请求
                $.ajax({
                    type:"post",
                    url:"user",
                    data:{method:"rejEmail", email:email},
                    success:function(data) {
                        if(data == "yes") {
                            alert("该邮箱已存在,请更换邮箱");
                            $("#email").val("请输入邮箱").css("color", "#999").css("font-size", "12px");
                        }
                    }
                });
            });
        });
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
                    <h1>新建一个用户</h1>
                    <div class="register-grids">
                        <form action="<%=request.getContextPath() %>/user?method=register" method="post"  id="form" > 
                                <div class="register-top-grid">
                                        <h3>设置个人信息</h3>
                                        <div>
                                            <span>用户名<label>*</label></span>
                                            <input type="text" name="username" value="请输入一个用户明名" id="username" class="in" autocomplete="off">
                                        </div>
                                        <div>
                                            <span>手机号<label>*</label></span>
                                            <input type="text" name="phone" value="请输入手机号" id="phone" class="in" autocomplete="off">
                                        </div>
                                        <div>
                                            <span>电子邮箱<label>*</label></span>
                                            <input type="text" name="email" value="请输入邮箱" id="email" class="in" autocomplete="off">
                                        </div>
                                        <div class="clear"> </div>
                                </div>
                                <div class="clear"> </div>
                                <div class="register-bottom-grid">
                                        <h3>设置密码</h3>
                                        <div>
                                            <span>密码<label>*</label></span>
                                            <input type="text" name="password" value="请输入密码" id="pwd1" class="in" autocomplete="off">
                                        </div>
                                        <div>
                                            <span>确认密码<label>*</label></span>
                                            <input type="text" value="确认密码" id="pwd2" class="in" autocomplete="off">
                                        </div>
                                        <div class="clear"> </div>
                                </div>
                                <div class="clear"> </div>
                                <input type="button" value="注&nbsp;&nbsp;册" id="btn" class="su">&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="reset" value="重&nbsp;&nbsp;置" id="res" class="su">
                        </form>
                    </div>
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