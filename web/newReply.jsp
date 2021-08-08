<%--
  Created by IntelliJ IDEA.
  User: 12284
  Date: 2019/12/24
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="newReply.jhtml"method="post">
    <table name="usertable" border="1" style="width: 100%;font-size: 25px">
        <div align="right" style="font-size:20px"><a href="messages.jhtml" class="send">返回消息列表</a></div>
        <tr style="font-size: 25px">
            <td align="left">回复主题 ：
                <%--<select id="reciever" name="reciever" style="font-size: 25px">--%>
                <%--<%--%>
                <%--for (int i = 0; i <contacts.size(); i++) {--%>
                <%--String reciever=contacts.get(i).getName();--%>
                <%--//                                System.out.println(contacts.get(i).getName());--%>
                <%--%>--%>
                <%--<option><%=reciever%></option>--%>
                <%--<%--%>
                <%--}--%>
                <%--%>--%>
                <%--</select>--%>
                <input name="rTopic" type="text" placeholder="rTopic" required="" id="uName" />
            </td>
        </tr>
        <tr style="font-size: 25px">
            <td>回复内容：</td>
        </tr>
        <tr style="font-size: 25px">
            <td><textarea name="rContents" id="rContents" cols="100" rows="20" style="font-size: 20px"></textarea></td>
        </tr>
        <tr>
        </tr>
    </table>
    <input type="submit" value="发布" />
</form>
</body>
</html>
