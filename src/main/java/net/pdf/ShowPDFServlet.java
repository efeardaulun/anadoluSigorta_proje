package net.pdf;

import java.awt.Desktop;
import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/showPDF")
public class ShowPDFServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String filePath = request.getParameter("filePath");

        File file = new File(filePath);
        if (file.exists()) {
            if (Desktop.isDesktopSupported()) {
                try {
                    Desktop.getDesktop().open(file);
                } catch (IOException ex) {
                    // PDF görüntüleyici için kayıtlı bir uygulama yok
                    ex.printStackTrace();
                }
            } else {
                // Masaüstü desteği yok, alternatif bir yöntem kullanabilirsiniz
                response.getWriter().write("Desktop is not supported, cannot open PDF.");
            }
        } else {
            // Dosya mevcut değil, hata mesajı gösterelim
            response.getWriter().write("PDF file does not exist.");
        }
    }
}
