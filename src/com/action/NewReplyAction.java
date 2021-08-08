package com.action;

import com.dao.ReplyDao;
import com.dao.TopicDao;
import com.dao.UserDao;
import com.dao.*;
import com.daoImp.ReplyDaoImp;
import com.daoImp.TopicDaoImp;
import com.daoImp.UserDaoImp;
import entity.Reply;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "NewReplyAction")
public class NewReplyAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext application = request.getServletContext();
        String tUName = (String) application.getAttribute("uName");
        UserDao userDao=new UserDaoImp();
        int rUId=userDao.getUserIdByName(tUName);
        System.out.println("rUId:"+rUId);
        String rTopic=request.getParameter("rTopic");
        String rContents=request.getParameter("rContents");
        System.out.println("rTopic:"+rTopic);
        System.out.println("rContents:"+rContents);
        int rTId;
        rTId=Integer.parseInt(request.getParameter("tId"));
        System.out.println("rTId:"+rTId);
        TopicDao topicDao=new TopicDaoImp();
        int rSId=topicDao.findTSIdByTId(rTId);
        System.out.println("rSId:"+rSId);
        Reply reply=new Reply(rTId,rSId,rUId,rTopic,rContents);
        ReplyDao replyDao=new ReplyDaoImp();
        if(replyDao.newReply(reply) &&topicDao.updateCount(rTId)){
            System.out.println("回复成功！");
            request.getRequestDispatcher("replypage.jhtml?rTId="+rTId+"").forward(request,response);
        }
    }
}
