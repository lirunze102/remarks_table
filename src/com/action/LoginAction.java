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

@WebServlet(name = "LoginAction")
public class LoginAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String username = request.getParameter("uname");
        String password = request.getParameter("upassword");
        String code = request.getParameter("code");
        String type=request.getParameter("uType");
        System.out.println(username+password+code+Globle.getCode());
        if(!code.equals(Globle.getCode())){
            request.setAttribute("message","验证码错误！");
            System.out.println("验证码错误");
            request.getRequestDispatcher("login.jsp").forward(request,response);
            return;
        }
        UserDao userDao=new UserDaoImp();
        if(type.equals("用户")){
            if( userDao.login(username,password)){
                HttpSession session = request.getSession();
                session.setAttribute("uName",username);
                ServletContext application = request.getServletContext();
                application.setAttribute("uName",username);
                System.out.println("登陆成功");
                request.getRequestDispatcher("index.jsp").forward(request,response);
            }else {
                request.setAttribute("message","用户名或密码错误！");
                System.out.println("用户名或密码错误");
                request.getRequestDispatcher("login.jsp").forward(request,response);
            }
        }else{
            if (userDao.login(username, password)) {
                HttpSession session = request.getSession();
                int typee=userDao.getuType(username);
                if(typee==2){
                    session.setAttribute("uName", username);
                    ServletContext application = request.getServletContext();
                    application.setAttribute("uName", username);
                    request.getRequestDispatcher("adminIndex.jsp").forward(request, response);
//                    response.sendRedirect("adminIndex.jsp");
                }
                else {
                    request.setAttribute("message", "该用户非管理员！");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("message", "用户名或密码错误！");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }

    }
}
