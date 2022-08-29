/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SV;

import java.sql.*;
import java.io.*;
import java.net.*;

import java.text.SimpleDateFormat;
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

//            conn = DB.ConnDB.getConnDB();
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


                    String sql = "select * from wmbarcode where wmbarcode.ITEM = ? and wmbarcode.CREATEDATE BETWEEN TO_DATE(?, 'DD/MM/YYYY') and TO_DATE(?, 'DD/MM/YYYY')";
//                    String sql = "select * from wmbarcode where wmbarcode.ITEM = ? and wmbarcode.INVOICEDATE BETWEEN TO_DATE(?, 'DD/MM/YYYY') and TO_DATE(?, 'DD/MM/YYYY')";
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
            } else if (status.equals("G9")) {

                try {
                    String mrno = request.getParameter("mrno");
                    String item = request.getParameter("item");
                    String palet = request.getParameter("palet");

                    String sql = "select * from wmbarcode where wmbarcode.MRNO = ? and wmbarcode.ITEM = ? and wmbarcode.PALET =?";


                    ps = conn.prepareStatement(sql);
                    ps.setString(1, mrno);
                    ps.setString(2, item);
                    ps.setString(3, palet);
                    rec = ps.executeQuery();

                    JSONObject obj = new JSONObject();
                    ArrayList arrlist = new ArrayList();
                    int n = 0;
                    ArrayList<Float> sum = new ArrayList<Float>();
                    while ((rec.next()) && (rec != null)) {
                        sum.add(Float.parseFloat(rec.getString("QUANTITY")));
                        JSONArray arrjson = new JSONArray();

                        arrjson.add(rec.getString("ROLL"));
                        arrjson.add(rec.getString("QUANTITY"));

                        arrlist.add(arrjson);
                        n++;
                    }
                    int z = 0;
                    int x = 0;
                    while (z < sum.size()) {
                        x += sum.get(z);
                        z++;
                    }
                    obj.put("sum", x);
                    obj.put("count", n);
                    obj.put("data", arrlist);
                    out.print(obj);

                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (status.equals("G10")) {
                String mrno = request.getParameter("mrno");
                String item = request.getParameter("item");
                String palet = request.getParameter("palet");
                String date = request.getParameter("today");
                String row = request.getParameter("totalrow");
                String roll = request.getParameter("totallong");

                try {
                    String sql = "select * from wmbarcode where wmbarcode.MRNO = ? and wmbarcode.ITEM = ? and wmbarcode.PALET =?";


                    ps = conn.prepareStatement(sql);
                    ps.setString(1, mrno);
                    ps.setString(2, item);
                    ps.setString(3, palet);
                    rec = ps.executeQuery();

                    String SUPNAME = null;
                    String MRNO = null;
                    String PO = null;
                    String POLN = null;
                    String PALET = null;
                    String CREATEDATE = null;
                    String INVOICE = null;
                    String PLANT = null;
                    String INVOICEDATE = null;
                    String ITEM = null;
                    String DESC1 = null;
                    String LOT = null;
                    String UNIT = null;

                    String[] arr = new String[Integer.valueOf(row)];
                    int n = 0;
                    while ((rec.next()) && (rec != null)) {

                        SUPNAME = rec.getString("SUPNAME");
                        MRNO = rec.getString("MRNO");
                        PO = rec.getString("PO");
                        POLN = rec.getString("POLN");
                        PALET = rec.getString("PALET");
                        CREATEDATE = rec.getString("CREATEDATE");
                        INVOICE = rec.getString("INVOICE");
                        PLANT = rec.getString("PLANT");
                        INVOICEDATE = rec.getString("INVOICEDATE");
                        ITEM = rec.getString("ITEM");
                        DESC1 = rec.getString("DESC1");
                        LOT = rec.getString("LOT");
                        UNIT = rec.getString("UNIT");

                        arr[n] = rec.getString("QUANTITY");
                        n++;
                    }
                    request.setAttribute("SUPNAME", SUPNAME);
                    request.setAttribute("MRNO", MRNO);
                    request.setAttribute("PO", PO);
                    request.setAttribute("POLN", POLN);
                    request.setAttribute("PALET", PALET);
                    request.setAttribute("CREATEDATE", CREATEDATE);
                    request.setAttribute("INVOICE", INVOICE);
                    request.setAttribute("PLANT", PLANT);
                    request.setAttribute("INVOICEDATE", INVOICEDATE);
                    request.setAttribute("ITEM", ITEM);
                    request.setAttribute("DESC1", DESC1);
                    request.setAttribute("LOT", LOT);
                    request.setAttribute("UNIT", UNIT);

                    request.setAttribute("row", row);
                    request.setAttribute("roll", roll);
                    request.setAttribute("data", arr);



                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/displayprint.jsp");
                    rd.forward(request, response);




                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (status.equals("G11")) {


                try {
                    String barcode = request.getParameter("barcode");

                    String sql = "select * from (wmmaster  inner join wmbarcode on wmmaster.BARCODE = wmbarcode.CODE) inner join wmqck on wmqck.MRNO = wmmaster.MRNO and wmqck.ITEM = wmmaster.ITEM and wmqck.ROLL = wmmaster.ROLL  where wmmaster.BARCODE = ?";

                    ps = conn.prepareStatement(sql);
                    ps.setString(1, barcode);
                    rec = ps.executeQuery();

                    JSONObject obj = new JSONObject();
                    ArrayList arrlist = new ArrayList();
                    while ((rec != null) && (rec.next())) {

                        obj.put("mrno", rec.getString("mrno"));
                        obj.put("item", rec.getString("item"));
                        obj.put("roll", rec.getString("roll"));
                        obj.put("pallet", rec.getString("palet"));

                        String ethread = rec.getString("ethread");
                        String ealkali = rec.getString("ealkali");
                        String edirty = rec.getString("edirty");
                        String eoil = rec.getString("eoil");
                        String ebroken = rec.getString("ebroken");
                        String eknot = rec.getString("eknot");
                        String ejoint = rec.getString("ejoint");
                        String efurrow = rec.getString("efurrow");

                       
                        arrlist.add(rec.getString("quantity"));
                        arrlist.add(rec.getString("actqty"));
                        arrlist.add(rec.getString("width"));
                        arrlist.add(ethread);
                        arrlist.add(ealkali);
                        arrlist.add(edirty);
                        arrlist.add(eoil);
                        arrlist.add(ebroken);
                        arrlist.add(eknot);
                        arrlist.add(ejoint);
                        arrlist.add(efurrow);
                        arrlist.add("");
                        arrlist.add(rec.getString("erepeat"));
                        arrlist.add(rec.getString("color"));
                        arrlist.add(rec.getString("batch"));
                        arrlist.add(DB.ConnDB.coverdate(rec.getString("qcdate")));
                        arrlist.add(rec.getString("grade"));
                        arrlist.add(rec.getString("gradeqc"));
                        arrlist.add(rec.getString("weight"));
                        arrlist.add(rec.getString("qtylay"));
                        arrlist.add(rec.getString("byname"));
                        arrlist.add(rec.getString("mark"));

                        obj.put("data", arrlist);

                    }
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
