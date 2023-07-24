package net.pdf;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import net.javaguides.usermanagement.model.User;

import java.io.File;
import java.io.FileOutputStream;

public class PDFGenerator {

    public String generatePDF(User user, String filePath) {
        // Dosya yolu altında belirtilen PDF dosyasını kontrol edin
        File existingFile = new File(filePath);
        if (existingFile.exists()) {
            // Eğer dosya zaten varsa yeni bir PDF oluşturmayın, mevcut dosyanın yoluyla devam edin.
            return filePath;
        }

        // PDF dosyasını oluştur
        Document document = new Document();
        try {
            PdfWriter.getInstance(document, new FileOutputStream(filePath));
            document.open();

            // Başlık ekleyin
            Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18);
            Paragraph title = new Paragraph("Kasko Poliçesi", titleFont);
            title.setAlignment(Paragraph.ALIGN_CENTER);
            document.add(title);

            // Kullanıcı bilgilerini ekleyin
            Font contentFont = FontFactory.getFont(FontFactory.HELVETICA, 12);
            Paragraph content = new Paragraph(
                "Name: " + user.getName() + "\n" +
                "Email: " + user.getEmail() + "\n" +
                "Car Brand: " + user.getBrand() + "\n" +
                "Plate No: " + user.getPlateNo() + "\n"
            );
            document.add(content);

            document.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return filePath;
    }
}







