package net.pdf;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.javaguides.usermanagement.dao.UserDAO;
import net.javaguides.usermanagement.model.User;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/generatePDF")
public class GeneratePDFServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	//String showPDF = request.getParameter("showPDF");
    	
    	
    	
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String brand = request.getParameter("brand");
        String plateNo = request.getParameter("plateNo");
        String filePath = request.getParameter("filePath");

        User user = new User(id, name, email, brand, plateNo);
        try {
			userDAO.insertUser(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        PDFGenerator p = new PDFGenerator();
        try {
            p.generatePDF(user, filePath);
		}catch (Exception e){
			e.printStackTrace();
		}
        

        // PDF oluşturulduktan sonra kullanıcıyı ana sayfaya yönlendirebilirsiniz
        response.sendRedirect(request.getContextPath() + "/list");
    }
    
}



