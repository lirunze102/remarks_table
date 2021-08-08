package com.action;

import com.dao.SectionDao;
import com.dao.TopicDao;
import com.dao.UserDao;
import com.dao.*;
import com.daoImp.SectionDaoImp;
import com.daoImp.TopicDaoImp;
import com.daoImp.UserDaoImp;
import entity.Topic;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "NewTopicAction")
public class NewTopicAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        ServletContext application = request.getServletContext();
        String tUName = (String) application.getAttribute("uName");
        UserDao userDao=new UserDaoImp();
        int tUId=userDao.getUserIdByName(tUName);
        System.out.println("tUId:"+tUId);
        SectionDao sectionDao=new SectionDaoImp();
        int tSId= Integer.parseInt(request.getParameter("sId"));
        String tTopic=request.getParameter("tTopic");
        String tContents=request.getParameter("tContents");
        Topic topic=new Topic(tSId,tUId,tTopic,tContents);
        TopicDao topicDao=new TopicDaoImp();
        if(topicDao.newTopic(topic) && sectionDao.addcount(tSId)){
            request.getRequestDispatcher("topic.jsp?sId="+tSId+"").forward(request,response);
        }

    }
}
