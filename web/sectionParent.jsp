<%@ page import="entity.Section" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dao.SectionDao" %>
<%@ page import="com.daoImp.SectionDaoImp" %>
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

        <div class="content">
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">
                        <h3 class="box-title">主模块信息表</h3>
                        <span style="margin-left: 900px;font-size: 15px" ><a href="addSection.jsp">新增模块</a></span>
                        <br><br>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>模块Id</th>
                                    <th>模块名</th>
                                    <th>版主ID</th>
                                    <th>子模块数量</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%--17211160109黄成创--%>
                                <%--17211160116 李馨--%>
                                <%
                                    List<Section> sections = new ArrayList<>();
                                    SectionDao sectionDao=new SectionDaoImp();
                                    sections=sectionDao.selectParentSection();
                                    int pageCount=5;
                                    if(sections.size()<pageCount){
                                        pageCount=sections.size();
                                    }
                                    for(int i=0;i<pageCount;i++){
                                        int num=sectionDao.selectSonSection(sections.get(i).getsId()).size();
                                %>
                                <tr>
                                    <td><%=i+1%></td>
                                    <td><%=sections.get(i).getsId()%></td>
                                    <td><%=sections.get(i).getsName()%></td>
                                    <td><%=sections.get(i).getsMasterId()%></td>
                                    <td><%=num%></td>
                                    <td><a href="sectionChild.jsp?sParentId=<%=sections.get(i).getsId()%>">详情</a>
                                        &nbsp;&nbsp;&nbsp;<a href="deleteParentSection.jhtml?id=<%=sections.get(i).getsId()%>">删除</a>
                                        &nbsp;&nbsp;&nbsp;<a href="changeParentSection.jsp?sId=<%=sections.get(i).getsId()%>">编辑</a></th>
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