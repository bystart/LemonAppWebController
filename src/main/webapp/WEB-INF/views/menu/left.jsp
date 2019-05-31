<%--
  Created by IntelliJ IDEA.
  User: bystart
  Date: 19-5-27
  Time: 下午11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>左侧导航</title>
    <head>

    <style type="text/css">
    body{margin:0;padding:0;}
    html, body{height:100%;width: 100%;}
    img{border:none;}
    *{font-family:'微软雅黑';font-size:12px;color:#626262;}
    dl,dt,dd{display:block;margin:0;}
    a{text-decoration:none;}

    #bg{background-image:url(/resources/imgs/content/dotted.png);}
    .container{width:100%;height:100%;margin:auto;}

    /*left*/
    .leftsidebar_box{width:160px;height:auto !important;overflow:visible !important;position:fixed;height:100% !important;background-color:#4F4F4F;}
    .line{height:2px;width:100%;background-image:url(/resources/imgs/left/line_bg.png);background-repeat:repeat-x;}
    .leftsidebar_box dt{padding-left:40px;padding-right:10px;background-repeat:no-repeat;background-position:10px center;color:#f5f5f5;font-size:14px;position:relative;line-height:48px;cursor:pointer;}
    .leftsidebar_box dd{background-color:#4F4F4F;padding-left:40px;}
    .leftsidebar_box dd a{color:#f5f5f5;line-height:20px;}
    .leftsidebar_box dt img{position:absolute;right:10px;top:20px;}
    .system_log dt{background-image:url(/resources/imgs/left/system.png)}
    .custom dt{background-image:url(/resources/imgs/left/custom.png)}
    .channel dt{background-image:url(/resources/imgs/left/channel.png)}
    .app dt{background-image:url(/resources/imgs/left/app.png)}
    .cloud dt{background-image:url(/resources/imgs/left/cloud.png)}
    .syetem_management dt{background-image:url(/resources/imgs/left/syetem_management.png)}
    .source dt{background-image:url(/resources/imgs/left/source.png)}
    .statistics dt{background-image:url(/resources/imgs/left/statistics.png)}
    .leftsidebar_box dl dd:last-child{padding-bottom:10px;}

    </style>

    </head>

    <body id="bg">

    <div class="leftsidebar_box">
    <div class="line"></div>
    <dl class="system_log" >
    <dt onClick="changeImage()">账户信息<img src="/resources/imgs/left/select_xl01.png"></dt>
    <dd class="first_dd"><a href="#">本机信息</a></dd>
    <dd><a href="#">打卡记录</a></dd>
    <dd><a href="#">账户等级</a></dd>
    <dd><a href="#">操作记录</a></dd>
    </dl>

    <dl class="custom">
    <dt onClick="changeImage()">账户管理<img src="/resources/imgs/left/select_xl01.png"></dt>
    <dd class="first_dd"><a href="#">资料修改</a></dd>
    <dd><a href="#">打卡补签</a></dd>
    <dd><a href="#">密码修改</a></dd>
    </dl>

    <dl class="cloud">
    <dt>聊天通讯<img src="/resources/imgs/left/select_xl01.png"></dt>
    <dd class="first_dd"><a href="#">聊天室</a></dd>
    </dl>


    </div>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script type="text/javascript">
    $(".leftsidebar_box dt").css({"background-color":"#4F4F4F"});
    $(".leftsidebar_box dt img").attr("src","/resources/imgs/left/select_xl01.png");
    $(function(){
    $(".leftsidebar_box dd").hide();
    $(".leftsidebar_box dt").click(function(){
    $(".leftsidebar_box dt").css({"background-color":"#4F4F4F"})
    $(this).css({"background-color": "#4F4F4F"});
    $(this).parent().find('dd').removeClass("menu_chioce");
    $(".leftsidebar_box dt img").attr("src","/resources/imgs/left/select_xl01.png");
    $(this).parent().find('img').attr("src","/resources/imgs/left/select_xl.png");
    $(".menu_chioce").slideUp();
    $(this).parent().find('dd').slideToggle();
    $(this).parent().find('dd').addClass("menu_chioce");
    });
    })
    </script>

    </div>
    </body>
    </html>