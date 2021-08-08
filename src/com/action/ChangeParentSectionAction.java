package com.action;

import com.dao.SectionDao;
import com.daoImp.SectionDaoImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ChangeParentSectionAction")
public class ChangeParentSectionAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int sId= Integer.parseInt(request.getParameter("sId"));
        String sName=request.getParameter("sName");
        SectionDao sectionDao=new SectionDaoImp();
        if(sectionDao.updateChild(sId,sName,0)){
            System.out.println("修改成功");
            request.getRequestDispatcher("sectionParent.jsp").forward(request,response);
        }
    }
}
