<%--
  Created by IntelliJ IDEA.
  User: 12284
  Date: 2019/12/24
  Time: 9:36
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="newTopic.jhtml"method="post">
<table name="usertable" border="1" style="width: 100%;font-size: 25px">
    <div align="right" style="font-size:20px"><a href="messages.jhtml" class="send">返回消息列表</a></div>
    <tr style="font-size: 25px">
        <td align="left">话题主题 ：
            <input name="tTopic" type="text" placeholder="tTopic" required="" id="uName" />
        </td>
    </tr>
    <tr style="font-size: 25px">
        <td>话题内容：</td>
    </tr>
    <tr style="font-size: 25px">
        <td><textarea name="tContents" id="tContents" cols="100" rows="20" style="font-size: 20px"></textarea></td>
    </tr>
    <tr>
    </tr>
</table>
    <input type="submit" value="发布" />
</form>
</body>
</html>
