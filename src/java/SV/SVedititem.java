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
