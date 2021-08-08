package filter;

import java.io.IOException;
import java.util.Arrays;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class UserLoginFilter
 */
@WebFilter(filterName="UserLoginFilter",urlPatterns="*.jsp")
public class UserLoginFilter implements Filter {
	String[] checkinfo = null;
    public UserLoginFilter() {
        // TODO Auto-generated constructor stub
    }


	public void destroy() {
		// TODO Auto-generated method stub
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		HttpSession session = req.getSession();
		System.out.println(session);
		String url = req.getRequestURI();
		System.out.println(url);
		if(url.endsWith("login.jsp") || url.endsWith("reg.jsp")) {
			chain.doFilter(request, response);
		}else {
			if(session.getAttribute("uName")==null) {
				resp.sendRedirect("login.jsp");
			}else {
				chain.doFilter(request, response);
			}
		}
	}


	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("UserLoginFilter被创建");

	}

}
