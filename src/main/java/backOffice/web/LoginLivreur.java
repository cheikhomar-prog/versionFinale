package backOffice.web;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import backOffice.dao.livreur.LivreurDaoImpl;
import backOffice.metier.Livreur;


@WebServlet("/LoginLivreur")
public class LoginLivreur extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      	 String nomComplet=request.getParameter("nomComplet");
      	 String cin=request.getParameter("cin");
      	 
      	 
      	 
      	 LivreurDaoImpl liv=  new LivreurDaoImpl();
      	 Livreur l=liv.check(nomComplet,cin);
      	 
      	
      	 
      	 
      	 if(l!=null) 
      	 {
      		 HttpSession session=request.getSession();
      		 session.setAttribute("livreur", l);
      		 
      		 response.sendRedirect("index.lo");
      		 
      	 }
      	 else 
      	 {
      		 request.getRequestDispatcher("backOffice/jsp/loginLivreur.jsp").forward(request,response);
      	 }
       }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
