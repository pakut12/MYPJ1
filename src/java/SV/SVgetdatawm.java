/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SV;

import java.sql.*;
import java.io.*;
import java.net.*;

import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
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
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            ResultSet rec = null;
            Connection conn = null;
            PreparedStatement ps = null;
            conn = DB.ConnDB.getConnDB();
            String status = request.getParameter("status").trim();
            if (status.equals("G1")) {

                try {
                    String menr = request.getParameter("mrno").trim();


                    String page = "";

                    String sql = "select * from wmbarcode where  wmbarcode.MRNO = ? ";

                    ps = conn.prepareStatement(sql);
                    ps.setString(1, menr);
                    rec = ps.executeQuery();

                    JSONObject obj = new JSONObject();
                    ArrayList arrlist = new ArrayList();
                    int n = 0;
                    while ((rec.next()) && (rec != null)) {

                        JSONArray arrjson = new JSONArray();

                        arrjson.add(rec.getString("MRNO"));
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
            } else if (status.equals("G2")) {
                try {
                    String menr = request.getParameter("mrno").trim();
                    String item = request.getParameter("item").trim();


                    String page = "";

                    String sql = "select * from wmbarcode where wmbarcode.MRNO = ? and wmbarcode.ITEM = ? ";

                    ps = conn.prepareStatement(sql);
                    ps.setString(1, menr);
                    ps.setString(2, item);
                    rec = ps.executeQuery();

                    JSONObject obj = new JSONObject();
                    ArrayList arrlist = new ArrayList();
                    int n = 0;
                    while ((rec.next()) && (rec != null)) {

                        JSONArray arrjson = new JSONArray();


                        arrjson.add("<input class='form-control form-control-sm text-center' value='" + rec.getString("ROLL") + "' name='txt0' id='txt0' readonly></input>");
                        arrjson.add("<input class='form-control form-control-sm text-center' value='" + rec.getString("PALET") + "' name='txt1' id='txt1'></input>");
                        arrjson.add("<input class='form-control form-control-sm text-center' value='" + rec.getString("QUANTITY") + "' name='txt2' id='txt2'></input>");
                        arrjson.add("<input class='form-control form-control-sm text-center' value='" + rec.getString("BATCH") + "' name='txt3' id='txt3'></input>");


                        arrlist.add(arrjson);
                        n++;
                    }
                    obj.put("count", n);
                    obj.put("data", arrlist);
                    out.print(obj);



                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (status.equals("G3")) {
                try {
                    String menr = request.getParameter("mrno").trim();



                    String page = "";

                    String sql = "select * from wmbarcode where wmbarcode.MRNO = ?";

                    ps = conn.prepareStatement(sql);
                    ps.setString(1, menr);

                    rec = ps.executeQuery();

                    JSONObject obj = new JSONObject();
                    ArrayList arrlist = new ArrayList();
                    int n = 0;

                    String PLANT = null;
                    String PO = null;
                    String SUPNAME = null;
                    String INVOICE = null;
                    String INVOICEDATE = null;
                    String DELIVERYNO = null;
                    String LOT = null;

                    while ((rec.next()) && (rec != null)) {

                        PLANT = rec.getString("PLANT");
                        PO = rec.getString("PO");
                        SUPNAME = rec.getString("SUPNAME");
                        INVOICE = rec.getString("INVOICE");
                        INVOICEDATE = rec.getString("INVOICEDATE");
                        DELIVERYNO = rec.getString("DELIVERYNO");
                        LOT = rec.getString("LOT");


                        JSONArray arrjson = new JSONArray();
                        arrjson.add("<input class='form-control form-control-sm text-center' value='" + rec.getString("ITEM") + "' name='txt0' id='txt0' ></input>");
                        arrjson.add("<input class='form-control form-control-sm text-center' value='" + rec.getString("ROLL") + "' name='txt1' id='txt1'></input>");
                        arrjson.add("<input class='form-control form-control-sm text-center' value='" + rec.getString("QUANTITY") + "' name='txt2' id='txt2'></input>");
                        arrjson.add("<input class='form-control form-control-sm text-center' value='" + rec.getString("UNIT") + "' name='txt3' id='txt3'></input>");
                        arrjson.add("<input class='form-control form-control-sm text-center' value='" + rec.getString("COLOR") + "' name='txt4' id='txt4'></input>");
                        arrjson.add("<input class='form-control form-control-sm text-center' value='" + rec.getString("BATCH") + "' name='txt5' id='txt5'></input>");
                        arrjson.add("<input class='form-control form-control-sm text-center' value='" + rec.getString("DESC1") + "' name='txt6' id='txt6'></input>");
                        arrjson.add("<input class='form-control form-control-sm text-center' value='" + rec.getString("ITEM") + "' name='txt7' id='txt7' type='hidden' readonly></input>");
                        arrjson.add("<input class='form-control form-control-sm text-center' value='" + rec.getString("ROLL") + "' name='txt8' id='txt8' type='hidden' readonly></input>");

                        arrlist.add(arrjson);
                        n++;
                    }
                    obj.put("PLANT", PLANT);
                    obj.put("PO", PO);
                    obj.put("SUPNAME", SUPNAME);
                    obj.put("INVOICE", INVOICE);
                    obj.put("INVOICEDATE", INVOICEDATE);
                    obj.put("DELIVERYNO", DELIVERYNO);
                    obj.put("LOT", LOT);

                    obj.put("count", n);
                    obj.put("data", arrlist);
                    out.print(obj);



                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (status.equals("G4")) {
                try {
                    String menr = request.getParameter("mrno").trim();
                    String item = request.getParameter("item").trim();


                    String page = "";

                    String sql = "select * from wmbarcode where wmbarcode.MRNO = ? and wmbarcode.ITEM = ? ";

                    ps = conn.prepareStatement(sql);
                    ps.setString(1, menr);
                    ps.setString(2, item);
                    rec = ps.executeQuery();

                    JSONObject obj = new JSONObject();
                    ArrayList arrlist = new ArrayList();
                    int n = 0;
                    while ((rec.next()) && (rec != null)) {

                        JSONArray arrjson = new JSONArray();

                        arrjson.add(rec.getString("PO"));
                        arrjson.add(rec.getString("PLANT"));
                        arrjson.add(rec.getString("ITEM"));
                        arrjson.add(rec.getString("ROLL"));
                        arrjson.add(rec.getString("QUANTITY"));
                        arrjson.add(rec.getString("UNIT"));
                        arrjson.add("<a href='del?status=D1&mrno=" + menr + "&item=" + rec.getString("ITEM") + "&roll=" + rec.getString("ROLL") + "'><button class='btn btn-danger btn-sm' id='btn-send' type='button'>ลบ</button></a>");

                        arrlist.add(arrjson);
                        n++;
                    }
                    obj.put("count", n);
                    obj.put("data", arrlist);
                    out.print(obj);



                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (status.equals("G5")) {
                try {
                    String menr = request.getParameter("mrno").trim();
                    String item = request.getParameter("item").trim();


                    String page = "";

                    String sql = "select * from wmqck where wmqck.MRNO = ? and wmqck.ITEM = ? ";

                    ps = conn.prepareStatement(sql);
                    ps.setString(1, menr);
                    ps.setString(2, item);
                    rec = ps.executeQuery();

                    JSONObject obj = new JSONObject();
                    ArrayList arrlist = new ArrayList();
                    int n = 0;
                    while ((rec.next()) && (rec != null)) {

                        JSONArray arrjson = new JSONArray();


                        arrjson.add(rec.getString("ITEM"));
                        arrjson.add(rec.getString("ROLL"));

                        arrlist.add(arrjson);
                        n++;
                    }
                    obj.put("count", n);
                    obj.put("data", arrlist);
                    out.print(obj);



                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (status.equals("G6")) {
                try {
                    String menr = request.getParameter("mrno").trim();


                    String page = "";

                    String sql = "select * from wmbarcode where wmbarcode.MRNO = ? ";

                    ps = conn.prepareStatement(sql);
                    ps.setString(1, menr);

                    rec = ps.executeQuery();

                    JSONObject obj = new JSONObject();
                    ArrayList arrlist = new ArrayList();
                    int n = 0;
                    while ((rec.next()) && (rec != null)) {

                        JSONArray arrjson = new JSONArray();
                        arrjson.add(rec.getString("ITEM"));
                        arrjson.add(rec.getString("DESC1"));
                        arrjson.add(rec.getString("QUANTITY"));
                        arrjson.add(rec.getString("UNIT"));
                        arrjson.add(rec.getString("ROLL"));
                        arrjson.add(rec.getString("INVOICE"));
                        arrjson.add(rec.getString("COLOR"));

                        arrlist.add(arrjson);
                        n++;
                    }
                    obj.put("count", n);
                    obj.put("data", arrlist);
                    out.print(obj);



                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (status.equals("G7")) {
                try {
                    String po = request.getParameter("po").trim();


                    String page = "";

                    String sql = "select * from wmbarcode where wmbarcode.PO = ? ";

                    ps = conn.prepareStatement(sql);
                    ps.setString(1, po);

                    rec = ps.executeQuery();

                    JSONObject obj = new JSONObject();
                    ArrayList arrlist = new ArrayList();
                    int n = 0;
                    while ((rec.next()) && (rec != null)) {

                        JSONArray arrjson = new JSONArray();
                        arrjson.add(rec.getString("ITEM"));
                        arrjson.add(rec.getString("DESC1"));
                        arrjson.add(rec.getString("ROLL"));
                        arrjson.add(rec.getString("QUANTITY"));
                        arrjson.add(rec.getString("UNIT"));
                        arrjson.add(rec.getString("COLOR"));
                        arrjson.add(rec.getString("INVOICE"));
                        arrjson.add(rec.getString("MRNO"));

                        arrlist.add(arrjson);
                        n++;
                    }
                    obj.put("count", n);
                    obj.put("data", arrlist);
                    out.print(obj);



                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (status.equals("G8")) {
                try {

                    String item = request.getParameter("item");
                    String date1 = request.getParameter("date1");
                    String date2 = request.getParameter("date2");

                    String Y = date1.substring(0, 4);
                    String M = date1.substring(5, 7);
                    String D = date1.substring(8, 10);
                    String day1 = D + "/" + M + "/" + Y;

                    String Y1 = date2.substring(0, 4);
                    String M1 = date2.substring(5, 7);
                    String D1 = date2.substring(8, 10);
                    String day2 = D1 + "/" + M1 + "/" + Y1;



                    String sql = "select * from wmbarcode where wmbarcode.ITEM = ? and wmbarcode.INVOICEDATE BETWEEN TO_DATE(?, 'DD/MM/YYYY') and TO_DATE(?, 'DD/MM/YYYY')";
                    //conn = DB.ConnDB.getConnection();
                    ps = conn.prepareStatement(sql);
                    ps.setString(1, item);
                    ps.setString(2, day1);
                    ps.setString(3, day2);
                    rec = ps.executeQuery();

                    JSONObject obj = new JSONObject();
                    ArrayList arrlist = new ArrayList();
                    int n = 0;
                    while ((rec.next()) && (rec != null)) {

                        JSONArray arrjson = new JSONArray();
                        arrjson.add(rec.getString("ITEM"));
                        arrjson.add(rec.getString("MRNO"));
                        arrjson.add(rec.getString("ROLL"));
                        arrjson.add(rec.getString("PLANT"));
                        arrjson.add(rec.getString("PO"));
                        arrjson.add(rec.getString("CREATEDATE"));
                        arrjson.add(rec.getString("INVOICE"));
                        arrjson.add(rec.getString("INVOICEDATE"));
                        arrjson.add(rec.getString("DELIVERYNO"));
                        arrjson.add(rec.getString("PUNAME"));

                        arrlist.add(arrjson);
                        n++;
                    }
                    obj.put("count", n);
                    obj.put("data", arrlist);
                    out.print(obj);



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
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SVgetdatawm.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SVgetdatawm.class.getName()).log(Level.SEVERE, null, ex);
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
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SVgetdatawm.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SVgetdatawm.class.getName()).log(Level.SEVERE, null, ex);
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
