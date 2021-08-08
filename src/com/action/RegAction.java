package com.action;

import com.dao.CheckDAO;
import com.dao.UserDao;
import com.daoImp.UserDaoImp;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RegAction")
public class RegAction extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CheckDAO check_dao = new CheckDAO();
        String uName = request.getParameter("uName");
        System.out.println(uName);
        String uPassword = request.getParameter("uPassWord");
        String pass1 = request.getParameter("uPassWord1");
        String sex = request.getParameter("uSex");
        Boolean uSex=false;
        String uFace = request.getParameter("uFace");
        if (sex.equals("1")) {
            uSex = true;
        } else {
            uSex = false;
        }
        if (uName == null || uPassword == null) {
            request.getRequestDispatcher("reg.jsp").forward(request,response);
        }
        else if (!check_dao.checkUserName(uName)) {
            request.getRequestDispatcher("reg.jsp").forward(request,response);
        }
        else if (check_dao.checkUserNameIsExist(uName)) {
            request.getRequestDispatcher("reg.jsp").forward(request,response);
        }
        else if (!check_dao.CheckUserPassWord(uPassword)) {
            request.getRequestDispatcher("reg.jsp").forward(request,response);
        }
        else if (!uPassword.equals(pass1)) {
        }
        else if (check_dao.checkUserNameIsExist(uName)) {
        }
        else{
            User user = new User(uName,uPassword,uSex,uFace);
            UserDao userDao=new UserDaoImp();
            if(userDao.reg(user)) {

                request.getRequestDispatcher("login.jsp").forward(request,response);
            }
        }

    }
}
