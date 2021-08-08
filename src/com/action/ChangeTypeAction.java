package com.action;

import com.dao.UserDao;
import com.daoImp.UserDaoImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ChangeTypeAction")
public class ChangeTypeAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int uId= Integer.parseInt(request.getParameter("uId"));

        UserDao userDao=new UserDaoImp();
        String uName=userDao.findNameById(uId);
        int type=userDao.getuType(uName);
        int typee=0;
        if(type==0){
            typee=2;
        }
        if(userDao.changTypeById(uId,typee)){

            request.getRequestDispatcher("adminUser.jsp").forward(request,response);
        }

    }
}
