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
        int id = Integer.parseInt(request.getParameter("id"));

        // UserDAO kullanarak kullanıcı bilgilerini al
        User user = userDAO.selectUser(id);

        // Kullanıcı bilgileri alındıysa PDF oluştur
        if (user != null) {
            String filePath = "/Users/efeardaulun/eclipse-workspace/deneme/files/" + user.getId() + "_kasko_police.pdf";

            PDFGenerator p = new PDFGenerator();
            String pdfPath = p.generatePDF(user, filePath);

            if (pdfPath != null) {
                // PDF oluşturulduktan sonra kullanıcıyı ana sayfaya yönlendir
                response.sendRedirect(request.getContextPath() + "/list");
            } else {
                request.setAttribute("message", "Önceden oluşturulmuş bir PDF dosyası mevcut.");
                request.getRequestDispatcher("/user-list.jsp").forward(request, response);
            }
        } else {
            // Kullanıcı bulunamadı hatası durumunda kullanıcıya bir hata mesajı göster
            // Örneğin: request.setAttribute("errorMessage", "Kullanıcı bulunamadı.");
            // Ardından hata sayfasına yönlendir
        }
    }
}
