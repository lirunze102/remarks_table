package com.action;

import com.dao.SectionDao;
import com.daoImp.SectionDaoImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteChildSectionAction")
public class DeleteChildSectionAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int sId= Integer.parseInt(request.getParameter("id"));
        SectionDao sectionDao=new SectionDaoImp();
        if(sectionDao.delete(sId)){
            request.getRequestDispatcher("sectionChild.jsp?sParentId="+sId+"").forward(request,response);
        }
    }
}
