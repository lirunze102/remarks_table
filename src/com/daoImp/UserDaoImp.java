package com.daoImp;

import com.dao.JDBCManager;
import com.dao.UserDao;
import entity.User;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UserDaoImp implements UserDao {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public boolean login(String username, String password)  {
        // TODO Auto-generated method stub
        boolean flag = false;
        conn = JDBCManager.getConnection();
        String sql = "select * from userinfo where uName = ? and uPassWord = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setObject(1, username);
            pstmt.setObject(2, password);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                flag = true;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            JDBCManager.close(rs,pstmt,conn);
        }
        return flag;
    }
    public int getuType(String uName){
        conn = JDBCManager.getConnection();
        int uType=0;
//        String sql1 = "select isread from messages where id =?";
        String sql=String.format("select uType from userinfo where uName='%s';",uName);
//        System.out.println(sql);
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
//            pstmt.setObject(1,id);
            rs.first();
            uType=rs.getInt(1);
        } catch (SQLException e1) {
            e1.printStackTrace();
        }finally {
            JDBCManager.close(rs, pstmt, conn);
        }
        return uType;
    }

    @Override
    public boolean reg(User user) {
        boolean flag = false;
        conn = JDBCManager.getConnection();
//        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
//        Date time =new Date();
//        System.out.println(time.toString());
        System.out.println("uFace:"+user.getuFace());
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateStr = format.format(date);
        String sql = "insert into userinfo(uName, uPassword, uSex, uFace,uRegTime,uType) values(?, ?, ?, ? ,? ,0)";
//        String sql=String.format("select uType from userinfo where uName='%s';",uName);
//        System.out.println(sql);
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setObject(1, user.getuName());
            pstmt.setObject(2, user.getuPassword());
            pstmt.setObject(3, user.getuSex());
            pstmt.setObject(4, user.getuFace());
            pstmt.setObject(5, dateStr);
            if(pstmt.executeUpdate() > 0) {
                flag = true;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            JDBCManager.close(rs,pstmt,conn);
        }
        return flag;
    }

    @Override
    public int getUserIdByName(String uName) {
        conn =JDBCManager.getConnection();
//        String sql = "select uId from userinfo where uName="+uName;
        String sql=String.format("select uId from userinfo where uName ='" + uName + "';");
//        System.out.println(sql);
        int id=0;
        try {
            pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            rs = pstmt.executeQuery();
            rs.first();
            id = rs.getInt(1);
//            System.out.println("id:"+id);

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            JDBCManager.close(rs,pstmt,conn);
        }
        return id;
    }

    @Override
    public String findNameById(int id) {
        conn =JDBCManager.getConnection();
//        String sql = "select uId from userinfo where uName="+uName;
        String sql = "select uName from userinfo where uId="+id;
//        System.out.println(sql);
        String name="";
        try {
            pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            rs = pstmt.executeQuery();
            rs.first();
            name = rs.getString(1);
//            System.out.println("id:"+id);

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            JDBCManager.close(rs,pstmt,conn);
        }
        return name;
    }

    @Override
    public String findFaceById(int id) {
        conn =JDBCManager.getConnection();
//        String sql = "select uId from userinfo where uName="+uName;
        String sql = "select uFace from userinfo where uId="+id;
//        System.out.println(sql);
        String face="";
        try {
            pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            rs = pstmt.executeQuery();
            rs.first();
            face = rs.getString(1);
//            System.out.println("id:"+id);

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            JDBCManager.close(rs,pstmt,conn);
        }
        return face;
    }

    @Override
    public User selectBtId(String uName) {
        conn = JDBCManager.getConnection();
        String sql=String.format("select * from userinfo where uName ='" + uName + "';");
//        System.out.println(sql);
        User user=new User();
        try {
            pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            rs = pstmt.executeQuery();
            rs.first();
            int uid = rs.getInt(1);
            String uname=rs.getString(2);
            String pwd=rs.getString(3);
            boolean sex=rs.getBoolean(4);
            String face=rs.getString(5);
            Date reg=rs.getDate(6);
            user=new User(uid,uname,pwd,sex,face, (java.sql.Date) reg);
//            System.out.println("OK");
        } catch (SQLException e) {
            // TODO Auto-generated catch block
//            System.out.println("NO");
            e.printStackTrace();
        }finally {
            JDBCManager.close(rs,pstmt,conn);
        }
        return user;
    }

    @Override
    public boolean updateById(User user) {
        boolean flag = false;
        conn = JDBCManager.getConnection();
        String sql = String.format("update userinfo set uName='%s',uPassword='%s',uSex=%s,uFace='%s' where uId=%s "
                ,user.getuName(),user.getuPassword(),user.getuSex(),user.getuFace(),user.getuId());
        System.out.println(sql);
        try {
            pstmt = conn.prepareStatement(sql);
            if(pstmt.executeUpdate() > 0) {
                flag = true;

            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            JDBCManager.close(rs,pstmt,conn);
        }
        return flag;
    }

    @Override
    public List<User> selectAll() {
        conn = JDBCManager.getConnection();
        String sql=String.format("select * from userinfo;");
//        System.out.println(sql);
        List<User> users=new ArrayList<>();
        try {
            pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                int uid = rs.getInt(1);
                String uname = rs.getString(2);
                String pwd = rs.getString(3);
                boolean sex = rs.getBoolean(4);
                String face = rs.getString(5);
                Date reg = rs.getDate(6);
                int type = rs.getInt(7);
                User user = new User(uid, uname, pwd, sex, face, (java.sql.Date) reg, type);
                users.add(user);
            }
//            System.out.println("OK");
        } catch (SQLException e) {
            // TODO Auto-generated catch block
//            System.out.println("NO");
            e.printStackTrace();
        }finally {
            JDBCManager.close(rs,pstmt,conn);
        }
        return users;
    }

    @Override
    public boolean changTypeById(int id,int typee) {
        boolean flag = false;
        conn = JDBCManager.getConnection();
        String sql = String.format("update userinfo set uType=%s where uId=%s",typee,id);
//        System.out.println(sql);
        try {
            pstmt = conn.prepareStatement(sql);
            if(pstmt.executeUpdate() > 0) {
                flag = true;

            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            JDBCManager.close(rs,pstmt,conn);
        }
        return flag;
    }


}
