package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CheckDAO {

	private BaseDAO dao = new BaseDAO();
	private ResultSet rs = null;

	/**
	 * ��֤�������
	 * 
	 * @param sName
	 * @return
	 */
	public Boolean checkSectionName(String sName) {//У��������
		return sName.matches("[\u4e00-\u9fa50-9a-z]{3,20}");
	}

	/**
	 * ��֤�û���
	 * 
	 * @param uName
	 * @return
	 */
	public Boolean checkUserName(String uName) {
		return uName.matches("[\u4e00-\u9fa5A-Za-z0-9]{3,10}");
	}

	/**
	 * ��֤�û����Ƿ��Ѿ�����
	 * @param uName
	 * @return Boolean ����һ�������� true������
	 */
	public Boolean checkUserNameIsExist(String uName) {//��֤�û����Ƿ��Ѿ�����
		String sql = "select * from userInfo where uName = ?";
		Boolean flag = false;//����Ƿ��ѯ�����û�
		try {
			rs = dao.executeQuery(sql, new Object[] { uName });//ִ�в�ѯ

			if(rs != null && rs.next()){//���������д��ڼ�¼
				flag = true;//����Ϊ��ѯ��
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dao.closeResultSet();//�رս����
			dao.closeStatement();//�رմ������
			dao.closeConnection();//�ر����Ӷ���
		}
		return flag;//���ز�ѯ���
	}

	/**
	 * ��֤����
	 * 
	 * @param uPW
	 * @return
	 */
	public Boolean CheckUserPassWord(String uPW) {
		return uPW.matches("[0-9a-zA-Z]{3,20}");
	}

	/**
	 * ��֤���ӱ���
	 * 
	 * @param topic
	 * @return
	 */
	public Boolean checkTopic(String topic) {
		return topic.matches(".{3,20}");
	}

	/**
	 * ��֤��������
	 * 
	 * @param Contents
	 * @return
	 */
	public Boolean checContents(String Contents) {
		return Contents.matches("(.|[\r\n]){1,1000}");//���ƥ����������ַ�
	}

	public static void main(String[] args) {
		String s = "\r\n b a d a \r\n a";
		System.out.print(s.replace("\r\n", "p"));
	}
}
