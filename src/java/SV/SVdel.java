/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SV;

import java.sql.*;
import java.io.*;
import java.net.*;

import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.json.simple.*;

/**
 *
 * @author pakutsing
 */
public class SVdel extends HttpServlet {

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
            ResultSet rec = null;
            Connection conn = null;
            PreparedStatement ps = null;
            conn = DB.ConnDB.getConnDB();
            String status = request.getParameter("status");
            if (status.equals("D1")) {
                try {
                    String mrno = request.getParameter("mrno").trim();
                    String item = request.getParameter("item").trim();
                    String roll = request.getParameter("roll").trim();




                    String sql = "DELETE FROM wmbarcode WHERE wmbarcode.MRNO = ? AND wmbarcode.ITEM = ? AND wmbarcode.ROLL = ?";

                    ps = conn.prepareStatement(sql);
                    ps.setString(1, mrno);
                    ps.setString(2, item);
                    ps.setString(3, roll);

                    if (ps.executeUpdate() > 0) {
                        out.print("true");
                    } else {
                        out.print("false");
                    }
                    request.setAttribute("mrno", mrno);
                    request.setAttribute("item", item);

                    getServletContext().getRequestDispatcher("/table4.jsp").forward(request, response);


                } catch (Exception e) {
                    e.printStackTrace();
                }
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
