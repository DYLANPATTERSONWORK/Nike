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
        <title>Home</title>
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
        <script src="js/jquery.min.js"></script>
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
        <!---slider---->
        <link rel="stylesheet" href="css/slippry.css">
        <script src="js/jquery-ui.js" type="text/javascript"></script>
        <script src="js/scripts-f0e4e0c2.js" type="text/javascript"></script>
        <script>
              jQuery('#jquery-demo').slippry({
              // general elements & wrapper
              slippryWrapper: '<div class="sy-box jquery-demo" />', // wrapper to wrap everything, including pager
              // options
              adaptiveHeight: false, // height of the sliders adapts to current slide
              useCSS: false, // true, false -> fallback to js if no browser support
              autoHover: false,
              transition: 'fade'
            });
        </script>
        <!----start-pricerage-seletion---->
        <script type="text/javascript" src="js/jquery-ui.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
        <script type='text/javascript'>//<![CDATA[
            $(window).load(function(){
             $( "#slider-range" ).slider({
                        range: true,
                        min: 0,
                        max: 500,
                        values: [ 100, 400 ],
                        slide: function( event, ui ) {  $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
                        }
             });
            $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) + " - $" + $( "#slider-range" ).slider( "values", 1 ) );

            });//]]>
        </script>
        <!----//End-pricerage-seletion---->
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
    </head>
    <body>
        <!---start-wrap---->
            <!---start-header---->
            <jsp:include page="head_n.jsp"></jsp:include>
            <!---//End-header---->
            <!----start-bottom-header---->
                <div class="header-bottom">
                    <div class="wrap">
                    <!-- start header menu -->
                            <ul class="megamenu skyblue">
                                <li class="grid"><a class="color2" href="#">男士</a>
                                    <div class="megapanel">
                                        <div class="row">
                                            <div class="col1">
                                                <div class="h_nav">
                                                    <h4>流行</h4>
                                                    <ul>
                                                        <li><a href="products.html">新品上市</a></li>
                                                        <li><a href="products.html">男士</a></li>
                                                        <li><a href="products.html">女士</a></li>
                                                        <li><a href="products.html">配饰</a></li>
                                                        <li><a href="products.html">童装</a></li>
                                                        <li><a href="products.html">登录</a></li>
                                                    </ul>   
                                                </div>
                                                <div class="h_nav">
                                                    <h4 class="top">男士</h4>
                                                    <ul>
                                                        <li><a href="products.html">新品上市</a></li>
                                                        <li><a href="products.html">男士</a></li>
                                                        <li><a href="products.html">女士</a></li>
                                                        <li><a href="#">配饰</a></li>
                                                        <li><a href="#">童装</a></li>
                                                        <li><a href="#">风格的视频</a></li>
                                                    </ul>   
                                                </div>
                                            </div>
                                            <div class="col1">
                                                <div class="h_nav">
                                                    <h4>类型区</h4>
                                                    <ul>
                                                        <li><a href="products.html">男士</a></li>
                                                        <li><a href="products.html">女士</a></li>
                                                        <li><a href="products.html">配饰</a></li>
                                                        <li><a href="products.html">童装</a></li>
                                                        <li><a href="products.html">旗下品牌</a></li>
                                                    </ul>   
                                                </div>                          
                                            </div>
                                            <div class="col1">
                                                <div class="h_nav">
                                                    <h4>类型区</h4>
                                                    <ul>
                                                        <li><a href="products.html">男士</a></li>
                                                        <li><a href="products.html">女士</a></li>
                                                        <li><a href="products.html">配饰</a></li>
                                                        <li><a href="products.html">童装</a></li>
                                                        <li><a href="products.html">旗下品牌</a></li>
                                                    </ul>   
                                                </div>                          
                                            </div>
                                            <div class="col1 men">
                                                <div class="men-pic">
                                                    <img src="images/men.png" title="" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </li>
                                <li class="active grid"><a class="color4" href="#">女士</a>
                                    <div class="megapanel">
                                        <div class="row">
                                            <div class="col1">
                                                <div class="h_nav">
                                                    <h4>店铺</h4>
                                                    <ul>
                                                        <li><a href="products.html">新品上市</a></li>
                                                        <li><a href="products.html">男士</a></li>
                                                        <li><a href="products.html">女士</a></li>
                                                        <li><a href="products.html">配饰</a></li>
                                                        <li><a href="products.html">童装</a></li>
                                                        <li><a href="products.html">旗下品牌</a></li>
                                                    </ul>   
                                                </div>  
                                                <div class="h_nav">
                                                    <h4>帮助</h4>
                                                    <ul>
                                                        <li><a href="products.html">动态</a></li>
                                                        <li><a href="products.html">出售</a></li>
                                                        <li><a href="products.html">风格的视频</a></li>
                                                        <li><a href="products.html">配饰</a></li>
                                                        <li><a href="products.html">童装</a></li>
                                                        <li><a href="products.html">风格的视频</a></li>
                                                    </ul>   
                                                </div>                          
                                            </div>
                                            <div class="col1">
                                                <div class="h_nav">
                                                    <h4>我的公司</h4>
                                                    <ul>
                                                        <li><a href="products.html">动态</a></li>
                                                        <li><a href="products.html">出售</a></li>
                                                        <li><a href="products.html">风格的视频</a></li>
                                                        <li><a href="products.html">配饰</a></li>
                                                        <li><a href="products.html">童装</a></li>
                                                        <li><a href="products.html">风格的视频</a></li>
                                                    </ul>   
                                                </div>                                              
                                            </div>
                                            <div class="col1">
                                                <div class="h_nav">
                                                    <h4>账户</h4>
                                                    <ul>
                                                        <li><a href="products.html">登录</a></li>
                                                        <li><a href="products.html">申请一个新帐号</a></li>
                                                        <li><a href="products.html">创造愿望列表</a></li>
                                                        <li><a href="products.html">真正的消费单品</a></li>
                                                        <li><a href="products.html">旗下品牌</a></li>
                                                        <li><a href="products.html">创造愿望列表</a></li>
                                                    </ul>   
                                                </div>                      
                                            </div>
                                            <div class="col1">
                                                <div class="h_nav">
                                                    <h4>我的公司</h4>
                                                    <ul>
                                                        <li><a href="products.html">动态</a></li>
                                                        <li><a href="products.html">出售</a></li>
                                                        <li><a href="products.html">风格的视频</a></li>
                                                        <li><a href="products.html">配饰</a></li>
                                                        <li><a href="products.html">童装</a></li>
                                                        <li><a href="products.html">风格的视频</a></li>
                                                    </ul>   
                                                </div>
                                            </div>
                                            <div class="col1">
                                                <div class="h_nav">
                                                    <h4>流行</h4>
                                                    <ul>
                                                        <li><a href="products.html">新品上市</a></li>
                                                        <li><a href="products.html">男士</a></li>
                                                        <li><a href="products.html">女士</a></li>
                                                        <li><a href="products.html">配饰</a></li>
                                                        <li><a href="products.html">童装</a></li>
                                                        <li><a href="products.html">风格的视频</a></li>
                                                    </ul>   
                                                </div>
                                            </div>
                                            <div class="col1 women">
                                                <div class="women-pic">
                                                    <img src="images/women.png" title="" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col2"></div>
                                            <div class="col1"></div>
                                            <div class="col1"></div>
                                            <div class="col1"></div>
                                            <div class="col1"></div>
                                        </div>
                                        </div>
                                    </li>               
                                    <li><a class="color5" href="#">童装</a>
                                    <div class="megapanel">
                                        <div class="row">
                                            <div class="col1">
                                                <div class="h_nav">
                                                    <h4>流行</h4>
                                                    <ul>
                                                        <li><a href="products.html">新品上市</a></li>
                                                        <li><a href="products.html">男士</a></li>
                                                        <li><a href="products.html">女士</a></li>
                                                        <li><a href="products.html">配饰</a></li>
                                                        <li><a href="products.html">童装</a></li>
                                                        <li><a href="products.html">登录</a></li>
                                                    </ul>   
                                                </div>
                                                <div class="h_nav">
                                                    <h4 class="top">男士</h4>
                                                    <ul>
                                                        <li><a href="products.html">新品上市</a></li>
                                                        <li><a href="products.html">男士</a></li>
                                                        <li><a href="products.html">女士</a></li>
                                                        <li><a href="products.html">配饰</a></li>
                                                        <li><a href="products.html">童装</a></li>
                                                        <li><a href="products.html">风格的视频</a></li>
                                                    </ul>   
                                                </div>
                                            </div>
                                            <div class="col1">
                                                <div class="h_nav">
                                                    <h4>类型区</h4>
                                                    <ul>
                                                        <li><a href="products.html">男士</a></li>
                                                        <li><a href="products.html">女士</a></li>
                                                        <li><a href="products.html">配饰</a></li>
                                                        <li><a href="products.html">童装</a></li>
                                                        <li><a href="products.html">旗下品牌</a></li>
                                                    </ul>   
                                                </div>                          
                                            </div>
                                            <div class="col1 kids">
                                                <div class="kids-pic">
                                                    <img src="images/kids1.png" title="" />
                                                </div>
                                            </div>
                                            <div class="col1"></div>
                                            <div class="col1"></div>
                                            <div class="col1"></div>
                                            <div class="col1"></div>
                                        </div>
                                    </div>
                                    </li>
                                    <li><a class="color6" href="#">运动</a>
                                    <div class="megapanel">
                                        <div class="row">
                                            <div class="col1">
                                                <div class="h_nav">
                                                    <h4>店铺</h4>
                                                    <ul>
                                                        <li><a href="products.html">新品上市</a></li>
                                                        <li><a href="products.html">男士</a></li>
                                                        <li><a href="products.html">女士</a></li>
                                                        <li><a href="products.html">配饰</a></li>
                                                        <li><a href="products.html">童装</a></li>
                                                        <li><a href="products.html">旗下品牌</a></li>
                                                    </ul>   
                                                </div>  
                                                <div class="h_nav">
                                                    <h4 class="top">我的公司</h4>
                                                    <ul>
                                                        <li><a href="products.html">动态</a></li>
                                                        <li><a href="products.html">出售</a></li>
                                                        <li><a href="products.html">风格的视频</a></li>
                                                        <li><a href="products.html">配饰</a></li>
                                                        <li><a href="products.html">童装</a></li>
                                                        <li><a href="products.html">风格的视频</a></li>
                                                    </ul>   
                                                </div>                                              
                                            </div>
                                            <div class="col1">
                                                <div class="h_nav">
                                                    <h4>男士</h4>
                                                    <ul>
                                                        <li><a href="products.html">新品上市</a></li>
                                                        <li><a href="products.html">男士</a></li>
                                                        <li><a href="products.html">女士</a></li>
                                                        <li><a href="products.html">配饰</a></li>
                                                        <li><a href="products.html">童装</a></li>
                                                        <li><a href="products.html">风格的视频</a></li>
                                                    </ul>   
                                                </div>                      
                                            </div>
                                            <div class="col1">
                                                <div class="h_nav">
                                                    <h4>帮助</h4>
                                                    <ul>
                                                        <li><a href="products.html">动态</a></li>
                                                        <li><a href="products.html">出售</a></li>
                                                        <li><a href="products.html">风格的视频</a></li>
                                                        <li><a href="products.html">配饰</a></li>
                                                        <li><a href="products.html">童装</a></li>
                                                        <li><a href="products.html">风格的视频</a></li>
                                                    </ul>   
                                                </div>                          
                                            </div>
                                            <div class="col1 sports">
                                                <div class="sports-pic">
                                                    <img src="images/sport.png" title="" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col2"></div>
                                            <div class="col1"></div>
                                            <div class="col1"></div>
                                            <div class="col1"></div>
                                            <div class="col1"></div>
                                        </div>
                                    </div>
                                    </li>
                                    <li><a class="color7" href="#">耐克运动装</a>
                                    <div class="megapanel">
                                        <div class="row">
                                            <div class="col1">
                                                <div class="h_nav">
                                                    <h4>店铺</h4>
                                                    <ul>
                                                        <li><a href="products.html">新品上市</a></li>
                                                        <li><a href="products.html">男士</a></li>
                                                        <li><a href="products.html">女士</a></li>
                                                        <li><a href="products.html">配饰</a></li>
                                                        <li><a href="products.html">童装</a></li>
                                                        <li><a href="products.html">旗下品牌</a></li>
                                                    </ul>   
                                                </div>      
                                                <div class="h_nav">
                                                    <h4>我的公司</h4>
                                                    <ul>
                                                        <li><a href="products.html">动态</a></li>
                                                        <li><a href="products.html">出售</a></li>
                                                        <li><a href="products.html">风格的视频</a></li>
                                                        <li><a href="products.html">配饰</a></li>
                                                        <li><a href="products.html">童装</a></li>
                                                        <li><a href="products.html">风格的视频</a></li>
                                                    </ul>   
                                                </div>                  
                                            </div>
                                            <div class="col1">
                                                <div class="h_nav">
                                                    <h4>帮助</h4>
                                                    <ul>
                                                        <li><a href="products.html">动态</a></li>
                                                        <li><a href="products.html">出售</a></li>
                                                        <li><a href="products.html">风格的视频</a></li>
                                                        <li><a href="products.html">配饰</a></li>
                                                        <li><a href="products.html">童装</a></li>
                                                        <li><a href="products.html">风格的视频</a></li>
                                                    </ul>   
                                                </div>                          
                                            </div>
                                            <div class="col1">
                                                <div class="h_nav">
                                                    <h4>我的公司</h4>
                                                    <ul>
                                                        <li><a href="products.html">动态</a></li>
                                                        <li><a href="products.html">出售</a></li>
                                                        <li><a href="products.html">风格的视频</a></li>
                                                        <li><a href="products.html">配饰</a></li>
                                                        <li><a href="products.html">童装</a></li>
                                                        <li><a href="products.html">风格的视频</a></li>
                                                    </ul>   
                                                </div>                                              
                                            </div>
                                            <div class="col1">
                                                <div class="h_nav">
                                                    <h4>账户</h4>
                                                    <ul>
                                                        <li><a href="products.html">登录</a></li>
                                                        <li><a href="products.html">申请一个新帐号</a></li>
                                                        <li><a href="products.html">创造愿望列表</a></li>
                                                        <li><a href="products.html">真正的消费单品</a></li>
                                                        <li><a href="products.html">旗下品牌</a></li>
                                                        <li><a href="products.html">创造愿望列表</a></li>
                                                    </ul>   
                                                </div>                      
                                            </div>
                                            <div class="col1 nike">
                                                <div class="nike-pic">
                                                    <img src="images/nike.png" title="" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col2"></div>
                                            <div class="col1"></div>
                                            <div class="col1"></div>
                                            <div class="col1"></div>
                                            <div class="col1"></div>
                                        </div>
                                        </div>
                                    </li>
                                    <li><a class="color8" href="#">耐克定制</a>
                                    <div class="megapanel">
                                        <div class="row">
                                            <div class="col1">
                                                <div class="h_nav">
                                                    <h4>类型区</h4>
                                                    <ul>
                                                        <li><a href="products.html">男士</a></li>
                                                        <li><a href="products.html">女士</a></li>
                                                        <li><a href="products.html">配饰</a></li>
                                                        <li><a href="products.html">童装</a></li>
                                                        <li><a href="products.html">旗下品牌</a></li>
                                                    </ul>   
                                                </div>                          
                                            </div>
                                            <div class="col1">
                                                <div class="h_nav">
                                                    <h4>流行</h4>
                                                    <ul>
                                                        <li><a href="products.html">新品上市</a></li>
                                                        <li><a href="products.html">男士</a></li>
                                                        <li><a href="products.html">童装</a></li>
                                                        <li><a href="products.html">配饰</a></li>
                                                        <li><a href="products.html">登录</a></li>
                                                    </ul>   
                                                </div>
                                                <div class="h_nav">
                                                    <h4 class="top">男士</h4>
                                                    <ul>
                                                        <li><a href="products.html">新品上市</a></li>
                                                        <li><a href="products.html">配饰</a></li>
                                                        <li><a href="products.html">童装</a></li>
                                                        <li><a href="products.html">风格的视频</a></li>
                                                    </ul>   
                                                </div>
                                            <div class="col1"></div>
                                            <div class="col1"></div>
                                            <div class="col1"></div>
                                            <div class="col1"></div>
                                        </div>
                                    </div>
                                    </div>
                                    </li>
                            </ul>

                    </div>
                </div>
                </div>
                <!----//End-bottom-header---->
        <!----start-image-slider---->
        <div class="img-slider">
            <div class="wrap">
            <ul id="jquery-demo">

        <%
            for(int i = 1; i <= 2; i++) {
        %>
              <li>
                <a href="#">
                  <img src="<%=request.getContextPath()%>/image/band0<%= i %>.jpg" width="1080px" alt="" />
                </a>
                <div class="slider-detils">
                    <h3>双11五折抢先购<label>会员专属福利</label></h3>
                    <span>JUST DO IT.</span>
              </div>
              </li>
        <%
            }
        %>
            </ul>
            </div>
        </div>
        <div class="clear"> </div>
        <!----//End-image-slider---->
        <!--- start-content---->
        <div class="content">
            <div class="wrap">
                <div class="content-right">
                    <div class="product-grids">
                    
                            <c:forEach items="${products }" var="product" >
                            <div onclick="" class="product-grid fade" >
                            <div class="product-grid-head">
                                <div class="block">
                                    <span class="s3">${product.sales }</span><span class="s2">次购买</span>
                                </div>
                            </div>
                            <div class="product-pic">
                                <a href="product?method=item&id=${product.id }"><img src="<%=request.getContextPath()%>/image/${product.imgs[0].name }" title="${product.name }" /></a>
                                <p>
                                <a href="product?method=item&id=${product.id }">${product.name }</a>
                                <span>${product.describe }</span>
                                </p>
                            </div>
                            <div class="product-info">
                                <div class="product-info-cust">
                                    <a href="product?method=item&id=${product.id }">查看详情</a>
                                </div>
                                <div class="product-info-price">
                                    <a href="">&yen; <fmt:formatNumber type="number" value="${product.price * product.discount }" ></fmt:formatNumber></a>
                                </div>
                                <div class="clear"> </div>
                            </div>
                            <div class="more-product-info">
                                <span> </span>
                            </div>
                        </div>
                        </c:forEach>
                        
                        <div class="clear"> </div>
                    </div>
                </div>
                <div class="clear"> </div>
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
        
        <!---start-footer---->
        <jsp:include page="footer_n.jsp"></jsp:include>
        <!---//End-footer---->
        <!---//End-wrap---->
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
