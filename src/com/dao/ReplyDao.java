package com.dao;

import entity.Reply;
import entity.Topic;

import java.util.List;

public interface ReplyDao {
    public boolean newReply(Reply reply);
    public List<Reply> selectBytId(int id);
    public void deleteById(int id);
    public Reply selectByrId(int rId);
    public int selectTopicIdByRId(int rid);
    public List<Reply> queryByPage(int pageNow,int rTId);
}
