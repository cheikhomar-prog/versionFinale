package backOffice.web;



import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.FileSystems;
import java.nio.file.Paths;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import backOffice.dao.test;


@WebServlet("/Upload")
@MultipartConfig(
		  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  maxFileSize = 1024 * 1024 * 10,      // 10 MB
		  maxRequestSize = 1024 * 1024 * 100   // 100 MB
		)
public class Upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public Upload() {super();}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    Part filePart = request.getPart("file");
		    String fileName = request.getParameter("nom")+"_"+request.getParameter("id")+".jpg";

		    String userDirectory ="C:\\Users\\pc\\eclipse-workspace\\versionFinal\\src\\main\\webapp\\frontOffice\\images\\"+ fileName;
	
		    for (Part part : request.getParts()) {
		      part.write(userDirectory);
		    }
		  
		    response.sendRedirect("chercher.do?motCle=");;
		
	}

}
