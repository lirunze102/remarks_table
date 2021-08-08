<%@ page import="com.dao.UserDao" %>
<%@ page import="com.daoImp.UserDaoImp" %>
<%@ page import="entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: 12284
  Date: 2019/12/25
  Time: 17:29
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
                    <span class="small ml-1 d-md-down-none"> ${applicationScope.uName}</span>
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

        <div class="content">
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">
                        <h3 class="box-title">用户信息表</h3>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>用户名</th>
                                    <th>密码</th>
                                    <th>性别</th>
                                    <th>注册时间</th>
                                    <th>身份</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    UserDao userDao=new UserDaoImp();
                                    List<User> users=new ArrayList<>();
                                    users=userDao.selectAll();
                                    int rowcounts=users.size();
                                    int pagecount=1;
                                    if(rowcounts%5==0){
                                        pagecount=rowcounts/5;
                                    }else{
                                        pagecount=rowcounts/5+1;
                                    }
                                    int rowCount=5;
                                    if(users.size()<rowCount){
                                        rowCount=users.size();
                                    }
                                    for(int i=0;i<rowCount;i++) {
                                        int type = users.get(i).getuType();
                                        String uType = "Set";
                                        String typee = "user";
                                        if (type == 2) {
                                            uType = "Cancel";
                                            typee = "administrator";
                                        }
                                        String sex = "man";
                                        if (users.get(i).getuSex()) {
                                            sex = "woman";
                                        }
                                %>
                                <tr>
                                    <td id="id<%=i%>"><%=i+1%></td>
                                    <td id="username<%=i%>"><%=users.get(i).getuName()%></td>
                                    <td id="password<%=i%>"><%=users.get(i).getuPassword()%></td>
                                    <td id="sex<%=i%>"><%=sex%></td>
                                    <td id="regtime<%=i%>"><%=users.get(i).getuRegtime()%></td>
                                    <td id="type<%=i%>"><%=typee%></td>
                                    <th id="set<%=i%>"><a href="changeType.jhtml?uId=<%=users.get(i).getuId()%>" ><%=uType%></a></th>
                                </tr>
                                <%}%>
                                </tbody>
                            </table>
                            total<span id="total_page"><%=pagecount%></span>
                            <div class="pagination" style="margin-left: 700px">
                                <a href="#" id="first_page">index&nbsp&nbsp</a>
                                <a href="#" id="last_page">&nbsp&nbsp</a>
                                Page&nbsp<span id="the_page">1</span>&nbsp&nbsp
                                <a href="#" id="next_page">next&nbsp&nbsp</a>
                                <a href="#" id="end_page">end&nbsp&nbsp</a>
                            </div>
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
<script src="js/userpage.js"></script>
</body>
</html>
