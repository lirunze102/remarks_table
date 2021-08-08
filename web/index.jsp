<%@ page import="com.dao.SectionDao" %>
<%@ page import="com.daoImp.SectionDaoImp" %>
<%@ page import="entity.Section" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dao.UserDao" %>
<%@ page import="com.daoImp.UserDaoImp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><html>
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

  <link rel='stylesheet' id='bootstrap-css-css' href='css/bootstrap5152.css?ver=1.0' type='text/css' media='all' />
  <link rel='stylesheet' id='responsive-css-css' href='css/responsive5152.css?ver=1.0' type='text/css' media='all' />
  <link rel='stylesheet' id='pretty-photo-css-css' href='js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4' type='text/css' media='all' />
  <link rel='stylesheet' id='main-css-css' href='css/main5152.css?ver=1.0' type='text/css' media='all' />
  <link rel="stylesheet" type="text/css" href="css/kefu.css" />
  <link rel="stylesheet" href="css/yunduo.css">
  <link rel="stylesheet" href="css/index.css">
  <link rel="stylesheet" href="css/game_style.css">
  <link rel="stylesheet" href="css/bolangfenge.css">
  、
  <script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>



  <script type="text/javascript" src="js/jQuery.js"></script>
  <script type="text/javascript" src="js/bolangfenge.js"></script>
  <script type="text/javascript">
    $(function() {
      $(".kfleft").click(function(){
        var i=$("#haiiskefu").css("right");
        if (i=='0px'){
          $('#haiiskefu').animate({right:-80}, 200);
        } else {
          $('#haiiskefu').animate({right:0}, 200);
        }
      });
    });
  </script>

</head>
<style>
  .font_style {
    font-size: 18px;
    color: white;
  }
</style>
<body>

<div class="header-wrapper">
  <header>
    <div class="container">
      <div class="logo-container">
        <a href="#"  title="珂学家">
          <span class="font_style">珂学家</span>
        </a>
      </div>
      <nav class="main-nav">
        <div class="menu-top-menu-container">
          <ul id="menu-top-menu" class="clearfix">
            <li class="current-menu-item"><a href="index.jsp">首页</a></li>
            <li><a href=""> ${applicationScope.uName}</a></li>

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
    </div>
  </header>
</div>
<%--<div class="search-area-wrapper">--%>
<%--  <div class="search-area container">--%>
<%--    <h3 class="search-header">珂学家</h3>--%>
<%--    <h3 class="search-header">快乐集散地，欢乐集结号，送你一朵小红花</h3>--%>
<%--    <h3 class="search-header">一个兴趣使然的小站</h3>--%>
<%--  </div>--%>
<%--</div>--%>

<div class="header">
  <h3 class="search-header">珂学家</h3>
  <h3 class="search-header">快乐集散地，欢乐集结号，送你一朵小红花</h3>
  <h3 class="search-header">一个兴趣使然的小站</h3>
</div>
<div class="canvas-wrap">
  <canvas id="canvas"></canvas>
</div>



<!-- Start of Page Container -->
<div class="page-container ">

  <div class="container satic-area" id="index_body">

    <div class="row">

      <!-- start of page content -->
      <div class="span8 page-content" style="padding-left: 50px">
<%--        &lt;%&ndash;云雾特效&ndash;%&gt;--%>
<%--        <div class="dynamic-area1" ></div>--%>
<%--        <div class="dynamic-area2"></div>--%>
        <%--18211170211 李润泽--%>
        <%--18211170243 朱奕珂--%>
        <!-- Basic Home Page Template -->
        <div class="row separator" id="sec_div" >
          <%
            SectionDao sectionDao=new SectionDaoImp();
            List<Section> sections = new ArrayList<>();
            sections=sectionDao.selectParentSection();
            for (int i = 0; i <sections.size(); i++)
            {
          %>
          <section id="sections" class="span4 articles-list" >
            <h3 style="padding-left: 10px"><%=sections.get(i).getsName()%></h3>
            <ul class="articles" style="padding-left: 2px">
              <%
                List<Section> sonsections = new ArrayList<>();
                sonsections=sectionDao.selectSonSection(sections.get(i).getsId());
                for (int j = 0; j <sonsections.size(); j++)
                {
              %>
              <li class="article-entry standard" >
                <h4 style="padding-left: 10px"><a href="topic.jsp?sId=<%=sonsections.get(j).getsId()%>"><%=sonsections.get(j).getsName()%></a></h4>
                <span class="like-count"><%=sonsections.get(j).getsTopicCount()%></span>
              </li>
              <%
                }
              %>
            </ul>
          </section>
        <%
          }
        %>
        </div>
      </div>
      <!-- end of page content -->

      <!-- start of sidebar -->


      <aside class="span4 page-sidebar">

        <section class="widget">
          <div class="support-widget">
            <h3 class="title">温馨提示</h3>
            <p class="intro">若遇到疑问难题，可直接通过点击右侧人工客服联系我们！</p>
          </div>
        </section>

        <section class="widget">
          <div class="quick-links-widget">
            <h3 class="title">快速链接</h3>
            <ul id="menu-quick-links" class="menu clearfix">
              <li><a href="index.jsp">Home</a></li>
              <li><a href="#games">游戏消遣</a></li>
              <li><a href="#">视频娱乐</a></li>
              <li><a href="#footer-wrapper">页脚</a></li>
            </ul>
          </div>
        </section>

        <section class="widget">
          <h3 class="title">Tags</h3>
          <div class="tagcloud">
            <a href="#" class="btn btn-mini">basic</a>
            <a href="#" class="btn btn-mini">beginner</a>
            <a href="#" class="btn btn-mini">blogging</a>
            <a href="#" class="btn btn-mini">colour</a>
            <a href="#" class="btn btn-mini">css</a>
            <a href="#" class="btn btn-mini">date</a>
            <a href="#" class="btn btn-mini">design</a>
            <a href="#" class="btn btn-mini">files</a>
            <a href="#" class="btn btn-mini">format</a>
            <a href="#" class="btn btn-mini">header</a>
            <a href="#" class="btn btn-mini">images</a>
            <a href="#" class="btn btn-mini">plugins</a>
            <a href="#" class="btn btn-mini">setting</a>
            <a href="#" class="btn btn-mini">templates</a>
            <a href="#" class="btn btn-mini">theme</a>
            <a href="#" class="btn btn-mini">time</a>
            <a href="#" class="btn btn-mini">videos</a>
            <a href="#" class="btn btn-mini">website</a>
            <a href="#" class="btn btn-mini">wordpress</a>
          </div>
        </section>

      </aside>
      <!-- end of sidebar -->
    </div>

  </div>


<div>
    <h1>游戏专区</h1>
  <div id="games" >
    <div class="game">
      <a href="games/saolei.html">
        <div class="frame">
          <button class="custom-btn btn-1">扫雷</button>
        </div>
      </a>
    </div>

    <div class="game">
      <a href="games/qingxie.html">
        <div class="frame">
          <button class="custom-btn btn-2">倾斜迷宫</button>
        </div>
      </a>
    </div>

    <div class="game">
      <a href="games/xuanya.html">
        <div class="frame">
          <button class="custom-btn btn-3">跨越悬崖</button>
        </div>
      </a>
    </div>

    <div class="game">
      <a href="games/duizhan.html">
        <div class="frame">
          <button class="custom-btn btn-4">砖块堆栈</button>
        </div>
      </a>
    </div>
    <div class="game">
      <a href="games/saiche.html">
        <div class="frame">
          <button class="custom-btn btn-5">赛车</button>
        </div>
      </a>
    </div>
    <div class="game">
      <a href="games/biecaibaikuai.html">
        <div class="frame">
          <button class="custom-btn btn-6">别踩白块</button>
        </div>
      </a>
    </div>
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
          <h3 class="title">网站使用简介</h3>
          <div class="textwidget">
            <p>在这里你选择可以在自己喜欢的模块下，进行评论分享发表自己的想法，也可选择各项娱乐活动，消遣时间，陶冶情操。 </p>
            <br><br>
            <p>Happiness can be found even in the darkest of times.</p>
            <p>即使在最黑暗的日子里，也能寻到幸福。</p>
          </div>
        </section>
      </div>

      <div class="span3">
        <section class="widget"><h3 class="title">快速链接</h3>
          <ul>
            <li><a href="index.jsp" title="Lorem ipsum dolor sit amet,">回到主页</a> </li>
            <li><a href="index.jsp#games" title="Lorem ipsum dolor sit amet,">游戏专区</a></li>
            <li><a href="#" title="Lorem ipsum dolor sit amet,"></a></li>
            <li><a href="#" title="Lorem ipsum dolor sit amet, "></a></li>
            <li><a href="#" title="Lorem ipsum dolor sit amet,"></a></li>
            <li><a href="#" title="Lorem ipsum dolor sit amet,"></a></li>
            <li><a href="#" title="Lorem ipsum dolor sit amet, "></a></li>
          </ul>
        </section>
      </div>

      <div class="span3">
        <section class="widget">
          <h3 class="title">本站最新上线游戏功能</h3>
          <div id="twitter_update_list">
            <ul>
              <li>扫雷</li>
              <li>倾斜迷宫</li>
              <li>跨越悬崖</li>
              <li>砖块堆栈</li>
              <li>赛车</li>
              <li></li>
            </ul>
          </div>

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
          <p class="copyright" style="color: white">
            每一天都要保持好心情哦！！
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


<div id="haiiskefu">
  <div class="kfleft" title="点击查看联系方式"></div>
  <ul>
    <li><a rel="nofollow" href="http://wpa.qq.com/msgrd?v=3&uin=814081718&site=qq&menu=yes" title="销售咨询" target="_blank"></a></li>
    <li><a rel="nofollow" href="http://wpa.qq.com/msgrd?v=3&uin=814081718&site=qq&menu=yes" title="美工咨询" target="_blank"></a></li>
    <li><a rel="nofollow" href="http://wpa.qq.com/msgrd?v=3&uin=2279834939&site=qq&menu=yes" title="技术咨询" target="_blank"></a></li>
    <li><a rel="nofollow" href="http://wpa.qq.com/msgrd?v=3&uin=2279834939&site=qq&menu=yes" title="优化咨询" target="_blank"></a></li>
    <li><a rel="nofollow" href="http://wpa.qq.com/msgrd?v=3&uin=814081718&site=qq&menu=yes" title="售后咨询" target="_blank"></a></li>
    <li><a rel="nofollow" href="http://wpa.qq.com/msgrd?v=3&uin=814081718&site=qq&menu=yes" title="财务咨询" target="_blank"></a></li>
    <li><a href="http://ai.wzu.edu.cn/" title="联系方式" target="_blank"></a></li>
  </ul>
</div>

</body>
</html>