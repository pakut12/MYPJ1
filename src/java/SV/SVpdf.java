/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SV;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.*;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.*;
import java.net.*;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author pakutsing
 */
public class SVpdf extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, DocumentException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            try {
                Document document = new Document();

                String path = DB.ConnDB.getpathExport() + "TestTableFile.pdf";
                //Create OutputStream instance.
                OutputStream outputStream =
                        new FileOutputStream(new File(path));

                //Create PDFWriter instance.
                PdfWriter.getInstance(document, outputStream);

                //Open the document.
                document.open();

                Font text = new Font(BaseFont.createFont(DB.ConnDB.getpathfont() + "THSarabunNew.ttf",
                        BaseFont.IDENTITY_H, BaseFont.EMBEDDED));
                text.setSize(14);
                Font Bold = new Font(BaseFont.createFont(DB.ConnDB.getpathfont() + "THSarabunNew Bold.ttf",
                        BaseFont.IDENTITY_H, BaseFont.EMBEDDED));
                Bold.setSize(24);

                Font Boldtext = new Font(BaseFont.createFont(DB.ConnDB.getpathfont() + "THSarabunNew Bold.ttf",
                        BaseFont.IDENTITY_H, BaseFont.EMBEDDED));
                Boldtext.setSize(14);


                Paragraph h = new Paragraph("ใบเเจ้งเข้าวัตถุดิบ \n", Bold);
                h.setAlignment(Element.ALIGN_LEFT);

                document.add(h);
                document.add(new Paragraph("\n"));

//Create Table object, Here 4 specify the no. of columns
                PdfPTable Table = new PdfPTable(3);

                PdfPCell H1 = new PdfPCell(new Paragraph("Name of Vendor : ", Boldtext));
                PdfPCell H2 = new PdfPCell(new Paragraph(""));
                PdfPCell H3 = new PdfPCell(new Paragraph("Document No : ", text));
                H1.setBorderColor(BaseColor.WHITE);
                H2.setBorderColor(BaseColor.WHITE);
                H3.setBorderColor(BaseColor.WHITE);

                //Add cells to table
                Table.addCell(H1);
                Table.addCell(H2);
                Table.addCell(H3);
                document.add(Table);

                PdfPTable Table1 = new PdfPTable(3);

                PdfPCell text1 = new PdfPCell(new Paragraph("Po No. : ", Boldtext));
                PdfPCell text2 = new PdfPCell(new Paragraph(""));
                PdfPCell text3 = new PdfPCell(new Paragraph("Pallet : ", text));
                H1.setBorderColor(BaseColor.WHITE);
                H2.setBorderColor(BaseColor.WHITE);
                H3.setBorderColor(BaseColor.WHITE);

                //Add cells to table
                Table1.addCell(text1);
                Table1.addCell(text2);
                Table1.addCell(text3);
                
                document.add(Table1);



                int a = 0;
//
//                int n = 0;//Create cells
//
//                while (n < 100) {
//                    PdfPCell pdfPCell1 = new PdfPCell(new Paragraph(Integer.toString(n + 1)));
//                    PdfPCell pdfPCell2 = new PdfPCell(new Paragraph("Cell 2"));
//                    PdfPCell pdfPCell3 = new PdfPCell(new Paragraph("Cell 3"));
//                    PdfPCell pdfPCell4 = new PdfPCell(new Paragraph("Cell 4"));
//
//                    //Add cells to table
//                    pdfPTable.addCell(pdfPCell1);
//                    pdfPTable.addCell(pdfPCell2);
//                    pdfPTable.addCell(pdfPCell3);
//                    pdfPTable.addCell(pdfPCell4);
//                    n++;
//                }
//

                //Add content to the document using Table objects.


                //Close document and outputStream.
                document.close();
                outputStream.close();


                // getServletContext().getRequestDispatcher(path).forward(request, response);
                out.print(path);
            } catch (Exception e) {
                e.printStackTrace();
            }

        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (DocumentException ex) {
            Logger.getLogger(SVpdf.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (DocumentException ex) {
            Logger.getLogger(SVpdf.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /** 
     * Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}