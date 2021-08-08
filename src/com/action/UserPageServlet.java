package com.action;

import com.alibaba.fastjson.JSON;
import com.dao.JDBCManager;
import com.daoImp.UserDaoImp;
import entity.User;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserPageServlet", urlPatterns = "/userpage.jhtml")
public class UserPageServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String page = request.getParameter("page");
        int num = (Integer.parseInt(page)-1)*5;
        int endnum=0;
        UserDaoImp userDaoImp = new UserDaoImp();
        if(num+5>userDaoImp.selectAll().size())
            endnum=userDaoImp.selectAll().size();
        else endnum=num+5;
        String sql=String.format("select * from userinfo limit %d,%d",num,endnum);
        System.out.println(sql);
        Connection conn = JDBCManager.getConnection();
        List<User> list=new ArrayList<>();
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        try {
            pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            rs = pstmt.executeQuery();
            while (rs.next()){
                int uId=rs.getInt("uId");
                String uName = rs.getString("uName");
                String uPassword = rs.getString("uPassWord");
                String uSex = rs.getString("uSex");
                Date uRegTime= rs.getDate("uRegTime");
                String uTpye = rs.getString("uType");
                if(uSex.equals("1"))
                    list.add(new User(uId,uName,uPassword,true,uRegTime, Integer.parseInt(uTpye)));
                else list.add(new User(uId,uName,uPassword,false,uRegTime, Integer.parseInt(uTpye)));
            }
            System.out.println(list);
            response.getWriter().write(JSON.toJSONString(list));
//            System.out.println("id:"+id);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            JDBCManager.close(rs,pstmt,conn);
        }
    }
}
