<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Language" content="zh-cn" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Comet4J Demo</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css" />
<script type="text/javascript" src="/resources/js/comet4j.js"></script>
<script type="text/javascript" src="/resources/js/talk.js"></script>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
</head>
<body onload="init()">

<div id="statebar">
连接状态：<span id="workStyle"></span>；
<strong>青檬APP子系统通讯平台</strong>
<%--连接数量：<span id="connectorCount"></span>；
已用内存：<span id="usedMemory"></span>；
可用内存：<span id="freeMemory"></span>；
内存容量：<span id="totalMemory"></span>；
最大容量：<span id="maxMemory"></span>；
系统已运行：<span id="startup"></span>--%>
</div>

<div id="logbox">
</div>

<div id="toolbar" >
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请输入：<input maxlength="200" id="inputbox" class="inputbox" style="outline: none;" onkeypress="return onSendBoxEnter(event);" type="text" ></input>
<input type="button" class="button" style="margin-top: 3px;margin-left: 20px;" onclick="send(inputbox.value);" value="回车发送"></input>
<%--<input type="button" class="button" onclick="rename();" value="改名"></input>--%>
</div>

<div id="login" style="display:none;">
	<input type="hidden" value="${sessionScope.loginUser.username}" id="loginName" />
</div>

</body>
<script>
	$(function () {
		login();
	});

</script>
</html>
