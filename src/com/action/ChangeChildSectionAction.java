package com.action;

import com.dao.SectionDao;
import com.daoImp.SectionDaoImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ChangeChildSectionAction")
public class ChangeChildSectionAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int sId= Integer.parseInt(request.getParameter("sId"));
        String sName=request.getParameter("sName");
        String sParentName=request.getParameter("sParentName");
        SectionDao sectionDao=new SectionDaoImp();
        int oldsParentId=sectionDao.selectById(sId).getsParentId();
        int sParentId=sectionDao.getSectionIdByName(sParentName);
        if(sectionDao.updateChild(sId,sName,sParentId)){
            System.out.println("修改成功");
            request.getRequestDispatcher("sectionChild.jsp?sParentId="+oldsParentId+"").forward(request,response);
        }
    }
}
