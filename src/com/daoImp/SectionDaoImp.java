package com.daoImp;

import com.dao.JDBCManager;
import com.dao.SectionDao;
import entity.Section;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SectionDaoImp implements SectionDao {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    @Override
    public int getSectionIdByName(String sName) {
        conn = JDBCManager.getConnection();
//        String sql = "select sId from sectioninfo where sName="+sName;
        String sql=String.format("select sId from sectioninfo where sName ='" + sName + "';");
//        System.out.println(sql);
        int id=0;
        try {
            pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            rs = pstmt.executeQuery();
            rs.first();
            id = rs.getInt(1);
//            System.out.println("sId:"+id);

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            JDBCManager.close(rs,pstmt,conn);
        }
        return id;
    }

    @Override
    public boolean newSection(Section section) {
        boolean flag = false;
        conn = JDBCManager.getConnection();
//        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
//        Date time =new Date();
//        System.out.println(time.toString());
//        System.out.println("uFace:"+section.getuFace());
        String sql = "insert into sectioninfo(sName, sTopicCount, sMasterId, sParentId) values(?, ?, ?, ? )";
//        String sql=String.format("select uType from userinfo where uName='%s';",uName);
//        System.out.println(sql);
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setObject(1, section.getsName());
            pstmt.setObject(2, 0);
            pstmt.setObject(3, section.getsMasterId());
            pstmt.setObject(4, section.getsParentId());
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
    public List<Section> selectParentSection() {
        List<Section> sections = new ArrayList<>();
        conn = JDBCManager.getConnection();
        String sql = "select * from sectioninfo where sParentId=0";
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while(rs.next()) {
                int sId = rs.getInt(1);
                String sName = rs.getString(2);
                int sTopicCount = rs.getInt(3);
                int sMasterId = rs.getInt(4);
                int sParentId = rs.getInt(5);
                Section section=new Section(sId,sName,sTopicCount,sMasterId,sParentId);
                sections.add(section);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            JDBCManager.close(rs,pstmt,conn);
        }
        return sections;
    }

    @Override
    public List<Section> selectSonSection(int id) {
        List<Section> sections = new ArrayList<>();

        conn = JDBCManager.getConnection();
        String sql = "select * from sectioninfo where sParentId="+id;
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while(rs.next()) {
                int sId = rs.getInt(1);
                String sName = rs.getString(2);
                int sTopicCount = rs.getInt(3);
                int sMasterId = rs.getInt(4);
                int sParentId = rs.getInt(5);
                Section section=new Section(sId,sName,sTopicCount,sMasterId,sParentId);
                sections.add(section);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            JDBCManager.close(rs,pstmt,conn);
        }
        return sections;
    }

    @Override
    public Section selectById(int id) {
        Section section = new Section();
        conn = JDBCManager.getConnection();
        String sql = "select * from sectioninfo where sId="+id;
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            rs.first();
            int sId = rs.getInt(1);
            String sName = rs.getString(2);
            int sTopicCount = rs.getInt(3);
            int sMasterId = rs.getInt(4);
            int sParentId = rs.getInt(5);
            section=new Section(sId,sName,sTopicCount,sMasterId,sParentId);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            JDBCManager.close(rs,pstmt,conn);
        }
        return section;
    }

    @Override
    public boolean deletecount(int id) {
        boolean flag = false;
        Connection conn =JDBCManager.getConnection();
        String sql = String.format("update sectioninfo set sTopicCount=sTopicCount-1 where sId=%s;",id);
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

    @Override
    public boolean addcount(int id) {
        boolean flag = false;
        Connection conn =JDBCManager.getConnection();
        String sql = String.format("update sectioninfo set sTopicCount=sTopicCount+1 where sId=%s;",id);
//        System.out.println(sql);
        try {
            pstmt = conn.prepareStatement(sql);
            if(pstmt.executeUpdate() > 0) {
                flag = true;
                System.out.println("imp:更新count成功");
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
    public boolean delete(int sId) {
        boolean flag = false;
        Connection conn =JDBCManager.getConnection();
        String sql = String.format("delete from sectioninfo where sId=%s;",sId);
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
    @Override
    public boolean updateChild(int sId, String sName, int sParentId) {
        boolean flag = false;
        Connection conn =JDBCManager.getConnection();
        String sql = String.format("update sectioninfo set sName='%s',sParentId=%s where sId=%s;",sName,sParentId,sId);
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
