<%--
  Created by IntelliJ IDEA.
  User: bystart
  Date: 19-4-23
  Time: 下午11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>用户操纵</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="../resources/layer/layer.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
    <%--CSS样式--%>
    <style type="text/css">
        .form-control{
            width: 90%;
        }

    </style>
    <%--JavaScript--%>
    <script type="text/javascript">
        $(function () {
            /*
            * 清空页面
            * */
            $("#reload").click(function () {
                $(':input','#ajaxForm')
                    .not(':button,:submit,:reset')   //将myform表单中input元素type为button、submit、reset、hidden排除
                    .val('')  //将input元素的value设为空值
                    .removeAttr('checked')
                    .removeAttr('checked') // 如果任何radio/checkbox/select inputs有checked or selected 属性，将其移除
            });
            /*
            * 修改用户
            * */
            $("#update").click(function () {
                $.ajax({
                    //几个参数需要注意一下
                    type: "POST",//方法类型
                    dataType: "json",//预期服务器返回的数据类型
                    url: "/user/update" ,//url
                    data: $('#ajaxForm').serialize(),
                    success: function (result) {
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
            });

        });

        /*
       * 关闭页面
       * */
        function closed(){
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
        }

        /*
        * 用户登陆
        * */
        function login() {
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/user/login" ,//url
                data: $('#ajaxForm').serialize(),
                success: function (result) {
                    layer.alert(result.msg, {
                        skin: 'layui-layer-molv'
                        ,closeBtn: 0
                        ,anim: 4 //动画类型
                    });
                },
                error : function() {
                    layer.alert('登陆异常', {
                        skin: 'layui-layer-lan'
                        ,closeBtn: 0
                        ,anim: 4 //动画类型
                    });
                }
            });
        }

    </script>
</head>
<body>

<div class="panel panel-info">
    <%--标题--%>
    <div class="panel-heading">
        <h3 class="panel-title">
            <div class="pull-right">
                <button type="button" class="btn btn-primary" id="close" onclick="closed()">关闭页面</button>
            </div>

                <button type="button" class="btn btn-success" id="addUser" onclick="login()">登陆</button>

        </h3>
    </div>
    <div class="panel-body">
        <form class="form-horizontal" id="ajaxForm" role="form">

            <div class="form-group">
                <label for="username" class="col-sm-2 control-label">用户名</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="username" id="username"
                           placeholder="请输入用户名" value="${user.username}">
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-2 control-label">密码</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" name="password" id="password"
                           placeholder="请输入密码" value="${user.password}">
                </div>
            </div>
        </form>
    </div>
</div>

</body>
</html>