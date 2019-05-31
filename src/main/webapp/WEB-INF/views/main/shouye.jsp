<%--
  Created by IntelliJ IDEA.
  User: bystart
  Date: 19-5-26
  Time: 上午12:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="/resources/layer/layer.js"></script>
    <style>
        *{
            margin: 0px;
            padding: 0px;
        }
        html,body{
            overflow-x:hidden;
            overflow-y: hidden;
            height: 100%;
            width: 100%;
        }
        iframe{
            border-style: none;
        }
        div{
            width: 100%;
            height: 35px;
            display: block;
            text-align: center;
            border-style:none;
            overflow: hidden;
            line-height: 35px;
            background: #1074e6;
            color: #fff;
            font-size: 16px;
            position: fixed;
            bottom: 0;
        }
        .userInfo{
            float: right;
            background: #005ab7;
            padding-left: 10px;
            width: 430px;
            text-align: center;
            right: 0;
        }
        ul,li{
            padding:0;
            margin:0;
            list-style:none
        }
        li{
            float: left;

        }
        #u1 span strong{
            color: #EEEE00;
        }
        #u2 span strong{
            color: #EEEE00;
        }
        span{
            padding-right: 10px;
            margin-left: 15px;
        }
        a{
            text-decoration:none;
            out-line: none;
            color: white;
        }
        a:hover,a:visited,a:active,a:link{
            text-decoration:none;
            out-line: none;
            color: white;
        }
        #s1,#s2{
            border-right:1px solid white;
        }
        #s2{
            margin-left: 24px;
        }
        ul{
            margin-left: 10px;
        }
        #u1{
            background-image: url(/resources/imgs/user/user1.png);
            background-repeat:no-repeat;
            background-position:left center;
            background-size:20px;
        }
        #u2{
            margin-left: 8px;
            background-image: url(/resources/imgs/user/complte1.png);
            background-repeat:no-repeat;
            background-position:left center;
            background-size:20px;
        }
        #u3{
            margin-left: 8px;
            background-image: url(/resources/imgs/user/quit.png);
            background-repeat:no-repeat;
            background-position:left center;
            background-size:20px;
        }
        #s1{
            margin-left: 22px;
        }
        #s3{
            margin-left: 21px;
        }
    </style>
</head>
<body>

    <iframe src="/menu/menu" height="96.5%" width="160px" style="margin: 0px;float: left;"></iframe>
    <iframe src="/resources/common/index.html" height="96.5%" width="91.66%" style="margin: 0px;position:fixed;" name="right" id="right"></iframe>


    <div>
        <div class="userInfo">
            <ul>
                <li id="u1">
                    <span id="s1">当前用户:<strong>${sessionScope.loginUser.username}</strong></span>
                </li>
                <li id="u2">
                    <span id="s2">在线人数 <strong id="humans">${loginNum}</strong> 人</span>
                </li>
                <li id="u3">
                    <span id="s3"><a href="/index/loginOut">退出系统</a></span>
                </li>
            </ul>
        </div>
        &copy;青檬小栈
    </div>

</body>

<script>
    /*
    * 每隔十秒钟获取当前在线人数
    * */
    $(function () {
        runEvery10Sec();
    });

    function runEvery10Sec() {
        // 1000 * 10 = 10 秒钟
        setTimeout( runEvery10Sec, 1000 * 10 );
        $.post("/index/humans",{},function(data){
            if (data.humans != 0){
                $("#humans").html(data.humans);
            }else{
                alert('您长时间未操作请重新登陆');
                window.location.href="/index/login";
            }
        });
    }

</script>
</html>
