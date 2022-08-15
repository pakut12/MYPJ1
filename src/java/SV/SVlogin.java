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
                MessageDigest md;
                md = MessageDigest.getInstance("MD5");
                md.reset();
                md.update(pass.getBytes());
                String digestpass = new BigInteger(1, md.digest()).toString(16).toUpperCase();

                String sql = "select * from pgusertab where userid = ? and passwd = ? and statwork <> 'Y'";
                conn = DB.ConnDB.getConnection();
                ps = conn.prepareStatement(sql);
                ps.setString(1, user);
                ps.setString(2, digestpass);
                rec = ps.executeQuery();

                if ((rec != null) && (rec.next())) {
                    page = "/home.jsp";
                    request.getSession().setAttribute("user", user);
                } else {
                    page = "/index.jsp";
                }

                RequestDispatcher rd = getServletContext().getRequestDispatcher(page);
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
