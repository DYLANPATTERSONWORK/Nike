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
</head>
<body>

<div class="footer">
   <div class="wrap">
       <div class="footer-left">
           <ul>
               <li><a href="#">开发者</a> <span> </span></li>
               <li><a href="#">浦迪</a> <span> </span></li>
               <li><a href="#">杨立民</a> <span> </span></li>
               <li><a href="#">王雪娇</a> <span> </span></li>
<%--               <li><a href="#">南宁</a> <span> </span></li>--%>
<%--               <li><a href="#">王力</a> <span> </span></li>--%>
<%--               <li><a href="#">任小龙</a> <span> </span></li>--%>
               <div class="clear"> </div>
           </ul>
       </div>
       <div class="footer-right">
           <p>&copy;&nbsp;版权所有&nbsp;2020-2022</p>
           <script type="text/javascript">
               $(document).ready(function() {
                   /*
                   var defaults = {
                       containerID: 'toTop', // fading element id
                       containerHoverID: 'toTopHover', // fading element hover id
                       scrollSpeed: 1200,
                       easingType: 'linear'
                   };
                   */

                   $().UItoTop({ easingType: 'easeOutQuart' });

               });
           </script>
       <a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 1;"></span></a>
        </div>
        <div class="clear"> </div>
    </div>
</div>

</body>
</html>