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
                if (status.equals("G1")) {
                    Connection con = null;
                    ResultSet rec = null;
                    PreparedStatement ps = null;

                    String roll = request.getParameter("roll");
                    String mrno = request.getParameter("mrno");
                    String item = request.getParameter("item");

                    String sql = "select * from wmbarcode where wmbarcode.ROLL = ? and wmbarcode.MRNO = ? and wmbarcode.ITEM = ?";
                    con = DB.ConnDB.getConnDB();
                    ps = con.prepareStatement(sql);
                    ps.setString(1, roll);
                    ps.setString(2, mrno);
                    ps.setString(3, item);
                    rec = ps.executeQuery();

                    while ((rec.next()) && (rec != null)) {
                        request.setAttribute("ROLL", roll);
                        request.setAttribute("MRNO", mrno);
                        request.setAttribute("ITEM", item);
                        request.setAttribute("PALET", rec.getString("PALET"));
                        request.setAttribute("QUANTITY", rec.getString("QUANTITY"));
                        request.setAttribute("BATCH", rec.getString("BATCH"));
                    }

                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/displayedititem.jsp");
                    rd.forward(request, response);

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
