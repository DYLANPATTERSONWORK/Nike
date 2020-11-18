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
        <title>Details</title>
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
        <!-- Owl Carousel Assets -->
        <link href="css/owl.carousel.css" rel="stylesheet">
        <script src="js/jquery-1.9.1.min.js"></script> 
             <!-- Owl Carousel Assets -->
            <!-- Prettify -->
            <script src="js/owl.carousel.js"></script>
                <script>
            $(document).ready(function() {
        
              $("#owl-demo").owlCarousel({
                items : 3,
                lazyLoad : true,
                autoPlay : true,
                navigation : true,
                navigationText : ["",""],
                rewindNav : false,
                scrollPerPage : false,
                pagination : false,
                paginationNumbers: false,
              });
        
            });
            </script>
           <!-- //Owl Carousel Assets -->
           <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	        <script type="text/javascript">
	        $(function(){
	            //商品图片只显示一张大图
	            $("#left_u img").css("display","none").filter(":eq(0)").show();
	            //鼠标经过小图时,大图位置切换图片
	            $("#left_d img").each(function(n) {
	                $(this).mouseover(function(){
	                    $("#left_u img").css("display","none").filter(":eq(" + n + ")").show();
	                });
	            });
	            
	            var quantity = $("#quantity");
	            var n = $("#n").html();//相当于JS中的innerHTML = 
	            //购买数量减事件处理
	            $("#minus").click(function() {
	                var num = parseInt(quantity.val());
	                if(num > 1) {
	                    quantity.val(num - 1);
	                }
	            });
	            //购买数量加事件处理
	            $("#plus").click(function() {
	                var num = parseInt(quantity.val());
	                if(num < n) {
	                    quantity.val(num + 1);
	                }
	            });
	            //购买数量光标失去焦点事件:判断输入的数字是否大于库存数量,或者小于1
	            quantity.blur(function() {
	                var num = parseInt(quantity.val());
	                if(num > n) {
	                    alert("最大购买数量" + n + "个");
	                    $(this).val(n);
	                }
	                if(num < 1) {
	                    alert("最大购买数量必须大于1个");
	                    $(this).val(1);
	                }
	                
	            });
	            
	            var form = $("#form");
	            //立即购买事件
	            $("#btn1").click(function() {
	                form.attr("action", "buy_now");
	                form.submit();
	            });
	            //加入购物车事件
	            $("#btn2").click(function(){
	                $.ajax({
	                    type:"post",
	                    url:"cart",
	                    data:{method:"add", id:${product.id}, quantity:$("#quantity").val()},
	                    success:function(data) {
	                        if(data == "yes") {
	                            alert("添加购物车成功");
	                            //页面强制刷新,用于显示或更改购物中心的商品记录数
	                            window.location.reload();
	                        }
	                        else {
	                            alert("您还没有登录,请先登录");
	                            //强制页面跳转
	                            window.location.href = "<%=request.getContextPath()%>/user?method=loginInput";
	                        }
	                    }
	                });
	            });
	        });
	        
	    </script>
	    <script>
		    function shareTo(stype){
		        var ftit = '';
		        var flink = '';
		        var lk = '';
		        //获取文章标题
		        ftit = $('.pctitle').text();
		        //获取网页中内容的第一张图片
		        flink = $('.pcdetails img').eq(0).attr('src');
		        if(typeof flink == 'undefined'){
		            flink='';
		        }
		        //当内容中没有图片时，设置分享图片为网站logo
		        if(flink == ''){
		            lk = 'http://'+window.location.host+'/static/images/logo.png';
		        }
		        //如果是上传的图片则进行绝对路径拼接
		        if(flink.indexOf('/uploads/') != -1) {
		            lk = 'http://'+window.location.host+flink;
		        }
		        //百度编辑器自带图片获取
		        if(flink.indexOf('ueditor') != -1){
		            lk = flink;
		        }
		        //qq空间接口的传参
		        if(stype=='qzone'){
		            window.open('https://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url='+document.location.href+'?sharesource=qzone&title='+ftit+'&pics='+lk+'&summary='+document.querySelector('meta[name="description"]').getAttribute('content'));
		        }
		        //新浪微博接口的传参
		        if(stype=='sina'){
		            window.open('http://service.weibo.com/share/share.php?url='+document.location.href+'?sharesource=weibo&title='+ftit+'&pic='+lk+'&appkey=2706825840');
		        }
		        //qq好友接口的传参
		        if(stype == 'qq'){
		            window.open('http://connect.qq.com/widget/shareqq/index.html?url='+document.location.href+'?sharesource=qzone&title='+ftit+'&pics='+lk+'&summary='+document.querySelector('meta[name="description"]').getAttribute('content')+'&desc=php自学网，一个web开发交流的网站');
		        }
		        //生成二维码给微信扫描分享
		        if(stype == 'wechat'){
		            window.open('inc/qrcode_img.php?url=http://zixuephp.net/article-1.html');
		        }
		    }
	    </script>
    </head>
    <body>
        <!---start-wrap---->
            <!---start-header---->
                <jsp:include page="head_n.jsp"></jsp:include>
            <!---//End-header---->
        <!--- start-content---->
        <div class="content details-page">
            <!---start-product-details--->
            <div class="product-details">
                <div class="wrap">
                    <ul class="product-head">
                        <li><a href="index.html">Home</a> <span>::</span></li>
                        <li class="active-page"><a href="#">${product.name }</a></li>
                        <div class="clear"> </div>
                    </ul>
                <!----details-product-slider--->
                <!-- Include the Etalage files -->
                    <link rel="stylesheet" href="css/etalage.css">
                    <script src="js/jquery.etalage.min.js"></script>
                <!-- Include the Etalage files -->
                <script>
                        jQuery(document).ready(function($){
            
                            $('#etalage').etalage({
                                thumb_image_width: 300,
                                thumb_image_height: 400,
                                source_image_width: 900,
                                source_image_height: 1000,
                                show_hint: true,
                                click_callback: function(image_anchor, instance_id){
                                    alert('Callback example:\nYou clicked on an image with the anchor: "'+image_anchor+'"\n(in Etalage instance: "'+instance_id+'")');
                                }
                            });
                            // This is for the dropdown list example:
                            $('.dropdownlist').change(function(){
                                etalage_show( $(this).find('option:selected').attr('class') );
                            });

                    });
                </script>
                <!----//details-product-slider--->
                <div class="details-left">
                    <div class="details-left-slider">
                        <ul id="etalage">

                            <c:forEach items="${product.imgs }" var="img">
                                <li>
	                                <a href="optionallink.html">
	                                    <img class="etalage_thumb_image" src="<%=request.getContextPath()%>/image/${img.name}" height="55px" />
	                                    <img class="etalage_source_image" src="<%=request.getContextPath()%>/image/${img.name}" height="360px" />
	                                </a>
                                </li>
                            </c:forEach>
                            
                            
                        </ul>
                    </div>
                    <div class="details-left-info">
                        <div class="details-right-head">
                        <h1>${product.name }</h1>
                        <ul class="pro-rate">
                            <li><a class="product-rate" href="#"> <label> </label></a> <span> </span></li>
                            <li><a href="#">0 Review(s) Add Review</a></li>
                        </ul>
                        <p class="product-detail-info">${product.describe } </p>
                        
                        <div class="product-more-details">
                            <ul class="price-avl">
                                <li class="price"><span>&yen; <fmt:formatNumber type="number" value="${product.price * product.discount + 100}" ></fmt:formatNumber></span><label>&yen; <fmt:formatNumber type="number" value="${product.price * product.discount }" ></fmt:formatNumber></label></li>
                                
                                <div class="clear"> </div>
                            </ul>
                            <ul class="">
                                <li>
	                                <span class="lis">购买数量</span>
	                                <input type="button" value="-" id="minus">
	                                <input type="text" value="1" name="quantity" id="quantity">
	                                <input type="button" value="+" id="plus">
	                                <span class="lis">件(库存</span><span class="lis" id="n">${product.inventory }</span><span class="lis">件)</span>
                                </li>
                                <br>
	                            <li>
	                                <input type="button" value="立即购买" id="btn1">
	                                <input type="button" value="加入购物车" id="btn2">
	                            </li>
                            </ul>
                            <br>

                            <ul class="product-share">
                                  <div class="fl">分享到：</div>
                                    <li>
                                    <div onclick="shareTo('qzone')">     
                                        <img src="http://zixuephp.net/static/images/qqzoneshare.png" width="30"> 
                                    </div>
                                  </li>
                                    <li>
                                    <div onclick="shareTo('qq')">     
                                        <img src="http://zixuephp.net/static/images/qqshare.png" width="32"> 
                                    </div>
                                    </li>
                                    <li>
                                    <div onclick="shareTo('sina')">     
                                        <img src="http://zixuephp.net/static/images/sinaweiboshare.png" width="36"> 
                                    </div>
                                    </li>
                                    <li>
                                    <div onclick="shareTo('wechat')">     
                                        <img src="http://zixuephp.net/static/images/wechatshare.png" width="32"> 
                                    </div>
                                    </li>
                                  <div class="clear"> </div>
                            </ul>
                        </div>
                    </div>
                    </div>
                    <div class="clear"> </div>
                </div>
                <div class="details-right">
                    
                </div>
                <div class="clear"> </div>
            </div>
            <!----product-rewies---->
            <div class="product-reviwes">
                <div class="wrap">
                <!--vertical Tabs-script-->
                <!---responsive-tabs---->
                    <script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
                    <script type="text/javascript">
                        $(document).ready(function () {
                             $('#horizontalTab').easyResponsiveTabs({
                                    type: 'default', //Types: default, vertical, accordion           
                                    width: 'auto', //auto or any width like 600px
                                    fit: true,   // 100% fit in a container
                                    closed: 'accordion', // Start closed if in accordion view
                                    activate: function(event) { // Callback function if tab is switched
                                    var $tab = $(this);
                                    var $info = $('#tabInfo');
                                    var $name = $('span', $info);
                                        $name.text($tab.text());
                                        $info.show();
                                    }
                                });
                                                    
                             $('#verticalTab').easyResponsiveTabs({
                                    type: 'vertical',
                                    width: 'auto',
                                    fit: true
                                 });
                         });
                    </script>
                <!---//responsive-tabs---->
                <!--//vertical Tabs-script-->
                <!--vertical Tabs-->
                <div id="verticalTab">
                    <ul class="resp-tabs-list">
                        <li>详细信息</li>
                    </ul>
                    <div class="resp-tabs-container vertical-tabs">
                        <div>
                            <h3>商品细节介绍</h3>
                            <p>${product.describe }</p>
                            <ul>
	                            <c:forEach items="${product.imgs }" var="img">
	                                <li>
	                                        <img class="" src="<%=request.getContextPath()%>/image/${img.name}" width="560px" align="center"/>
	                                </li>
	                            </c:forEach>
                            </ul>
                        </div>
                    </div>
            </div>
            <div class="clear"> </div>
                           
                <!----//End-img-cursual---->
                </div>
                <div class="clear"> </div>
            </div>
            <!--- //End-similar-products--->
            </div>
            </div>
            <div class="clear"> </div>
            <!--//vertical Tabs-->
            <!----//product-rewies---->
            <!---//End-product-details--->
            </div>
        </div>
        <div class="bottom-grids">
            <div class="bottom-top-grids">
                <div class="wrap">
                    <div class="bottom-top-grid">
                        <h4>得到帮助</h4>
                        <ul>
                            <li><a href="contact.html">联系我们</a></li>
                            <li><a href="#">购物</a></li>
                            <li><a href="#">耐克定制</a></li>
                            <li><a href="#">Nike+</a></li>
                        </ul>
                    </div>
                    <div class="bottom-top-grid">
                        <h4>订单</h4>
                        <ul>
                            <li><a href="#">支付选项</a></li>
                            <li><a href="#">装运与交付</a></li>
                            <li><a href="#">退货</a></li>
                        </ul>
                    </div>
                    <div class="bottom-top-grid last-bottom-top-grid">
                        <h4>登记表</h4>
                        <p>创建一个帐户来管理你用耐克做的一切，从你的购物偏好到你的耐克+活动</p>
                        <a class="learn-more" href="#">了解更多</a>
                    </div>
                    <div class="clear"> </div>
                </div>
            </div>
            <div class="bottom-bottom-grids">
                <div class="wrap">
                    <div class="bottom-bottom-grid">
                        <h6>电子邮件注册</h6>
                        <p>成为第一个了解新产品和特别优惠的人</p>
                        <a class="learn-more" href="#">现在就注册</a>
                    </div>
                    <div class="bottom-bottom-grid">
                        <h6>礼物卡</h6>
                        <p>送合适的礼物</p>
                        <a class="learn-more" href="#">看卡片</a>
                    </div>
                    <div class="bottom-bottom-grid last-bottom-bottom-grid">
                        <h6>你附近的商店</h6>
                        <p>找到耐克零售商店或授权零售商</p>
                        <a class="learn-more" href="#">探究</a>
                    </div>
                    <div class="clear"> </div>
                </div>
            </div>
        </div>
        <!--- //End-content---->
        <!---start-footer---->
        <jsp:include page="footer_n.jsp"></jsp:include>
        <!---//End-footer---->
        <!---//End-wrap---->
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
