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

//            conn = DB.ConnDB.getConnection();
            conn = DB.ConnDB.getConnection();
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
                        arrjson.add(rec.getString("QUANTITY"));
                        arrjson.add(rec.getString("UNIT"));
                        arrjson.add(rec.getString("PALET"));
                        arrjson.add(rec.getString("PLANT"));
                        arrjson.add(rec.getString("PO"));
                        arrjson.add(rec.getString("POLN"));
                        arrjson.add(rec.getString("INVOICE"));
                        arrjson.add(rec.getString("INVOICEDATE").replace(" 00:00:00.0", ""));
                        arrjson.add(rec.getString("DESC1"));
                        arrjson.add(rec.getString("DESC2"));
                        arrjson.add(rec.getString("DESC3"));
                        arrjson.add(rec.getString("CODE"));
                        arrjson.add(rec.getString("BATCH"));
                        arrjson.add(rec.getString("COLOR"));
                        arrjson.add(rec.getString("GRADE"));


                        arrlist.add(arrjson);
                        n++;
                    }
                    if (n > 0) {
                        obj.put("status", "true");
                    } else if (n <= 0) {
                        obj.put("status", "false");
                    }


                    obj.put("data", arrlist);
                    out.print(obj);



                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (status.equals("G2")) {
                try {
                    String menr = request.getParameter("mrno").trim();
                    String item = request.getParameter("item").trim().toUpperCase();


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
                        INVOICEDATE = DB.ConnDB.coverdate(rec.getString("INVOICEDATE"));
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
                    String item = request.getParameter("item").trim().toUpperCase();


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
                    String item = request.getParameter("item").trim().toUpperCase();


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

                        arrjson.add(rec.getString("ROLL"));
                        arrjson.add(rec.getString("QUANTITY"));
                        arrjson.add(rec.getString("UNIT"));
                        arrjson.add(rec.getString("COLOR"));
                        arrjson.add(rec.getString("INVOICE"));
                        arrjson.add(rec.getString("MRNO"));
                        arrjson.add(rec.getString("DESC1"));

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

                    String item = request.getParameter("item").trim().toUpperCase();
                    String date1 = request.getParameter("date1").trim();
                    String date2 = request.getParameter("date2").trim();

                    String Y = date1.substring(0, 4);
                    String M = date1.substring(5, 7);
                    String D = date1.substring(8, 10);
                    String day1 = D + "/" + M + "/" + Y;

                    String Y1 = date2.substring(0, 4);
                    String M1 = date2.substring(5, 7);
                    String D1 = date2.substring(8, 10);
                    String day2 = D1 + "/" + M1 + "/" + Y1;


                    String sql = "select wmbarcode.MRNO,max(wmbarcode.ROLL) as MAX,wmbarcode.ITEM,wmbarcode.PLANT,wmbarcode.PO,wmbarcode.INVOICEDATE,wmbarcode.INVOICE,wmbarcode.PUNAME from wmbarcode where wmbarcode.ITEM = ? and wmbarcode.CREATEDATE BETWEEN TO_DATE(?, 'DD/MM/YYYY') and TO_DATE(?, 'DD/MM/YYYY') GROUP BY wmbarcode.MRNO,wmbarcode.ITEM,wmbarcode.PLANT,wmbarcode.PO,wmbarcode.INVOICEDATE,wmbarcode.INVOICE,wmbarcode.PUNAME";
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
                        arrjson.add(rec.getString("MAX"));
                        arrjson.add(rec.getString("PLANT"));
                        arrjson.add(rec.getString("PO"));
                        arrjson.add(rec.getString("INVOICEDATE").replace(" 00:00:00.0", ""));
                        //arrjson.add(rec.getString("CREATEDATE").replace(" 00:00:00.0", ""));
                        arrjson.add(rec.getString("INVOICE"));

                        // arrjson.add(rec.getString("DELIVERYNO"));
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
                    String mrno = request.getParameter("mrno").trim();
                    String item = request.getParameter("item").trim().toUpperCase();
                    String palet = request.getParameter("palet").trim();

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
                String mrno = request.getParameter("mrno").trim();
                String item = request.getParameter("item").toUpperCase().trim();
                String palet = request.getParameter("palet").trim();
                String date = request.getParameter("today").trim();
                String row = request.getParameter("totalrow").trim();
                String roll = request.getParameter("totallong").trim();

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
                    int n = 0;
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
                        arrlist.add(rec.getString("scolor"));
                        arrlist.add(rec.getString("weight"));
                        arrlist.add(rec.getString("qtylay"));
                        arrlist.add(rec.getString("byname"));
                        arrlist.add(rec.getString("mark_toterr"));

                        obj.put("data", arrlist);
                        n++;

                    }

                    out.print(obj);

                } catch (Exception e) {
                    e.printStackTrace();
                }


            } else if (status.equals("G12")) {
                try {
                    String mrno = request.getParameter("mrno");
                    String pallet = request.getParameter("pallet");

                    String sql = "select*  from wmbarcode inner join wmqck on wmbarcode.MRNO = wmqck.MRNO  and wmbarcode.ITEM = wmqck.ITEM and wmbarcode.ROLL = wmqck.ROLL and wmbarcode.PALET = wmqck.PALET  where wmbarcode.MRNO = ?  and wmbarcode.PALET= ?";

                    ps = conn.prepareStatement(sql);
                    ps.setString(1, mrno);
                    ps.setString(2, pallet);
                    rec = ps.executeQuery();

                    JSONObject obj = new JSONObject();
                    ArrayList arrlist = new ArrayList();
                    int n = 0;
                    int sumq = 0;
                    float suma = 0;
                    int countstar = 0;
                    float sumstar = 0;
                    float gradeqc = 0;
                    JSONArray arrroll = new JSONArray();
                    while ((rec.next()) && (rec != null)) {
                        arrroll.add(rec.getString("roll"));
                        JSONArray arrjson = new JSONArray();
                        arrjson.add(rec.getString("roll"));
                        arrjson.add(rec.getString("WIDTH"));
                        arrjson.add(rec.getString("QUANTITY"));
                        arrjson.add(rec.getString("ACTQTY"));
                        arrjson.add(rec.getString("ETHREAD"));
                        arrjson.add(rec.getString("EALKALI"));
                        arrjson.add(rec.getString("EDIRTY"));
                        arrjson.add(rec.getString("EOIL"));
                        arrjson.add(rec.getString("EBROKEN"));
                        arrjson.add(rec.getString("EKNOT"));
                        arrjson.add(rec.getString("EJOINT"));
                        arrjson.add(rec.getString("EFURROW"));
                        arrjson.add(rec.getString("TOTERR"));
                        arrjson.add(rec.getString("point")); // คะเเนน ถ้า con จำลองใส่ point เเต่ถ้าจริงใส่ "" เพราะยังไม่ได้สร้างฟิวpoint ใหม่ในดาต้าจริง 2/9/2565

                        arrjson.add(rec.getString("EREPEAT"));
                        arrjson.add(rec.getString("MARK_TOTERR"));

                        if (rec.getString("MARK_TOTERR") != null) {
                            countstar++;
                            sumstar += rec.getInt("ACTQTY");
                        }


                        obj.put("arrroll", arrroll);
                        obj.put("item", rec.getString("item"));
                        obj.put("desc1", rec.getString("desc1"));
                        arrlist.add(arrjson);
                        sumq += rec.getInt("QUANTITY");
                        suma += rec.getInt("ACTQTY");
                        n++;
                    }
                    obj.put("sumq", sumq);
                    obj.put("suma", suma);
                    obj.put("countstar", countstar);
                    obj.put("sumstar", sumstar);



                    gradeqc = (sumstar / suma) * 100;
//                    gradeqc = (171 / 4144);



                    obj.put("gradeqc", gradeqc);

                    obj.put("count", n);
                    obj.put("data", arrlist);
                    out.print(obj);

                } catch (Exception e) {
                    e.printStackTrace();
                }


            } else if (status.equals("G13")) {
                try {
                    String mrno = request.getParameter("mrno").trim();
                    String item = request.getParameter("item").toUpperCase().trim();
                    String roll = request.getParameter("roll").trim();

                    String sql = "select * from wmqck where wmqck.MRNO = ? and wmqck.ITEM = ? and wmqck.ROLL = ? ";

                    ps = conn.prepareStatement(sql);
                    ps.setString(1, mrno);
                    ps.setString(2, item);
                    ps.setString(3, roll);
                    rec = ps.executeQuery();

                    JSONObject obj = new JSONObject();

                    while ((rec.next()) && (rec != null)) {

                        obj.put("remark1", rec.getString("remark1"));
                        obj.put("remark2", rec.getString("remark2"));
                        obj.put("remark3", rec.getString("remark3"));

                    }

                    out.print(obj);

                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (status.equals("G14")) {
                try {
                    String mrno = request.getParameter("mrno");
                    String pallet = request.getParameter("pallet");

                    String sql = "select wmqck.REMARK1,wmqck.REMARK2,wmqck.REMARK3  from wmbarcode inner join wmqck on wmbarcode.MRNO = wmqck.MRNO  and wmbarcode.ITEM = wmqck.ITEM and wmbarcode.ROLL = wmqck.ROLL and wmbarcode.PALET = wmqck.PALET  where wmbarcode.MRNO = ?  and wmbarcode.PALET= ?";

                    ps = conn.prepareStatement(sql);
                    ps.setString(1, mrno);
                    ps.setString(2, pallet);
                    rec = ps.executeQuery();

                    JSONObject obj = new JSONObject();
                    ArrayList arrlist = new ArrayList();
                    int n = 0;
                    while ((rec.next()) && (rec != null)) {


                        obj.put("remark1", rec.getString("REMARK1"));
                        obj.put("remark2", rec.getString("REMARK2"));
                        obj.put("remark3", rec.getString("REMARK3"));

                        n++;
                    }


                    obj.put("count", n);

                    out.print(obj);

                } catch (Exception e) {
                    e.printStackTrace();
                }


            } else if (status.equals("G15")) {
                try {
                    String mrno = request.getParameter("mrno");
                    String pallet = request.getParameter("pallet");

                    String sql = "select wmqck.* from wmbarcode inner join wmqck on wmbarcode.MRNO = wmqck.MRNO  and wmbarcode.ITEM = wmqck.ITEM and wmbarcode.ROLL = wmqck.ROLL and wmbarcode.PALET = wmqck.PALET  where wmbarcode.MRNO = ?  and wmbarcode.PALET= ?";

                    ps = conn.prepareStatement(sql);
                    ps.setString(1, mrno);
                    ps.setString(2, pallet);
                    rec = ps.executeQuery();

                    JSONObject obj = new JSONObject();
                    ArrayList arrlist = new ArrayList();
                    int n = 0;
                    while ((rec.next()) && (rec != null)) {
                        JSONArray arrjson = new JSONArray();
                        arrjson.add(rec.getString("roll"));
                        arrjson.add(rec.getString("item"));
                        arrjson.add(rec.getString("palet"));
                        arrjson.add(rec.getString("actqty"));
                        arrjson.add(rec.getString("gradeqc"));
                        arrjson.add(rec.getString("byname"));
                        arrjson.add(rec.getString("remark1"));
                        arrjson.add(rec.getString("remark2"));
                        arrjson.add(rec.getString("remark3"));
                        arrjson.add(rec.getString("toterr"));
                        arrjson.add(rec.getString("mark_toterr"));


                        arrlist.add(arrjson);
                        n++;
                    }


                    obj.put("count", n);
                    obj.put("data", arrlist);
                    out.print(obj);

                } catch (Exception e) {
                    e.printStackTrace();
                }


            } else if (status.equals("G16")) {
                try {

                    String mrno = request.getParameter("mrno");
                    String pallet = request.getParameter("pallet");

                    String sql = "select * from wmbarcode inner join wmqck on wmbarcode.MRNO = wmqck.MRNO  and wmbarcode.ITEM = wmqck.ITEM and wmbarcode.ROLL = wmqck.ROLL and wmbarcode.PALET = wmqck.PALET  where wmbarcode.MRNO = ?  and wmbarcode.PALET= ?";
                    // conn = DB.ConnDB.getConnection();
                    ps = conn.prepareStatement(sql);
                    ps.setString(1, mrno);
                    ps.setString(2, pallet);
                    rec = ps.executeQuery();
                    int sumqt = 0;
                    int sumaqt = 0;
                    int sumweight = 0;
                    JSONObject obj = new JSONObject();
                    ArrayList arrlist = new ArrayList();
                    int n = 0;
                    while ((rec.next()) && (rec != null)) {
                        JSONArray arrjson = new JSONArray();
                        arrjson.add(rec.getString("roll"));
                        arrjson.add(rec.getString("width"));
                        arrjson.add(rec.getString("color"));
                        arrjson.add(rec.getString("scolor"));//rec.getString("scolor")

                        arrjson.add(rec.getString("quantity"));
                        arrjson.add(rec.getString("actqty"));
                        arrjson.add(rec.getString("ethread"));
                        arrjson.add(rec.getString("ealkali"));
                        arrjson.add(rec.getString("edirty"));
                        arrjson.add(rec.getString("eoil"));
                        arrjson.add(rec.getString("ebroken"));
                        arrjson.add(rec.getString("eknot"));
                        arrjson.add(rec.getString("ejoint"));
                        arrjson.add(rec.getString("efurrow"));
                        arrjson.add(rec.getString("erepeat"));
                        arrjson.add(rec.getString("batch"));
                        arrjson.add(rec.getString("toterr"));
                        arrjson.add(rec.getString("point"));//rec.getString("point")

                        String toterr = rec.getString("toterr");
                        if (toterr == null) {
                            toterr = "0";
                        }
                        String mark = "";
                        if (Integer.valueOf(toterr) > 8) {
                            mark = "*";
                        } else {
                            mark = "";
                        }
                        String wm = rec.getString("WEIGHT");
                        if (wm == null) {
                            wm = "0";
                        }
                        sumqt += Integer.valueOf(rec.getString("quantity"));
                        sumaqt += Integer.valueOf(rec.getString("actqty"));
                        sumweight += Integer.valueOf(wm);

                        arrjson.add(mark);
                        arrjson.add("");
                        arrlist.add(arrjson);


                        obj.put("PLANT", rec.getString("PLANT"));
                        obj.put("ITEM", rec.getString("ITEM"));
                        obj.put("PO", rec.getString("PO"));
                        obj.put("DESC1", rec.getString("DESC1"));
                        obj.put("DESC2", rec.getString("DESC2"));
                        obj.put("DESC3", rec.getString("DESC3"));
                        obj.put("INVOICEDATE", rec.getString("INVOICEDATE"));
                        obj.put("MRNO", rec.getString("MRNO"));
                        obj.put("UNIT", rec.getString("UNIT"));
                        obj.put("QCDATE", rec.getString("QCDATE"));
                        obj.put("REMARKRM1", rec.getString("REMARK1"));
                        obj.put("REMARKRM2", rec.getString("REMARK2"));
                        obj.put("REMARKRM3", rec.getString("REMARK3"));
                        obj.put("SUPNAME", rec.getString("SUPNAME"));
                        obj.put("INVOICE", rec.getString("INVOICE"));
                        obj.put("PALET", rec.getString("PALET"));



                        n++;
                    }

                    obj.put("sumweight", sumweight);
                    obj.put("sumqt", sumqt);
                    obj.put("sumaqt", sumaqt);
                    obj.put("count", n);
                    obj.put("data", arrlist);
                    out.print(obj);


                //getServletContext().getRequestDispatcher("/displayprint1.jsp").forward(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (status.equals("G17")) {
                try {
                    String mrno = request.getParameter("mrno").trim();
                    String pallet = request.getParameter("pallet").trim();

                    String sql = "select wmbarcode.RESULTQC,wmqck.BYNAME1  from wmbarcode inner join wmqck on wmbarcode.MRNO = wmqck.MRNO  and wmbarcode.ITEM = wmqck.ITEM and wmbarcode.ROLL = wmqck.ROLL and wmbarcode.PALET = wmqck.PALET  where wmbarcode.MRNO = ?  and wmbarcode.PALET= ?";

                    ps = conn.prepareStatement(sql);
                    ps.setString(1, mrno);
                    ps.setString(2, pallet);
                    rec = ps.executeQuery();

                    JSONObject obj = new JSONObject();
                    ArrayList arrlist = new ArrayList();
                    int n = 0;
                    while ((rec.next()) && (rec != null)) {

                        obj.put("RESULTQC", rec.getString("RESULTQC"));
                        obj.put("BYNAME1", rec.getString("BYNAME1"));

                        n++;

                    }

                    out.print(obj);

                } catch (Exception e) {
                    e.printStackTrace();
                }


            } else if (status.equals("G18")) {
                try {
                    String mrno = request.getParameter("mrno").trim();
                    String item = request.getParameter("item").trim().toUpperCase();

                    String sql = "select * from wmbarcode where wmbarcode.MRNO = ? and wmbarcode.ITEM = ?";

                    ps = conn.prepareStatement(sql);
                    ps.setString(1, mrno);
                    ps.setString(2, item);
                    rec = ps.executeQuery();

                    JSONObject obj = new JSONObject();
                    ArrayList arrlist = new ArrayList();
                    int n = 0;
                    String palet = null;
                    while ((rec.next()) && (rec != null)) {
                        if (!rec.getString("PALET").equals(palet)) {
                            arrlist.add(rec.getString("PALET"));
                        }
                        palet = rec.getString("PALET");
                        n++;
                    }
                    obj.put("palet", arrlist);
                    if (n > 0) {
                        obj.put("status", "true");
                    } else {
                        obj.put("status", "false");
                    }
                    out.print(obj);

                } catch (Exception e) {
                    e.printStackTrace();
                }


            } else if (status.equals("G19")) {
                try {
                    String mrno = request.getParameter("mrno").trim();


                    String sql = "select * from wmbarcode where wmbarcode.MRNO = ?";

                    ps = conn.prepareStatement(sql);
                    ps.setString(1, mrno);
                    rec = ps.executeQuery();

                    JSONObject obj = new JSONObject();
                    ArrayList arrlist = new ArrayList();
                    int n = 0;
                    String palet = null;
                    while ((rec.next()) && (rec != null)) {
                        if (!rec.getString("PALET").equals(palet)) {
                            arrlist.add(rec.getString("PALET"));
                        }
                        palet = rec.getString("PALET");
                        n++;
                    }
                    if (n > 0) {
                        obj.put("status", "true");
                    } else {
                        obj.put("status", "false");
                    }
                    obj.put("palet", arrlist);

                    out.print(obj);

                } catch (Exception e) {
                    e.printStackTrace();
                }


            } else if (status.equals("G20")) {
                try {

                    String mrno = request.getParameter("mrno");
                    String pallet = request.getParameter("pallet");

                    String sql = "select * from wmbarcode inner join wmqck on wmbarcode.MRNO = wmqck.MRNO  and wmbarcode.ITEM = wmqck.ITEM and wmbarcode.ROLL = wmqck.ROLL and wmbarcode.PALET = wmqck.PALET  where wmbarcode.MRNO = ?  and wmbarcode.PALET= ?";
                    // conn = DB.ConnDB.getConnection();
                    ps = conn.prepareStatement(sql);
                    ps.setString(1, mrno);
                    ps.setString(2, pallet);
                    rec = ps.executeQuery();
                    int sumqt = 0;
                    int sumaqt = 0;
                    int sumweight = 0;
                    JSONObject obj = new JSONObject();
                    ArrayList arrlist = new ArrayList();
                    int n = 0;
                    String PLANT = null;
                    String ITEM = null;
                    String PO = null;
                    String DESC1 = null;
                    String DESC2 = null;
                    String DESC3 = null;
                    String INVOICEDATE = null;
                    String MRNO = null;
                    String UNIT = null;
                    String QCDATE = null;
                    String REMARK1 = null;
                    String REMARK2 = null;
                    String REMARK3 = null;
                    String SUPNAME = null;
                    String INVOICE = null;
                    String PALET = null;
                    String BYNAME = null;
                    while ((rec.next()) && (rec != null)) {
                        JSONArray arrjson = new JSONArray();
                        arrjson.add(rec.getString("roll"));
                        arrjson.add(rec.getString("width"));
                        arrjson.add(rec.getString("color"));
                        arrjson.add(rec.getString("scolor"));//rec.getString("scolor")

                        arrjson.add(rec.getString("quantity"));
                        arrjson.add(rec.getString("actqty"));
                        arrjson.add(rec.getString("ethread"));
                        arrjson.add(rec.getString("ealkali"));
                        arrjson.add(rec.getString("edirty"));
                        arrjson.add(rec.getString("eoil"));
                        arrjson.add(rec.getString("ebroken"));
                        arrjson.add(rec.getString("eknot"));
                        arrjson.add(rec.getString("ejoint"));
                        arrjson.add(rec.getString("efurrow"));
                        arrjson.add(rec.getString("erepeat"));
                        arrjson.add(rec.getString("batch"));
                        arrjson.add(rec.getString("toterr"));
                        arrjson.add(rec.getString("point"));//rec.getString("point")

                        String toterr = rec.getString("toterr");
                        if (toterr == null) {
                            toterr = "0";
                        }
                        String mark = "";
                        if (Integer.valueOf(toterr) > 8) {
                            mark = "*";
                        } else {
                            mark = "";
                        }
                        String wm = rec.getString("WEIGHT");
                        if (wm == null) {
                            wm = "0";
                        }
                        sumqt += Integer.valueOf(rec.getString("quantity"));
                        sumaqt += Integer.valueOf(rec.getString("actqty"));
                        sumweight += Integer.valueOf(wm);

                        arrjson.add(mark);
                        arrjson.add("");
                        arrlist.add(arrjson);

                        if (n == 0) {
                            PLANT = rec.getString("PLANT");
                            ITEM = rec.getString("ITEM");
                            PO = rec.getString("PO");
                            DESC1 = rec.getString("DESC1");
                            DESC2 = rec.getString("DESC2");
                            DESC3 = rec.getString("DESC3");
                            INVOICEDATE = rec.getString("INVOICEDATE");
                            MRNO = rec.getString("MRNO");
                            UNIT = rec.getString("UNIT");
                            QCDATE = rec.getString("QCDATE");
                            REMARK1 = rec.getString("REMARK1");
                            REMARK2 = rec.getString("REMARK2");
                            REMARK3 = rec.getString("REMARK3");
                            SUPNAME = rec.getString("SUPNAME");
                            INVOICE = rec.getString("INVOICE");
                            PALET = rec.getString("PALET");
                            BYNAME = rec.getString("BYNAME");
                        }


                        n++;
                    }

                    obj.put("PLANT", PLANT);
                    obj.put("ITEM", ITEM);
                    obj.put("PO", PO);
                    obj.put("DESC1", DESC1);
                    obj.put("DESC2", DESC2);
                    obj.put("DESC3", DESC3);
                    obj.put("INVOICEDATE", INVOICEDATE);
                    obj.put("MRNO", MRNO);
                    obj.put("UNIT", UNIT);
                    obj.put("QCDATE", QCDATE);
                    obj.put("REMARKRM1", REMARK1);
                    obj.put("REMARKRM2", REMARK2);
                    obj.put("REMARKRM3", REMARK3);
                    obj.put("SUPNAME", SUPNAME);
                    obj.put("INVOICE", INVOICE);
                    obj.put("PALET", PALET);
                    obj.put("BYNAME", BYNAME);


                    obj.put("sumweight", sumweight);
                    obj.put("sumqt", sumqt);
                    obj.put("sumaqt", sumaqt);
                    obj.put("count", n);
                    obj.put("data", arrlist);
                    out.print(obj);


                //getServletContext().getRequestDispatcher("/displayprint1.jsp").forward(request, response);
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
