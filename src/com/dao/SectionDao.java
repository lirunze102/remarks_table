package com.dao;

import entity.Section;

import java.util.List;

public interface SectionDao {
    public int getSectionIdByName(String uName);
    public boolean newSection(Section section);
    public List<Section> selectParentSection();
    public List<Section> selectSonSection(int id);
    public Section selectById(int id);
    public boolean deletecount(int id);
    public boolean addcount(int id);
    public boolean delete(int sId);
//    public boolean deleteChild(int sId);
public boolean updateChild(int sId, String sName, int sParentId);
}
