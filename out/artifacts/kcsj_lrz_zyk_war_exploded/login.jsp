<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>珂学家</title>
    <link href="css/login_snow.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" type="text/css" href="css/detailsmusic.css" />


</head>
<body>
<div class="snow-container">
    <div class="snow foreground"></div>
    <div class="snow foreground layered"></div>
    <div class="snow middleground"></div>
    <div class="snow middleground layered"></div>
    <div class="snow background"></div>
    <div class="snow background layered"></div>
</div>





<div id="login">
    <form id="login_form"  action="login.jhtml">
        <div class="music-lgin" >

            <div class="music-lgin-all">
                <!--左手-->
                <div class="music-lgin-left ovhd">
                    <div class="music-hand">
                        <div class="music-lgin-hara"></div>
                        <div class="music-lgin-hars"></div>
                    </div>
                </div>

                <!--脑袋-->
                <div class="music-lgin-dh">
                    <div class="music-lgin-alls">
                        <div class="music-lgin-eyeleft">
                            <div class="music-left-eyeball yeball-l"></div>
                        </div>
                        <div class="music-lgin-eyeright">
                            <div class="music-right-eyeball yeball-r"></div>
                        </div>
                        <div class="music-lgin-cl"></div>
                    </div>
                    <!--鼻子-->
                    <div class="music-nose"></div>
                    <!--嘴-->
                    <div class="music-mouth music-mouth-ds"></div>
                    <!--肩-->
                    <div class="music-shoulder-l">
                        <div class="music-shoulder"></div>
                    </div>
                    <div class="music-shoulder-r">
                        <div class="music-shoulder"></div>
                    </div>
                    <!--消息框-->
                    <div class="music-news">来了,老弟！</div>
                </div>

                <!--右手-->
                <div class="music-lgin-right ovhd">
                    <div class="music-hand">
                        <div class="music-lgin-hara"></div>
                        <div class="music-lgin-hars"></div>
                    </div>
                </div>

            </div>

            <div style="color:white;font-size: 20px "width="500px">${message}</div>
            <div>
                <select name="uType" id="uType" style="width: 65px" required="">
                    <option >用户</option>
                    <option>管理员</option>
                </select>
            </div>
            <!--1-->
            <div class="music-lgin-text">
                <input name="uname" class="inputname inputs" type="text" placeholder="用户名"  required="" id="uName">
            </div>
            <!--2-->
            <div class="music-lgin-text">
                <input name="upassword" type="password" class="mima inputs" placeholder="密码"   required="" id="uPassWord"/>
            </div>
            <div>
                <div style="margin:5px 0px;">
                    <img   onclick="javascript:this.src='/kcsj_lrz_zyk/code.jhtml?id='+new Date().getMilliseconds()" width="120px" height="40px"  >
                    <input type="text" name="code" style="width:150px;" placeholder="点击左方并输入验证码...">
                </div>
            </div>
            <!--3-->
            <div class="music-lgin-text">
                <input class="music-qd inputs" type="submit" value="确定" />
            </div>
            <p class="p-bottom-w3ls" style="color: white">
                还没有账号？<a href="reg.jsp">马上注册</a>
            </p>

        </div>
    </form>


</div>
<div >
    <a style="color: white;font-size: 15px" id="login_index">@2021课程设计  李润泽 & 朱奕珂 </a>
</div>
<script src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
    //眼睛 密码部分
    $(".mima").focus(function() {
        $(".music-lgin-left").addClass("left-dh").removeClass("rmleft-dh");
        $(".music-lgin-right").addClass("right-dh").removeClass("right-rmdh");
        $(".music-hand").addClass("no");
    }).blur(function() {
        $(".music-lgin-left").removeClass("left-dh").addClass("rmleft-dh");
        $(".music-lgin-right").removeClass("right-dh").addClass("right-rmdh");
        $(".music-hand").removeClass("no");

    })
    //点击小人出来
    $(".inputname").focus(function() {
        $(".music-lgin-all").addClass("block");
        $(".music-news").addClass("no")
    })







</script>

</body>

</html>
