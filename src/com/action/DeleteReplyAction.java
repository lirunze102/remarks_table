package com.action;

import com.dao.ReplyDao;
import com.daoImp.ReplyDaoImp;
import com.dao.TopicDao;
import com.daoImp.TopicDaoImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteReplyAction")
public class DeleteReplyAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int rId= Integer.parseInt(request.getParameter("rId"));
        System.out.println("id:"+rId);
        ReplyDao replyDao=new ReplyDaoImp();
        TopicDao topicDao=new TopicDaoImp();
        int tId=replyDao.selectTopicIdByRId(rId);

        String rid = request.getParameter("rid");
        System.out.println(rid);
        System.out.println("tId:"+tId);
        replyDao.deleteById(rId);
        if(topicDao.deleteReplyCount(tId)){
            System.out.println("删除成功！");
            request.getRequestDispatcher("topicContent.jsp?tId="+tId+"").forward(request,response);
        }
    }
}
