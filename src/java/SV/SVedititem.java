/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SV;

import java.sql.*;
import java.io.*;
import java.net.*;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author pakutsing
 */
public class SVedititem extends HttpServlet {

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
            String status = request.getParameter("status").trim();


            try {
                Connection con = null;
                ResultSet res = null;
                PreparedStatement ps = null;

                if (status.equals("G1")) {
                    String mrno = request.getParameter("mrno");
                    String item = request.getParameter("item");
                    String ROLL = request.getParameter("ROLL");
                    String PALET = request.getParameter("PALET");
                    String QUANTITY = request.getParameter("QUANTITY");
                    String BATCH = request.getParameter("BATCH");


                    String sql = "UPDATE wmbarcode SET wmbarcode.PALET = ?,wmbarcode.QUANTITY=?,wmbarcode.BATCH =? WHERE wmbarcode.MRNO = ? AND wmbarcode.ITEM = ? AND wmbarcode.ROLL = ?";
                    con = DB.ConnDB.getConnDB();
                    ps = con.prepareStatement(sql);
                    ps.setString(1, PALET);
                    ps.setString(2, QUANTITY);
                    ps.setString(3, BATCH);
                    ps.setString(4, mrno);
                    ps.setString(5, item);
                    ps.setString(6, ROLL);

                    if (ps.executeUpdate() > 0) {
                        out.print("true");
                    } else {
                        out.print("false");
                    }

                } else if (status.equals("G2")) {
                    String ITEM = (String) request.getParameter("ITEM");
                    String ROLL = (String) request.getParameter("ROLL");
                    String QUANTITY = (String) request.getParameter("QUANTITY");
                    String UNIT = (String) request.getParameter("UNIT");
                    String COLOR = (String) request.getParameter("COLOR");
                    String BATCH = (String) request.getParameter("BATCH");
                    String DESC1 = (String) request.getParameter("DESC1").replace("!", "#");

                    String INVOICE = (String) request.getParameter("INVOICE");
                    String INVOICEDATE = (String) request.getParameter("INVOICEDATE");
                    String LOT = (String) request.getParameter("LOT");
                    String MRNO = (String) request.getParameter("MRNO");
                    String ITEM1 = (String) request.getParameter("ITEM1");
                    String ROLL1 = (String) request.getParameter("ROLL1");

                    String sql = "UPDATE wmbarcode SET wmbarcode.ITEM = ? , wmbarcode.ROLL = ?,wmbarcode.QUANTITY = ?,wmbarcode.UNIT=?, wmbarcode.COLOR = ?,wmbarcode.BATCH = ?,wmbarcode.DESC1 = ?,wmbarcode.INVOICE=?,wmbarcode.INVOICEDATE=?,wmbarcode.LOT=? WHERE wmbarcode.MRNO = ? AND wmbarcode.ITEM= ? AND wmbarcode.ROLL =?";
                    con = DB.ConnDB.getConnDB();
                    ps = con.prepareStatement(sql);
                    ps.setString(1, ITEM);
                    ps.setString(2, ROLL);
                    ps.setString(3, QUANTITY);
                    ps.setString(4, UNIT);
                    ps.setString(5, COLOR);
                    ps.setString(6, BATCH);
                    ps.setString(7, DESC1);
                    ps.setString(8, INVOICE);
                    ps.setString(9, INVOICEDATE);
                    ps.setString(10, LOT);
                    ps.setString(11, MRNO);
                    ps.setString(12, ITEM1);
                    ps.setString(13, ROLL1);
                    
                    if (ps.executeUpdate() > 0) {
                        out.print("true");
                    } else {
                        out.print("false");
                    }





                }

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
