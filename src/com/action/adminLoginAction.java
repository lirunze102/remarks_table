package com.action;

import com.constant.Globle;
import com.dao.UserDao;
import com.daoImp.UserDaoImp;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "adminLoginAction")
public class adminLoginAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String username = request.getParameter("uname");
        String password = request.getParameter("upassword");
        String code = request.getParameter("code");
//        System.out.println("username:" + username + "password:" + password);
        if (!code.equals(Globle.getCode())) {
            request.setAttribute("message", "验证码错误！");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        UserDao userDao = new UserDaoImp();
        if (userDao.login(username, password)) {
            HttpSession session = request.getSession();
            int type=userDao.getuType(username);
//            System.out.println("type:"+type);
            if(type==2){
                session.setAttribute("username", username);
                ServletContext application = request.getServletContext();
                application.setAttribute("username", username);
                request.getRequestDispatcher("adminIndex.jsp").forward(request, response);
            }
            else {
                request.setAttribute("message", "该用户非管理员！");
                request.getRequestDispatcher("adminlogin.jsp").forward(request, response);
            }


        } else {
            request.setAttribute("message", "用户名或密码错误！");
            request.getRequestDispatcher("adminlogin.jsp").forward(request, response);
        }
    }
}
