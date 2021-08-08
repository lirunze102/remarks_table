<%@ page import="com.dao.UserDao" %>
<%@ page import="com.daoImp.UserDaoImp" %>
<%@ page import="entity.User" %>
<%@ page import="java.sql.Date" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="lt-ie9 lt-ie8 lt-ie7" lang="en-US">
<html class="lt-ie9 lt-ie8" lang="en-US">
<html class="lt-ie9" lang="en-US">
<html lang="en-US">
<head>
    <!-- META TAGS -->
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>珂学家</title>

    <link rel="shortcut icon" href="images/favicon.png" />

    <!-- Style Sheet-->
    <link rel="stylesheet" href="style.css"/>
    <link rel='stylesheet' id='bootstrap-css-css' href='css/bootstrap5152.css?ver=1.0' type='text/css' media='all' />
    <link rel='stylesheet' id='responsive-css-css' href='css/responsive5152.css?ver=1.0' type='text/css' media='all' />
    <link rel='stylesheet' id='pretty-photo-css-css' href='js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4' type='text/css' media='all' />
    <link rel='stylesheet' id='main-css-css' href='css/main5152.css?ver=1.0' type='text/css' media='all' />
    <link rel='stylesheet' id='custom-css-css'  href='css/custom5152.html?ver=1.0' type='text/css' media='all' />

    <script src="js/html5.js"></script>
    <![endif]-->

</head>
<style>
    .font_style {
        font-size: 18px;
        color: white;
    }
</style>
<body>

<!-- Start of Header -->
<div class="header-wrapper">
    <header>
        <div class="container">


            <div class="logo-container">
                <!-- Website Logo -->
                <a href="#"  title="企业论坛管理">
                    <span class="font_style">企业论坛管理</span>
                </a>
            </div>


            <!-- Start of Main Navigation -->
            <nav class="main-nav">
                <div class="menu-top-menu-container">
                    <ul id="menu-top-menu" class="clearfix">
                        <li class="current-menu-item"><a href="index.jsp">首页</a></li>
                        <li><a href=""> ${sessionScope.uName}</a></li>

                        <li><a href="">个人信息</a>
                            <ul class="sub-menu">
                                <li><a href="personal.jsp">个人信息详情</a></li>
                                <li><a href="editPersonal.jsp">个人资料修改</a></li>
                            </ul>
                        </li>
                        <li><a href="logout.jsp">注销</a></li>
                        <%
                            String uName= (String) application.getAttribute("uName");
                            UserDao userDao=new UserDaoImp();
                            int id=userDao.getUserIdByName(uName);
                            String face=userDao.findFaceById(id);
                        %>
                        <li><img src="image/head/<%=face%>" style="width: 30px;height: 30px;border-radius:50%"></li>
                    </ul>
                </div>
            </nav>
            <!-- End of Main Navigation -->

        </div>
    </header>
</div>
<!-- End of Header -->

<!-- Start of Search Wrapper -->
<div class="search-area-wrapper">
    <div class="search-area container">
        <h3 class="search-header">珂学家</h3>
        <h3 class="search-header">快乐集散地，欢乐集结号，送你一朵小红花</h3>
        <h3 class="search-header">一个兴趣使然的小站</h3>
    </div>
</div>
<!-- End of Search Wrapper -->
<form action="editPersonal.jhtml" method="post">
<!-- Start of Page Container -->
<div class="page-container">
    <div class="container">
        <div class="row">

            <!-- start of page content -->
            <div class="span8 page-content">
                <ul class="breadcrumb" style="margin-left: -60px">
                    <li><a href="#">个人信息</a><span class="divider">/</span></li>
                    <li><a href="#" title="View all posts in Server &amp; Database">个人信息修改</a> <span class="divider">/</span></li>
                </ul>
                <!-- Basic Home Page Template -->

                <%
                    User user=userDao.selectBtId(uName);
                    String password=user.getuPassword();
                    Boolean sex=user.getuSex();
                    System.out.println("face:"+face);
                    Date regtime=user.getuRegtime();
                %>
                <h4 class="card-title">个人信息</h4>
                <div class="form-group row">
                    <div class="col-sm-9">
                        <span class="col-sm-3 text-right control-label col-form-label" >用户名:</span>
                        <input type="text" class="form-control" id="uuName" placeholder="用户名" style="margin-top:
                        10px;margin-left: 35px" value="<%=uName%>" name="uuName">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-9">
                        <span class="col-sm-3 text-right control-label col-form-label">密码:</span>
                        <input type="text" class="form-control" id="uPassWord" style="margin-top: 10px;margin-left: 48px" value="<%=password%>" name="uuPassWord">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-9">
                        <span class="col-sm-3 text-right control-label col-form-label">性别:</span
                            <%
                                if(sex){
                            %>
                        <input type="radio" name="uuSex" value="1" checked="checked" >女
                        <input type="radio" name="uuSex" value="2"/>男
                            <%
                                }
                                else{
                            %>
                        <input type="radio" name="uuSex" value="1">女
                        <input type="radio" name="uuSex" value="2" checked="checked" />男
                            <%
                                }
                            %>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-9">
                        <span class="col-sm-3 text-right control-label col-form-label">注册时间:</span>
                        <input type="text" class="form-control" id="uRegTime" value="<%=regtime%>" style="margin-top: 10px;margin-left: 20px" disabled="disabled">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-9">
                        <span class="col-sm-3 text-right control-label col-form-label">当前头像:</span>
                        <img src="image/head/<%=face%>">
                    </div>

                </div><br>
                <div class="col-sm-9" style="margin-left: -30px">
                    <span class="col-sm-3 text-right control-label col-form-label" >修改头像为:</span><br>
                    <img src="image/head/1.gif"/><input type="radio" name="uuFace" value="1.gif" checked="checked">
                    <img src="image/head/2.gif"/><input type="radio" name="uuFace" value="2.gif">
                    <img src="image/head/3.gif"/><input type="radio" name="uuFace" value="3.gif">
                    <img src="image/head/4.gif"/><input type="radio" name="uuFace" value="4.gif">
                    <img src="image/head/5.gif"/><input type="radio" name="uuFace" value="5.gif">
                    <BR>
                    <img src="image/head/6.gif"/><input type="radio" name="uuFace" value="6.gif">
                    <img src="image/head/7.gif"/><input type="radio" name="uuFace" value="7.gif">
                    <img src="image/head/8.gif"/><input type="radio" name="uuFace" value="8.gif">
                    <img src="image/head/9.gif"/><input type="radio" name="uuFace" value="9.gif">
                    <img src="image/head/10.gif"/><input type="radio" name="uuFace" value="10.gif">
                    <BR>
                    <img src="image/head/11.gif"/><input type="radio" name="uuFace" value="11.gif">
                    <img src="image/head/12.gif"/><input type="radio" name="uuFace" value="12.gif">
                    <img src="image/head/13.gif"/><input type="radio" name="uuFace" value="13.gif">
                    <img src="image/head/14.gif"/><input type="radio" name="uuFace" value="14.gif">
                    <img src="image/head/15.gif"/><input type="radio" name="uuFace" value="15.gif">
                    <br>
                </div>
                <%--<form action="editPersonal.jhtml" method="post">--%>
                    <button type="submit" class="btn btn-dark" style="margin-left: -30px">确认修改</button>
                <%--</form>--%>
            </div>
            <aside class="span4 page-sidebar" style="margin-top: 100px">
                <img src="images/temp/timg%20(2).jpg">
                <img src="images/temp/man.png">
                <img src="images/temp/living-room-770x501.jpg">
            </aside>
            <!-- end of sidebar -->
        </div>
    </div>
</div>
    </form>
<!-- End of Page Container -->

<!-- Start of Footer -->
<footer id="footer-wrapper">
    <div id="footer" class="container">
        <div class="row">

            <div class="span3">
                <section class="widget">
                    <h3 class="title">How it works</h3>
                    <div class="textwidget">
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. </p>
                        <p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </p>
                    </div>
                </section>
            </div>

            <div class="span3">
                <section class="widget"><h3 class="title">Categories</h3>
                    <ul>
                        <li><a href="#" title="Lorem ipsum dolor sit amet,">Advanced Techniques</a> </li>
                        <li><a href="#" title="Lorem ipsum dolor sit amet,">Designing in WordPress</a></li>
                        <li><a href="#" title="Lorem ipsum dolor sit amet,">Server &amp; Database</a></li>
                        <li><a href="#" title="Lorem ipsum dolor sit amet, ">Theme Development</a></li>
                        <li><a href="#" title="Lorem ipsum dolor sit amet,">Website Dev</a></li>
                        <li><a href="#" title="Lorem ipsum dolor sit amet,">WordPress for Beginners</a></li>
                        <li><a href="#" title="Lorem ipsum dolor sit amet, ">WordPress Plugins</a></li>
                    </ul>
                </section>
            </div>

            <div class="span3">
                <section class="widget">
                    <h3 class="title">Latest Tweets</h3>
                    <div id="twitter_update_list">
                        <ul>
                            <li>No Tweets loaded !</li>
                        </ul>
                    </div>
                    <script src="http://twitterjs.googlecode.com/svn/trunk/src/twitter.min.js" type="text/javascript"></script>
                    <script type="text/javascript" >
                        getTwitters("twitter_update_list", {
                            id: "960development",
                            count: 3,
                            enableLinks: true,
                            ignoreReplies: true,
                            clearContents: true,
                            template: "%text% <span>%time%</span>"
                        });
                    </script>
                </section>
            </div>

            <div class="span3">
                <section class="widget">
                    <h3 class="title">Flickr Photos</h3>
                    <div class="flickr-photos" id="basicuse">
                    </div>
                </section>
            </div>

        </div>
    </div>
    <!-- end of #footer -->

    <!-- Footer Bottom -->
    <div id="footer-bottom-wrapper">
        <div id="footer-bottom" class="container">
            <div class="row">
                <div class="span6">
                    <p class="copyright">
                        Copyright © 2013. All Rights Reserved by KnowledgeBase.Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
                    </p>
                </div>
                <div class="span6">
                    <!-- Social Navigation -->
                    <ul class="social-nav clearfix">
                        <li class="linkedin"><a target="_blank" href="#"></a></li>
                        <li class="stumble"><a target="_blank" href="#"></a></li>
                        <li class="google"><a target="_blank" href="#"></a></li>
                        <li class="deviantart"><a target="_blank" href="#"></a></li>
                        <li class="flickr"><a target="_blank" href="#"></a></li>
                        <li class="skype"><a target="_blank" href="skype:#?call"></a></li>
                        <li class="rss"><a target="_blank" href="#"></a></li>
                        <li class="twitter"><a target="_blank" href="#"></a></li>
                        <li class="facebook"><a target="_blank" href="#"></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End of Footer Bottom -->

</footer>
<!-- End of Footer -->
</form>
<a href="#top" id="scroll-top"></a>

<!-- script -->
<script type='text/javascript' src='js/jquery-1.8.2.min.js'></script>
<script type='text/javascript' src='js/jquery.easing.1.34e44.js?ver=1.3'></script>
<script type='text/javascript' src='js/prettyphoto/jquery.prettyPhotoaeb9.js?ver=3.1.4'></script>
<script type='text/javascript' src='js/jquery.liveSearchd5f7.js?ver=2.0'></script>
<script type='text/javascript' src='js/jflickrfeed.js'></script>
<script type='text/javascript' src='js/jquery.formd471.js?ver=3.18'></script>
<script type='text/javascript' src='js/jquery.validate.minfc6b.js?ver=1.10.0'></script>
<script type='text/javascript' src='js/custom5152.js?ver=1.0'></script>
<script>
    function back() {
        window.location.href="page.html"
    }
</script>
</body>
</html>