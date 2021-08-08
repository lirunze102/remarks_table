package com.dao;

import entity.User;

import java.util.List;

public interface UserDao {
    public boolean login(String username, String password);
    public int getuType(String uName);
    public boolean reg(User user);
    public int getUserIdByName(String uName);
    public String findNameById(int id);
    public String findFaceById(int id);
    public User selectBtId(String uName);
    public boolean updateById(User user);
    public List<User> selectAll();
    public boolean changTypeById(int id,int typee);

}
