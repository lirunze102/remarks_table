package com.daoImp;

import com.dao.JDBCManager;
import com.dao.ReplyDao;
import entity.Reply;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ReplyDaoImp implements ReplyDao {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    @Override
    public boolean newReply(Reply reply) {
        boolean flag = false;
        conn = JDBCManager.getConnection();
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateStr = format.format(date);

//        System.out.println(reply.getrTopic()+"+"+reply.getrContents());
        String sql = "insert into replyinfo(rTId, rSId,rUId, rTopic, rContents,rPublishTime) values(?, ?, ?, ? ,? ,?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setObject(1, reply.getRtId());
            pstmt.setObject(2, reply.getRsId());
            pstmt.setObject(3, reply.getRuId());
            pstmt.setObject(4, reply.getrTopic());
            pstmt.setObject(5, reply.getrContents());
            pstmt.setObject(6, dateStr);
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
    public List<Reply> selectBytId(int id) {
        List<Reply> replys = new ArrayList<>();
        conn = JDBCManager.getConnection();
        String sql = "select * from replyinfo where rTId="+id;
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                int rId = rs.getInt(1);
                int rtId = rs.getInt(2);
                int rsId = rs.getInt(3);
                int ruId = rs.getInt(4);
                String rTopic = rs.getString(5);
                String rContent = rs.getString(6);
                Date rPublish = rs.getDate(7);
                Date rModify = rs.getDate(8);
                Reply reply=new Reply(rId,rtId,rsId,ruId,rTopic,rContent,rPublish,rModify);
                replys.add(reply);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            JDBCManager.close(rs,pstmt,conn);
        }
        return replys;
    }

    @Override
    public void deleteById(int id) {
        conn = JDBCManager.getConnection();
        String sql = "delete from replyinfo where rId="+id;
        try {
            pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
//            pstmt.setInt(1,id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            JDBCManager.close(rs,pstmt,conn);
        }
    }

    @Override
    public Reply selectByrId(int rId) {
        Reply reply = new Reply();
        conn = JDBCManager.getConnection();
        String sql = "select * from replyinfo where rId="+rId;
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                int Id = rs.getInt(1);
                int rtId = rs.getInt(2);
                int rsId = rs.getInt(3);
                int ruId = rs.getInt(4);
                String rTopic = rs.getString(5);
                String rContent = rs.getString(6);
                Date rPublish = rs.getDate(7);
                Date rModify = rs.getDate(8);
                reply=new Reply(Id,rtId,rsId,ruId,rTopic,rContent,rPublish,rModify);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            JDBCManager.close(rs,pstmt,conn);
        }
        return reply;
    }

    @Override
    public int selectTopicIdByRId(int rid) {
        conn =JDBCManager.getConnection();
//        String sql = "select uId from userinfo where uName="+uName;
        String sql=String.format("select rTId from replyinfo where rId ="+rid);
        System.out.println(sql);
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
    public List<Reply> queryByPage(int pageNow, int rTId) {
        int pageCount = 5;
        List<Reply> replys = new ArrayList<>();
        conn =JDBCManager.getConnection();
//        String sql=String.format("select * from replyinfo where rTId ="+rTId);
        String sql = "select * from replyinfo where rTId=? limit ?,?";
        System.out.println(sql);
//        String sql = "select * from replyinfo where rTId ='" + rTId + "' limit ?,?";
        try {
            pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pstmt.setObject(1, rTId);
            pstmt.setObject(2, (pageNow-1)*pageCount);
            pstmt.setObject(3, pageCount);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                int Id = rs.getInt(1);
                int rtId = rs.getInt(2);
                int rsId = rs.getInt(3);
                int ruId = rs.getInt(4);
                String rTopic = rs.getString(5);
                String rContent = rs.getString(6);
                Date rPublish = rs.getDate(7);
                Date rModify = rs.getDate(8);
                Reply reply=new Reply(Id,rtId,rsId,ruId,rTopic,rContent,rPublish,rModify);
                replys.add(reply);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            JDBCManager.close(rs,pstmt,conn);
        }
        return replys;
    }
}
