
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>用户注册页面</title>
    <script src="js/html5shiv.js"></script>
    <link href="css/normalize.css" rel="stylesheet"/>
    <link href="css/jquery-ui.css" rel="stylesheet"/>
    <link href="css/jquery.idealforms.min.css" rel="stylesheet" media="screen"/>

    <style type="text/css">
        body{font:normal 15px/1.5 Arial, Helvetica, Free Sans, sans-serif;color: #222;background:url(pattern.png);overflow-y:scroll;padding:60px 0 0 0;}
        #my-form{width:755px;margin:0 auto;border:1px solid #ccc;padding:3em;border-radius:3px;box-shadow:0 0 2px rgba(0,0,0,.2);}
        #comments{width:350px;height:100px;}
    </style>
</head>
<body>
<%--18211170211 李润泽 --%>
<%--18211170243 朱奕柯 --%>
<FORM action="reg.jhtml" method="post" id="my-form" style="font-size: 15px">
    <div><h3>用户注册</h3></div>
    <hr />
    <br>用&nbsp; &nbsp;户&nbsp;&nbsp;名&nbsp;
    <input id="uName" name="uName" type="text"/>
    <span id="ruName" style="color: #bd362f" ></span>
    <br><br>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码&nbsp;
    <input id="uPassWord" name="uPassWord" type="password"/><span id="ruPassword" style="color: #bd362f"></span>
    <span id="pwd_prompt" style="color: #bd362f"></span>
    <br><br>重复&nbsp;&nbsp;密码&nbsp;
    <input id="uPassWord1" name="uPassWord1" type="password"/>
    <span id="repwd_prompt" style="color: #bd362f"></span>

    <br><br>性别 &nbsp;
    女<input type="radio" name="uSex" value="1">
    男<input type="radio" name="uSex" value="2" checked="checked" />
    <br><br/>请选择头像 <br>
    <img src="image/head/1.gif"/><input type="radio" name="uFace" value="1.gif" checked="checked">
    <img src="image/head/2.gif"/><input type="radio" name="uFace" value="2.gif">
    <img src="image/head/3.gif"/><input type="radio" name="uFace" value="3.gif">
    <img src="image/head/4.gif"/><input type="radio" name="uFace" value="4.gif">
    <img src="image/head/5.gif"/><input type="radio" name="uFace" value="5.gif">
    <BR>
    <img src="image/head/6.gif"/><input type="radio" name="uFace" value="6.gif">
    <img src="image/head/7.gif"/><input type="radio" name="uFace" value="7.gif">
    <img src="image/head/8.gif"/><input type="radio" name="uFace" value="8.gif">
    <img src="image/head/9.gif"/><input type="radio" name="uFace" value="9.gif">
    <img src="image/head/10.gif"/><input type="radio" name="uFace" value="10.gif">
    <BR>
    <img src="image/head/11.gif"/><input type="radio" name="uFace" value="11.gif">
    <img src="image/head/12.gif"/><input type="radio" name="uFace" value="12.gif">
    <img src="image/head/13.gif"/><input type="radio" name="uFace" value="13.gif">
    <img src="image/head/14.gif"/><input type="radio" name="uFace" value="14.gif">
    <img src="image/head/15.gif"/><input type="radio" name="uFace" value="15.gif">
    <br>
    <hr />
    <INPUT class="btn" tabIndex="4" type="submit" value="注 册"  onclick="javascipt:alert('注册成功！')">
</FORM>
<script type="text/javascript" src="js/jquery-1.12.3.js"></script>
<script >
    $(function(){
        $name = $(':input[name="uName"]')
        $name.blur(function(){
            // alert($name.val())
            $.get("RegServletAjax", {uName:$name.val()}, function(data, status){
                // alert(data)
                // alert(status)
                $('#ruName').html(data)
            })
        })
    })
</script>
<script>
    $(document).ready(function() {
        /*密码验证*/
        $("#uPassWord").blur(function () {
            var pwd = $(this).val();
            var reg = /^[a-zA-Z0-9]{4,10}$/;
            if (reg.test(pwd) == false) {
                $("#pwd_prompt").html("长度在4-10之间");
                return false;
            }
            $("#pwd_prompt").html("");
            return true;
        })
        $("#uPassWord1").blur(function () {
            var repwd = $("#uPassWord1").val();
            var pwd = $("#uPassWord").val();
            if (pwd != repwd) {
                $("#repwd_prompt").html("两次密码不一致");
                return false;
            }
            $("#repwd_prompt").html("");
            return true;
        })
    })
</script>
</body>
</html>
