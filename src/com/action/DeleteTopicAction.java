package com.action;

import com.dao.SectionDao;
import com.daoImp.SectionDaoImp;
import com.dao.TopicDao;
import com.daoImp.TopicDaoImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteTopicAction")
public class DeleteTopicAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int tId= Integer.parseInt(request.getParameter("tId"));
        System.out.println("tId:"+tId);
        TopicDao topicDao=new TopicDaoImp();
        SectionDao sectionDao=new SectionDaoImp();
        int sId=topicDao.selectTopicById(tId).getTsId();
        if(topicDao.deleteBytId(tId) &&sectionDao.deletecount(sId)){
            System.out.println("删除话题成功！");
            request.getRequestDispatcher("topic.jsp?sId="+sId+"").forward(request,response);
        }
    }
}
