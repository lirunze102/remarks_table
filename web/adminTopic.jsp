<%@ page import="entity.Section" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dao.SectionDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.daoImp.SectionDaoImp" %>
<%@ page import="com.dao.TopicDao" %>
<%@ page import="com.daoImp.TopicDaoImp" %>
<%@ page import="entity.Topic" %><%--
  Created by IntelliJ IDEA.
  User: 12284
  Date: 2019/12/24
  Time: 21:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>后台信息管理</title>
    <link rel="stylesheet" href="vendor/simple-line-icons/css/simple-line-icons.css">
    <link rel="stylesheet" href="vendor/font-awesome/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="vendor/simple-line-icons/css/styles.css">
</head>

<body class="sidebar-fixed header-fixed">
<div class="page-wrapper">
    <nav class="navbar page-header">
        <a href="#" class="btn btn-link sidebar-mobile-toggle d-md-none mr-auto">
            <i class="fa fa-bars"></i>
        </a>

        <a class="navbar-brand" href="#">
            <h3>后台信息管理</h3>
        </a>

        <a href="#" class="btn btn-link sidebar-toggle d-md-down-none">
            <i class="fa fa-bars"></i>
        </a>

        <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown">
                <a class="nav-link active" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="small ml-1 d-md-down-none">${applicationScope.uName}</span>
                </a>
            </li>
        </ul>
    </nav>

    <div class="main-container">
        <div class="sidebar">
            <nav class="sidebar-nav">
                <ul class="nav">
                    <li class="nav-title">信息模块</li>

                    <li class="nav-item nav-dropdown">
                        <a href="adminUser.jsp" class="nav-link active">
                            <i class="icon icon-user"></i> 用户信息管理
                        </a>
                    </li>

                    <li class="nav-item nav-dropdown">
                        <a href="sectionParent.jsp" class="nav-link active">
                            <i class="icon icon-energy"></i> 论坛版块管理
                        </a>

                    </li>
                </ul>
            </nav>
        </div>
        <%
            int sId= Integer.parseInt(request.getParameter("id"));
        %>
        <div class="content">
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">
                        <h3 class="box-title">话题信息表</h3><br>
                        <span style="margin-left: 900px"><a href="sectionChild.jsp?sParentId=<%=sId%>">返回</a></span>
                        <br><br>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>

                                <tr>
                                    <th>序号</th>
                                    <th>话题ID</th>
                                    <th>题主ID</th>
                                    <th>话题主题</th>
                                    <th>评论数</th>
                                    <th>发布时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    List<Topic> topics = new ArrayList<>();
                                    TopicDao topicDao=new TopicDaoImp();
                                    topics=topicDao.selectTopic(sId);
                                    for(int i=0;i<topics.size();i++)
                                    {
                                %>
                                <tr>
                                    <td><%=i+1%></td>
                                    <td><%=topics.get(i).gettId()%></td>
                                    <td><%=topics.get(i).getTuId()%></td>
                                    <td><%=topics.get(i).gettTopic()%></td>
                                    <td><%=topics.get(i).gettReplycount()%></td>
                                    <td><%=topics.get(i).gettPublishtime()%></td>
                                    <th>
                                        <a href="adminDeleteTopic.jhtml?tId=<%=topics.get(i).gettId()%>">删除</a></th>
                                </tr>
                                <%
                                    }
                                %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/popper.js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="./js/carbon.js"></script>
<script src="./js/demo.js"></script>
</body>
</html>