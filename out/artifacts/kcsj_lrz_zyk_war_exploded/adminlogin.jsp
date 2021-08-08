<%--
  Created by IntelliJ IDEA.
  User: 12284
  Date: 2019/12/23
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员登录</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
<div class="container">
    <section id="content">
        <form action="adminlogin.jhtml">
            <h1>管理员登录</h1>
            <div style="color: red;font-size: 20px "width="500px">${message}</div>
            <div >
                <input name="uname" type="text" placeholder="UserName" required="" id="uName" />
            </div>
            <div>
                <input name="upassword" type="password" placeholder="Password" required="" id="uPassWord" />
            </div>
            <div>
                <div style="margin:5px 0px;">
                    <input type="text" name="code" style="width:150px;" placeholder="请输入验证码...">
                    <img src="/code.jhtml" onclick="javascript:this.src='/code.jhtml?id='+new Date().getMilliseconds()" width="120px" height="40px" >
                </div>
            </div>
            <div>
                <input type="submit" value="Log in" align="right"/>
            </div>
        </form>
    </section>
</div>
</body>

</body>

</html>
