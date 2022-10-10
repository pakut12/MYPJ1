/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SV;

import java.io.*;
import java.net.*;

import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author pakutsing
 */
public class SVsendtoqc extends HttpServlet {

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
            Connection con = null;
            ResultSet rec = null;
            PreparedStatement ps = null;

            try {
                con = DB.ConnDB.getConnection();
                String id = request.getParameter("mrno");
                String sql = "SELECT MRNO,ITEM,ROLL,PALET,QUANTITY FROM wmbarcode WHERE wmbarcode.MRNO = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, id);
                rec = ps.executeQuery();
                int numrow = 0;
                while (rec.next()) {
                    Connection conin = null;
                    PreparedStatement psin = null;
                    try {
                        String sqlin = "INSERT INTO wmqck (MRNO, ITEM, ROLL, PALET, ACTQTY) " +
                                "VALUES (?, ?,?, ?, ?)";

//                        out.print(rec.getString("MRNO"));
//                        out.print(rec.getString("ITEM"));
//                        out.print(rec.getString("ROLL"));
//                        out.print(rec.getString("QUANTITY"));
                        conin = DB.ConnDB.getConnection();
                        psin = conin.prepareStatement(sqlin);
                        psin.setString(1, rec.getString("MRNO"));
                        psin.setString(2, rec.getString("ITEM"));
                        psin.setString(3, rec.getString("ROLL"));
                        psin.setString(4, rec.getString("PALET"));
                        psin.setString(5, rec.getString("QUANTITY"));

                        if (psin.executeUpdate() > 0) {
                            numrow++;
                        }
                        psin.close();
                        DB.ConnDB.closeConnection(conin);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                if (numrow > 0) {
                    out.print("true");
                } else {
                    out.print("false");
                }

            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    rec.close();
                    ps.close();
                    DB.ConnDB.closeConnection(con);
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
