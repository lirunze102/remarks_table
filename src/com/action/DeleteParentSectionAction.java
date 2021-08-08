package com.action;

import com.dao.SectionDao;
import com.daoImp.SectionDaoImp;
import entity.Section;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeleteParentSectionAction")
public class DeleteParentSectionAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int sId= Integer.parseInt(request.getParameter("id"));
        SectionDao sectionDao=new SectionDaoImp();
        sectionDao.delete(sId);
        List<Section> sections = sectionDao.selectSonSection(sId);
        for(int i=0;i<sections.size();i++){
            sectionDao.delete(sections.get(i).getsId());
        }
        request.getRequestDispatcher("sectionParent.jsp").forward(request,response);
    }
}
