<%@ page import="entity.Section" %>
<%@ page import="com.dao.SectionDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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
                <form action="newSection.jhtml" method="post">
                        <table width="100%">

                            <h3 class="box-title">增加板块</h3><br>
                            <hr>
                            <tr>
                                <td width="99" style="width: 90px">板块名称：</td>
                                <td width="338">
                                    <input class=FormBase id=sName value="";style="WIDTH: 200px" type=text name=sName>
                                </td>
                            </tr>
                            <tr>
                                <td width="99" style="width: 90px">所属类别：</td>
                                <td width="338">
                                        <input type="radio" name="sType" value="1" onclick="parent()" >论坛版块
                                        <input type="radio" name="sType" value="2" onclick="child()"checked="checked" />论坛子版块
                                        <select id="sParentName" name="sParentName" style="font-size: 15px">
                                            <option>请选择父板块</option>
                                        <%
                                            List<Section> sections = new ArrayList<>();
                                            SectionDao sectionDao=new SectionDaoImp();
                                            sections=sectionDao.selectParentSection();
                                            for(int i=0;i<sections.size();i++){
                                        %>
                                        <option><%=sections.get(i).getsName()%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                        <input type="submit" value="新增" style="font-size: 15px"/>
                                </td>
                            </tr>
                        </table>
                </form>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
        </div>
    </div>
</div>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/popper.js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="./js/carbon.js"></script>
<script src="./js/demo.js"></script>
<script type="text/javascript" src="js/jquery-1.12.3.js"></script>
<script type="text/javascript">
    function parent() {
        $("select[id=sParentName]").hide();
    }

    function child() {
        $("select[id=sParentName]").show();
    }
</script>
</body>
</html>
