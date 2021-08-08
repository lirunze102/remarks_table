<%@ page import="entity.Section" %>
<%@ page import="entity.Topic" %>
<%@ page import="com.dao.*" %>
<%@ page import="entity.Reply" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.daoImp.SectionDaoImp" %>
<%@ page import="com.daoImp.TopicDaoImp" %>
<%@ page import="com.daoImp.UserDaoImp" %>
<%@ page import="com.dao.TopicDao" %>
<%@ page import="com.dao.SectionDao" %>
<%@ page import="com.dao.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html class="lt-ie9 lt-ie8 lt-ie7" lang="en-US">
<html class="lt-ie9 lt-ie8" lang="en-US">
<html class="lt-ie9" lang="en-US">
<html lang="en-US">
<head>
    <!-- META TAGS -->
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>企业论坛管理</title>

    <link rel="shortcut icon" href="images/favicon.png" />

    <!-- Style Sheet-->
    <link rel="stylesheet" href="style.css"/>
    <link rel='stylesheet' id='bootstrap-css-css'  href='css/bootstrap5152.css?ver=1.0' type='text/css' media='all' />
    <link rel='stylesheet' id='responsive-css-css'  href='css/responsive5152.css?ver=1.0' type='text/css' media='all' />
    <link rel='stylesheet' id='pretty-photo-css-css'  href='js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4' type='text/css' media='all' />
    <link rel='stylesheet' id='main-css-css'  href='css/main5152.css?ver=1.0' type='text/css' media='all' />
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
                        <li><a href="logout.jhtml">注销</a></li>
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


<%
    String username= (String) application.getAttribute("uName");
    int tId= Integer.parseInt(request.getParameter("rTId"));
    TopicDao topicDao=new TopicDaoImp();
    Topic topic=topicDao.selectTopicById(tId);
    int tsId=topic.getTsId();
    int tuId=topic.getTuId();
    String tuName=userDao.findNameById(tuId);
    String delete1="";
    if((tuName.equals(username))){ delete1="删除"; }
    String tTopic=topic.gettTopic();
    String tContents=topic.gettContents();
    SectionDao sectionDao=new SectionDaoImp();
    Section section= (Section) sectionDao.selectById(tsId);
    String sName=section.getsName();
    int parentId=section.getsParentId();
    String sParentName=sectionDao.selectById(parentId).getsName();
%>
<div class="page-container">
    <div class="container">
        <div class="row">
            <ul class="breadcrumb">
                <li><a href="index.jsp"><%=sParentName%></a><span class="divider">/</span></li>
                <li><a href="topic.jsp?sId=<%=tsId%>" title="View all posts in Server &amp; Database"><%=sName%></a> <span class="divider">/</span></li>
            </ul>
            <div class="span8 page-content">
                <article class=" type-page  hentry clearfix">
                    <h1 class="post-title"><a href=""><%=tTopic%></a></h1>
                    <hr>
                    <p><%=tContents%></p>
                    <br>
                    <div align="right">
                        <a href="deleteTopic.jhtml?tId=<%=tId%>" style="margin-left: 10px"><%=delete1%></a>
                    </div>
                    <hr>
                    <br>
                    <%

                        int rtId=tId;
                        List<Reply> replys=(ArrayList<Reply>)request.getAttribute("replys");
                        for(int i=0;i<replys.size();i++)
                        {
                            String delete="";
                            int ruId=replys.get(i).getRuId();
                            String ruName=userDao.findNameById(ruId);
                            if((ruName.equals(username))){
                                delete="删除";
                            }
                            int k= (int) request.getAttribute("pageNow");
                            k=(k-1)*5+i+1;
                    %>
                    <blockquote>
                        <span><%=k%>楼</span><img src="image/head/<%=face%>" style="width:45px; height:40px;margin-left: 10px"><span style="margin-left: 20px"><%=ruName%>
                    </span>
                        <p STYLE="font-size: 20px"><%=replys.get(i).getrTopic()%></p>
                        <br>
                        <p id="contentId"><%=replys.get(i).getrContents()%></p><br>
                        <p id="contentId1">发布时间：<%=replys.get(i).getrPublishtime()%></p><br>
                        <a href="deleteReply.jhtml?rId=<%=replys.get(i).getrId()%>" onclick="f(<%=replys.get(i).getrId()%>)" style="margin-left: 10px" id="rid"><%=delete%></a>
                    </blockquote>
                    <%
                        }
                    %>
                </article>
                <div class="pagination" style="margin-left:550px">
                    <span>共 ${totalPage}页</span>
                    <span>当前页 ${pageNow}</span>
                    <c:if test="${pageNow!=1}"><a href="replypage.jhtml?pageNow=${pageNow - 1}&rTId=<%=rtId%>">上一页</a></c:if>
                    <c:if test="${pageNow!=totalPage}"><a href="replypage.jhtml?pageNow=${pageNow + 1}&rTId=<%=rtId%>">下一页</a></c:if>
                </div>
                <form id="contact-form" class="row" action="newReply.jhtml?tId=<%=rtId%>" method="post">
                    <div class="span2">
                        <label for="rContents">你的留言 <span>*</span> </label>
                    </div>
                    <div class="span6">
                        <input name="rTopic" type="text" placeholder="评论主题" required="" id="rTopic" align="left;" style="margin-left: -120px" /><br>
                        <textarea name="rContents" id="rContents" class="required span6" rows="6" title="* Please enter your message" style="margin-left: -120px"></textarea>
                    </div>
                    <div class="span6 offset2 bm30">
                        <input type="submit" name="submit" value="评论" class="btn btn-inverse" style="margin-left: -120px">
                        <img src="images/loading.gif" id="contact-loader" alt="Loading...">
                    </div>
                </form>
            </div>


            <!-- end of page content -->


            <!-- start of sidebar -->
            <aside class="span4 page-sidebar">
                <img src="images/temp/timg%20(2).jpg">
                <img src="images/temp/man.png">
                <img src="images/temp/living-room-770x501.jpg">

            </aside>
            <!-- end of sidebar -->
        </div>
    </div>
</div>
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

<a href="#top" id="scroll-top"></a>
<!-- script -->
<script type='text/javascript' src='js/jquery-1.8.3.min.js'></script>
<script type='text/javascript' src='js/jquery.easing.1.3.js'></script>
<script type='text/javascript' src='js/prettyphoto/jquery.prettyPhoto.js'></script>
<script type='text/javascript' src='js/jflickrfeed.js'></script>
<script type='text/javascript' src='js/jquery.liveSearch.js'></script>
<script type='text/javascript' src='js/jquery.form.js'></script>
<script type='text/javascript' src='js/jquery.validate.min.js'></script>
<script type='text/javascript' src='js/custom.js'></script>
<script type="text/javascript" src="js/jquery-1.12.3.js"></script>
<script type="text/javascript">
    function f(id){
        var xiaoming = {
            rid:id,
            age: 14,
            gender: true,
            height: 1.65,
            grade: null,
            'middle-school': '\"W3C\" Middle School',
            skills: ['JavaScript', 'Java', 'Python', 'Lisp']
        };
        alert(id)
        console.log(JSON.stringify(xiaoming))
        $('#rid').click(function(){
            $.get("deleteReply.jhtml", xiaoming, function(data, status){
                $('#secrete').html(data)
            })
        })
    }

    <%--$(function () {--%>
        <%--var xiaoming = {--%>
            <%--rid:<%=replys.get(i).getrId()%>,--%>
            <%--age: 14,--%>
            <%--gender: true,--%>
            <%--height: 1.65,--%>
            <%--grade: null,--%>
            <%--'middle-school': '\"W3C\" Middle School',--%>
            <%--skills: ['JavaScript', 'Java', 'Python', 'Lisp']--%>
        <%--};--%>

        <%--console.log(JSON.stringify(xiaoming))--%>
        <%--$('#rid').click(function(){--%>
            <%--$.get("deleteReply.jhtml", xiaoming, function(data, status){--%>
                <%--$('#secrete').html(data)--%>
            <%--})--%>
        <%--})--%>
    <%--})--%>
</script>
</body>
</html>
