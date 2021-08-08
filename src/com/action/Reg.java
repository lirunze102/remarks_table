package com.action;
import com.dao.CheckDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class RegAction
 */
@WebServlet("/RegServletAjax")
public class Reg extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Reg() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		CheckDAO check_dao = new CheckDAO();
		String uName = request.getParameter("uName");
		System.out.println(uName);
		if(!check_dao.checkUserName(uName)){
			System.out.println("由英文字母和数字组成的3-10位字符！");
			response.getWriter().write("由英文字母和数字组成的3-10位字符！");
		}
		else if (check_dao.checkUserNameIsExist(uName)) {
			System.out.println("该用户名已存在！");
			response.getWriter().write("该用户名已存在！");
		}
		else{
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
