package com.action;

import com.dao.UserDao;
import com.daoImp.UserDaoImp;
import entity.User;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "EditPersonalAction")
public class EditPersonalAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext application = request.getServletContext();
        String username = (String) application.getAttribute("uName");
        UserDao userDao=new UserDaoImp();
        int uId=userDao.getUserIdByName(username);
        System.out.println("////uId:"+uId);
        String uName = request.getParameter("uuName");
        System.out.println("uName:"+uName);
        String uPassword = request.getParameter("uuPassWord");
        String sex = request.getParameter("uuSex");
        Boolean uSex=false;
        String uFace = request.getParameter("uuFace");
        if (sex.equals("1")) {
            uSex = true;
        } else {
            uSex = false;
        }
        System.out.println(uName+" "+ uPassword+" "+uSex+ " "+uFace);
        User user = new User(uId ,uName, uPassword,uSex, uFace);
        if(userDao.updateById(user)){
            System.out.println("修改成功");
            application.setAttribute("uName",uName);
            System.out.println(application.getAttribute("uName"));
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }
    }
}
