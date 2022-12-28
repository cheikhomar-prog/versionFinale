package backOffice.web;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import backOffice.dao.admin.AdminDaoImpl;
import backOffice.metier.Admin;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
     
         
       	 String email=request.getParameter("email");
       	 String passWord=request.getParameter("passWord");
       	 
       	 AdminDaoImpl adi=  new AdminDaoImpl(); 
       	 Admin a=adi.check(email, passWord);
       	 
       	 if(a!=null) 
       	 {
       		 HttpSession session=request.getSession();
       		 session.setAttribute("admin", a);
       		 
       		 response.sendRedirect("index.do");
       		 
       	 }
       	 else 
       	 {
       		 request.getRequestDispatcher("backOffice/jsp/login.jsp").forward(request,response);
       	 }
        }
        
       
       	 
       	 	
	
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
