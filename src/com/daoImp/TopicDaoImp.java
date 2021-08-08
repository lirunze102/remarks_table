package com.daoImp;

import com.dao.JDBCManager;
import com.dao.TopicDao;
import entity.Topic;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TopicDaoImp implements TopicDao {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;


    @Override
    public boolean newTopic(Topic topic) {
        boolean flag = false;
        conn = JDBCManager.getConnection();
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateStr = format.format(date);
        int tReplyCount=0;
        int tClickCount=0;
        String sql = "insert into topicinfo(tSId, tUId, tTopic, tContents,tReplyCount,tClickCount,tPublishTime) values(?, ?, ?, ? ,? ,?,?)";
//        String sql=String.format("select uType from userinfo where uName='%s';",uName);
//        System.out.println(sql);
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setObject(1, topic.getTsId());
            pstmt.setObject(2, topic.getTuId());
            pstmt.setObject(3, topic.gettTopic());
            pstmt.setObject(4, topic.gettContents());
            pstmt.setObject(5, tReplyCount);
            pstmt.setObject(6, tClickCount);
            pstmt.setObject(7,dateStr);
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
    public int findTSIdByTId(int tId) {
        conn =JDBCManager.getConnection();
        String sql=String.format("select tSId from topicinfo where tId ='" + tId + "';");
//        System.out.println(sql);
        int id=0;
        try {
            pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            rs = pstmt.executeQuery();
            rs.first();
            id = rs.getInt(1);

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            JDBCManager.close(rs,pstmt,conn);
        }
        return id;
    }

    @Override
    public List<Topic> selectTopic(int id) {
        List<Topic> topics = new ArrayList<>();
        conn = JDBCManager.getConnection();
        String sql = "select * from topicinfo where tSId="+id;
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                int tId = rs.getInt(1);
                int tSId = rs.getInt(2);
                int tUId = rs.getInt(3);
                String tTopic = rs.getString(4);
                String tContents = rs.getString(5);
                int ReplyCount = rs.getInt(6);
                int tClickCount = rs.getInt(7);
                Date tPublishTime = rs.getDate(8);
                Date tModifyTime = rs.getDate(9);
                Topic topic=new Topic(tId,tSId,tUId,tTopic,tContents,ReplyCount,tClickCount,tPublishTime,tModifyTime);
                topics.add(topic);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            JDBCManager.close(rs,pstmt,conn);
        }
        return topics;
    }

    @Override
    public Topic selectTopicById(int id) {
        Topic topic = new Topic();
        conn = JDBCManager.getConnection();
        String sql = "select * from topicinfo where tId="+id;
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                int tId = rs.getInt(1);
                int tSId = rs.getInt(2);
                int tUId = rs.getInt(3);
                String tTopic = rs.getString(4);
                String tContents = rs.getString(5);
                int ReplyCount = rs.getInt(6);
                int tClickCount = rs.getInt(7);
                Date tPublishTime = rs.getDate(8);
                Date tModifyTime = rs.getDate(9);
                topic=new Topic(tId,tSId,tUId,tTopic,tContents,ReplyCount,tClickCount,tPublishTime,tModifyTime);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            JDBCManager.close(rs,pstmt,conn);
        }
        return topic;
    }

    @Override
    public boolean updateCount(int id) {
        boolean flag = false;
        Connection conn =JDBCManager.getConnection();
        String sql = String.format("update topicinfo set tReplyCount=tReplyCount+1 where tId=%s;",id);
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
    public int topicCount(int sId) {
        int count = 0;
        conn =JDBCManager.getConnection();
        String sql = "select count(*) from topicinfo where tSId ='" + sId + "';";
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            rs.first();
            count=rs.getInt(1);
        }
        catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            JDBCManager.close(rs,pstmt,conn);
        }
        return count;
    }

    @Override
    public boolean deleteBytId(int id) {
        boolean flag = false;
        Connection conn =JDBCManager.getConnection();
        String sql = String.format("delete from topicinfo where tId=%s;",id);
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
    public boolean deleteReplyCount(int id) {
        boolean flag = false;
        Connection conn =JDBCManager.getConnection();
        String sql = String.format("update topicinfo set tReplyCount=tReplyCount-1 where tId=%s;",id);
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
