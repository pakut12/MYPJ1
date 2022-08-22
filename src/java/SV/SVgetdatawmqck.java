/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SV;

import java.io.*;
import java.net.*;


import java.sql.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.http.*;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author pakutsing
 */
public class SVgetdatawmqck extends HttpServlet {

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

            Connection con1 = null;
            ResultSet rec1 = null;
            PreparedStatement ps1 = null;
            try {
                String mrno = request.getParameter("mrno");
                String item = request.getParameter("item");
                String palet = request.getParameter("palet");

                String sql = "select * from wmbarcode where wmbarcode.MRNO = ? and wmbarcode.ITEM = ? and wmbarcode.PALET =?";
                con = DB.ConnDB.getConnDB();
                ps = con.prepareStatement(sql);
                ps.setString(1, mrno);
                ps.setString(2, item);
                ps.setString(3, palet);
                rec = ps.executeQuery();

                JSONObject obj = new JSONObject();
                ArrayList arrlist = new ArrayList();
                int n = 0;
                ArrayList<Float> sum = new ArrayList<Float>();
                String datein = null;

                while ((rec.next()) && (rec != null)) {
                    sum.add(Float.parseFloat(rec.getString("QUANTITY")));
                    JSONArray arrjson = new JSONArray();
                    arrjson.add(rec.getString("ROLL"));

                    arrjson.add(rec.getString("QUANTITY"));
                    arrlist.add(arrjson);
                    datein = rec.getString("CREATEDATE");
                    n++;
                }
                int z = 0;
                int x = 0;
                while (z < sum.size()) {
                    x += sum.get(z);
                    z++;
                }
                obj.put("datein", datein);
                obj.put("count", n);
                obj.put("sum", x);
                obj.put("data", arrlist);
                out.print(obj);

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
