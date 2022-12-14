/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SV;

import java.io.*;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Gus
 */
public class SVlogin extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, NoSuchAlgorithmException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
    
        try {
            String user = request.getParameter("txt1");
            String pass = request.getParameter("txt2");
            String page = null;

            ResultSet rec = null;
            Connection conn = null;
            PreparedStatement ps = null;

            try {

                String sql = "SELECT * FROM wmuser WHERE wmuser.userid = ? AND wmuser.password = ?";
                conn = DB.ConnDB.getConnection();
                ps = conn.prepareStatement(sql);
                ps.setString(1, user);
                ps.setString(2, pass);
                rec = ps.executeQuery();

                if ((rec != null) && (rec.next())) {

                    page = "home.jsp";

                    request.getSession().setAttribute("status", rec.getString("status"));
                    request.getSession().setAttribute("statusqi", rec.getString("statusqi"));
                    request.getSession().setAttribute("user", user);
                    request.getSession().setAttribute("name", rec.getString("firstname").replace(" ", ""));
                    request.getSession().setAttribute("surname", rec.getString("lastname"));
                    out.print("<script langquage='javascript'>window.location='" + page + "';</script>");
                } else {
                    page = "/index.jsp";
                    request.setAttribute("status", "error");
                    getServletContext().getRequestDispatcher(page).forward(request, response);
                }

            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    ps.close();
                    DB.ConnDB.closeConnection(conn);
                    rec.close();
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
        try {
            try {
                processRequest(request, response);
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(SVlogin.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SVlogin.class.getName()).log(Level.SEVERE, null, ex);
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
            try {
                processRequest(request, response);
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(SVlogin.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SVlogin.class.getName()).log(Level.SEVERE, null, ex);
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
