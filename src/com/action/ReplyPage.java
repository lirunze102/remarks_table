package com.action;

import com.dao.ReplyDao;
import com.daoImp.ReplyDaoImp;
import entity.Reply;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ReplyPage")
public class ReplyPage extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Reply> replys = new ArrayList<Reply>();
        int pageNow = 0;
        if(request.getParameter("pageNow") == null) {
            pageNow = 1;
        }else {
            pageNow = Integer.parseInt(request.getParameter("pageNow"));
        }
        ReplyDao ms=new ReplyDaoImp();
        int rTId= Integer.parseInt(request.getParameter("rTId"));
        System.out.println(rTId);
        replys = ms.queryByPage(pageNow,rTId);
        ReplyDao replyDao=new ReplyDaoImp();
        List<Reply> replyss=replyDao.selectBytId(rTId);
        int rowcounts=replyss.size();
        int pagecount=1;
        if(rowcounts%5==0){
            pagecount=rowcounts/5;
        }else{
            pagecount=rowcounts/5+1;
        }
        request.setAttribute("totalPage", pagecount);
        request.setAttribute("pageNow", pageNow);
        System.out.println(replys);
        request.setAttribute("replys", replys);
        if(replys != null) {
            request.getRequestDispatcher("topicContent.jsp").forward(request, response);
        }
    }
}
