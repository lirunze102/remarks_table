package com.dao;

import entity.Topic;

import java.util.List;

public interface TopicDao {
    public boolean newTopic(Topic topic);
    public int findTSIdByTId(int tId);
    public List<Topic> selectTopic(int id);
    public Topic selectTopicById(int id);
    public boolean updateCount(int id);
    public int topicCount(int sId);
    public boolean deleteBytId(int id);
    public boolean deleteReplyCount(int id);
}
