/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SV;

import java.sql.*;
import java.io.*;
import java.net.*;

import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Gus
 */
public class SVprint extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String mrno = request.getParameter("mrno");
            String item = request.getParameter("item");
            String palet = request.getParameter("palet");
            String date = request.getParameter("today");
            String row = request.getParameter("totalrow");
            String roll = request.getParameter("totallong");


            Connection con = null;
            ResultSet rec = null;
            PreparedStatement ps = null;

            try {
                String sql = "select * from wmbarcode where wmbarcode.MRNO = ? and wmbarcode.ITEM = ? and wmbarcode.PALET =?";
                // con = DB.ConnDB.getConnection();
                con = DB.ConnDB.getConnection();
                ps = con.prepareStatement(sql);
                ps.setString(1, mrno);
                ps.setString(2, item);
                ps.setString(3, palet);
                rec = ps.executeQuery();

                String SUPNAME = null;
                String MRNO = null;
                String PO = null;
                String POLN = null;
                String PALET = null;
                String CREATEDATE = null;
                String INVOICE = null;
                String PLANT = null;
                String INVOICEDATE = null;
                String ITEM = null;
                String DESC1 = null;
                String LOT = null;
                String UNIT = null;

                String[] arr = new String[Integer.valueOf(row)];
                int n = 0;
                while ((rec.next()) && (rec != null)) {

                    SUPNAME = rec.getString("SUPNAME");
                    MRNO = rec.getString("MRNO");
                    PO = rec.getString("PO");
                    POLN = rec.getString("POLN");
                    PALET = rec.getString("PALET");
                    CREATEDATE = rec.getString("CREATEDATE");
                    INVOICE = rec.getString("INVOICE");
                    PLANT = rec.getString("PLANT");
                    INVOICEDATE = rec.getString("INVOICEDATE");
                    ITEM = rec.getString("ITEM");
                    DESC1 = rec.getString("DESC1");
                    LOT = rec.getString("LOT");
                    UNIT = rec.getString("UNIT");

                    arr[n] = rec.getString("QUANTITY");
                    n++;
                }
                request.setAttribute("SUPNAME", SUPNAME);
                request.setAttribute("MRNO", MRNO);
                request.setAttribute("PO", PO);
                request.setAttribute("POLN", POLN);
                request.setAttribute("PALET", PALET);
                request.setAttribute("CREATEDATE", CREATEDATE);
                request.setAttribute("INVOICE", INVOICE);
                request.setAttribute("PLANT", PLANT);
                request.setAttribute("INVOICEDATE", INVOICEDATE);
                request.setAttribute("ITEM", ITEM);
                request.setAttribute("DESC1", DESC1);
                request.setAttribute("LOT", LOT);
                request.setAttribute("UNIT", UNIT);

                request.setAttribute("row", row);
                request.setAttribute("roll", roll);
                request.setAttribute("data", arr);



                RequestDispatcher rd = getServletContext().getRequestDispatcher("/displayprint.jsp");
                rd.forward(request, response);




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
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
