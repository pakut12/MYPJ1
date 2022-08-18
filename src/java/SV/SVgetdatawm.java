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
import org.json.simple.*;

/**
 *
 * @author pakutsing
 */
public class SVgetdatawm extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            try {
                String menr = request.getParameter("mrno").trim();

                ResultSet rec = null;
                Connection conn = null;
                PreparedStatement ps = null;
                String page = "";

                String sql = "select * from wmbarcode where  wmbarcode.MRNO = ? ";
                conn = DB.ConnDB.getConnection();
                ps = conn.prepareStatement(sql);
                ps.setString(1, menr);
                rec = ps.executeQuery();

                JSONObject obj = new JSONObject();
                ArrayList arrlist = new ArrayList();
                int n = 0;
                while ((rec.next()) && (rec != null)) {

                    JSONArray arrjson = new JSONArray();
                    arrjson.add("");
                    arrjson.add(n);
                    arrjson.add(rec.getString("MRNO"));
                    arrjson.add(rec.getString("ITEM"));
                    arrjson.add(rec.getString("ROLL"));
                    arrjson.add(rec.getString("PALET"));
                    arrjson.add(rec.getString("PLANT"));
                    arrjson.add(rec.getString("DESC1"));
                    arrjson.add(rec.getString("DESC2"));
                    arrjson.add(rec.getString("DESC3"));
                    arrjson.add(rec.getString("PO"));
                    arrjson.add(rec.getString("POLN"));
                    arrjson.add(rec.getString("INVOICEDATE"));
                    arrjson.add(rec.getString("CREATEDATE"));
                    arrjson.add(rec.getString("QUANTITY"));
                    arrjson.add(rec.getString("UNIT"));
                    arrjson.add(rec.getString("SUPNAME"));
                    arrjson.add(rec.getString("INVOICE"));
                    arrjson.add(rec.getString("GRADE"));
                    arrjson.add(rec.getString("CODE"));
                    arrjson.add(rec.getString("BATCH"));
                    arrjson.add(rec.getString("CHANGEDATE"));
                    arrjson.add(rec.getString("COLOR"));
                    arrjson.add(rec.getString("SUPPLIER"));
                    arrjson.add(rec.getString("DELIVERYNO"));
                    arrjson.add(rec.getString("PUGROUP"));
                    arrjson.add(rec.getString("PUNAME"));
                    arrjson.add(rec.getString("TELEPHONE"));
                    arrjson.add(rec.getString("PRICE"));
                    arrjson.add(rec.getString("PRD"));
                    arrjson.add(rec.getString("LOT"));
                    arrjson.add(rec.getString("PER"));
                    arrjson.add(rec.getString("CURR"));
                    arrjson.add(rec.getString("TOQC"));
                    arrjson.add(rec.getString("TOTEST"));
                    arrjson.add(rec.getString("RESULTQC"));
                    arrjson.add(rec.getString("RESULTTEST"));
                    arrjson.add(rec.getString("PAGE"));
                    arrjson.add(rec.getString("AFTERQTY"));
                    arrjson.add(rec.getString("REMARKRM1"));
                    arrjson.add(rec.getString("REMARKRM2"));
                    arrjson.add(rec.getString("REMARKRM3"));
                    arrjson.add(rec.getString("SAVEDATE"));
                    arrjson.add(rec.getString("DMWEIGHT"));
                    arrjson.add(rec.getString("MWEIGHT"));
                    arrjson.add(rec.getString("RMWIDTH"));
                    arrjson.add(rec.getString("REFMRNO"));
                    arrjson.add(rec.getString("OLDINVOICE"));
                    arrjson.add(rec.getString("REALQTY"));
                    arrjson.add(rec.getString("WEIGHT"));

                    arrlist.add(arrjson);
                    n++;
                }

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
