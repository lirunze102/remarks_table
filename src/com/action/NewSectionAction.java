package com.action;

import com.dao.SectionDao;
import com.daoImp.SectionDaoImp;
import com.dao.UserDao;
import com.daoImp.UserDaoImp;
import entity.Section;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "NewSectionAction")
public class NewSectionAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext application = request.getServletContext();
        String sMasterName = (String) application.getAttribute("uName");
        String sName=request.getParameter("sName");
        String sType = request.getParameter("sType");
        System.out.println("sName:"+sName);
        UserDao userDao=new UserDaoImp();
        SectionDao sectionDao=new SectionDaoImp();
        int sMasterId=userDao.getUserIdByName(sMasterName);
        System.out.println("sMasterId:"+sMasterId);
        int sParentId;
        int sTopicCount=0;
        if(sType.equals("1")){
            sParentId=0;
        }
        else{
            String sParentName=request.getParameter("sParentName");
            System.out.println("sparentName:"+sParentName);
            sParentId=sectionDao.getSectionIdByName(sParentName);
        }
        Section section=new Section(sName,sTopicCount,sMasterId,sParentId);
        if(sectionDao.newSection(section)){
            System.out.println("板块新增成功！");
            request.getRequestDispatcher("sectionParent.jsp").forward(request,response);

        }

    }
}
