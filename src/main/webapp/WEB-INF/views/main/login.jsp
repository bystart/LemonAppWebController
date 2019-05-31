<%--
  Created by IntelliJ IDEA.
  User: bystart
  Date: 19-5-28
  Time: 下午7:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>登陆</title>
    <meta name="description" content="particles.js is a lightweight JavaScript library for creating particles.">
    <meta name="author" content="Vincent Garreau">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" media="screen" href="/resources/common/login/login.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="../resources/layer/layer.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
</head>
<body>

<div id="particles-js" style="display: flex;align-items: center;justify-content: center">
    <canvas class="particles-js-canvas-el" width="1920" height="878" style="width: 100%; height: 100%;"></canvas></div>
<div class="login-page">
    <form id="userForm" method="post" name="userForm" >
        <div class="login-content">
            <div class="login-tit">登录</div>
            <div class="login-input">
                <input type="text" name="username" placeholder="用户名">
            </div>
            <div class="login-input">
                <input type="password"  name="password" id="password" placeholder="密码">
            </div>
            <div class="login-btn">
                <div class="login-btn-left">
                    <span onclick="login()">登录</span>
                </div>
    <%--            <div class="login-btn-right" onclick="changeImg()">--%>
    <%--                <img src="/resources/common/login/check.png" alt="" id="picture"> 记住密码--%>
    <%--            </div>--%>
            </div>
        </div>
    </form>
</div>


<!-- scripts -->
<script src="/resources/common/login/particles.js"></script>
<script src="/resources/common/login/app.js"></script>
<script>

    $(function () {
        /*
        * 防止网页后退
        * */
        if (window.history && window.history.pushState) {
            $(window).on('popstate', function () {
                window.history.pushState('forward', null, '#');
                window.history.forward(1);
            });
        }
        window.history.pushState('forward', null, '#'); //在IE中必须得有这两行
        window.history.forward(1);
        /*
             * 表单验证
             * */
        $.validator.setDefaults({
            submitHandler: function() {
                alert("提交事件!");
            }
        });
        $("#userForm").validate({
            onsubmit:true,// 是否在提交是验证
            onfocusout:false,// 是否在获取焦点时验证
            onkeyup :false,// 是否在敲击键盘时验证

            rules: {　　　　//规则
                username: {　　//要对应相对应的input中的name属性
                    required: true
                },
                password: {
                    required: true
                },
                sex: {
                    required: true
                }

            },
            messages: {　　　　//验证错误信息
                username: {
                    required: "请输入用户名"
                },
                password: {
                    required: "请输入密码"
                }
            },
            showErrors: function (errorMap, errorList) {
                var msg = "";
                $.each(errorList, function (i, v) {
                    //msg += (v.message + "\r\n");
                    //在此处用了layer的方法,显示效果更美观
                    layer.tips("<strong style='color:red;font-size: 16px;'>"+v.message+"</strong>", v.element, {
                        tips: [1, '#0FA6D8'], //还可配置颜色
                        time: 2000
                    });
                    return false;
                });

            },
            submitHandler: function(form) { //通过之后回调
                //进行ajax传值
                $.ajax({
                    //几个参数需要注意一下
                    type: "POST",//方法类型
                    dataType: "json",//预期服务器返回的数据类型
                    url: "/index/doLogin" ,//url
                    data: $('#userForm').serialize(),
                    success: function (result) {
                        if (result.msg == '登陆成功') {
                            window.location.href = "/index/main";
                            return;
                        }
                        layer.alert(result.msg, {
                            skin: 'layui-layer-molv'
                            ,closeBtn: 0
                            ,anim: 4 //动画类型
                        });
                    },
                    error : function() {
                        layer.alert('提交异常', {
                            skin: 'layui-layer-lan'
                            ,closeBtn: 0
                            ,anim: 4 //动画类型
                        });
                    }
                });
            },
            invalidHandler: function(form, validator) {return false;}
        });
    });
    /*
     * 用户登陆
     * */
    function login() {
        $("#userForm").submit();
    }
    function changeImg(){
        let pic = document.getElementById('picture');
        console.log(pic.src)
        if(pic.getAttribute("src",2) =="/resources/common/login/check.png"){
            pic.src ="/resources/common/login/checked.png"
        }else{
            pic.src ="/resources/common/login/check.png"
        }
    }
</script>

</body>
</html>