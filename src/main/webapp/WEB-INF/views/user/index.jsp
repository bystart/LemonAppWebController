<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: bystart
  Date: 19-4-23
  Time: 下午9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>简单查找</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="/resources/layer/layer.js"></script>
    <script type="text/javascript">
        $(function () {
            //dblclick
           $(".tooltip-test").dblclick(function () {
               var id = $(this).children("td").html();
               layer.open({
                   title:'用户管理',
                   type: 2,
                   area: ['900px', '550px'],
                   fixed: false, //不固定
                   maxmin: true,
                   content: '/user/main?id='+id,
                   end: function () {
                       location.reload();
                   }
               });
           });
        });
    </script>
    <style>
        body{
            background-color: #F7F7F7;
        }

    </style>
</head>
<body>
    <div class="container">
        <table class="table table-hover">
            <caption>用户管理</caption>
            <thead>
            <tr>
                <th>id</th>
                <th>用户名</th>
                <th>密码</th>
                <th>性别</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${users}" varStatus="i" var="item">
                <tr class="tooltip-test" data-toggle="tooltip" title="用户信息" >
                    <td>${item.id}</td>
                    <td>${item.username}</td>
                    <td>${item.password}</td>
                    <td>${item.sex}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="alert alert-success">
            <a href="#" class="close" data-dismiss="alert">
                &times;
            </a>
            <strong>注意！</strong>双击条目实现增删改。
        </div>
    </div>

</body>
</html>
