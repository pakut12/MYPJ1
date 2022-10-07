/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SV;

import java.io.*;
import java.math.BigInteger;
import java.net.*;
import java.security.MessageDigest;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author pakutsing
 */
public class SVuser extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();
        try {
            Connection con = null;
            ResultSet rec = null;
            PreparedStatement ps = null;
            con = DB.ConnDB.getConnection();
            String status1 = request.getParameter("status1");
            try {
                if (status1.equals("S1")) {

                    try {
                        request.setCharacterEncoding("UTF-8");
                        String userid = request.getParameter("userid");
                        String password = request.getParameter("password");
                        String firstname = request.getParameter("firstname");
                        String lastname = request.getParameter("lastname");
                        String status = request.getParameter("status");
                        String statusqi = request.getParameter("statusqi");



                        String sql = "INSERT INTO wmuser (userid, password, firstname, lastname, status, statusqi) VALUES (?, ?, ?,?, ?, ?)";

                        ps = con.prepareStatement(sql);
                        ps.setString(1, userid);
                        ps.setString(2, password);
                        ps.setString(3, firstname);
                        ps.setString(4, lastname);
                        ps.setString(5, status);
                        ps.setString(6, statusqi);


                        if (ps.executeUpdate() > 0) {
                            out.print("true");
                        } else {
                            out.print("false");
                        }


                    } catch (Exception e) {
                        e.printStackTrace();
                        out.print("false");
                    } finally {
                        try {
                            rec.close();
                            ps.close();
                            DB.ConnDB.closeConnection(con);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }


                } else if (status1.equals("G1")) {
                    String userid = request.getParameter("userid");
                    String sql = "select * from pgusertab inner join v_pwemployee on pgusertab.USERID = v_pwemployee.PWEMPLOYEE where pgusertab.USERID = ? ";
                    con = DB.ConnDB.getConnection();
                    ps = con.prepareStatement(sql);
                    ps.setString(1, userid);

                    rec = ps.executeQuery();

                    JSONObject obj = new JSONObject();
                    ArrayList arrlist = new ArrayList();

                    while ((rec.next()) && (rec != null)) {

                        obj.put("password", rec.getString("passwd"));
                        obj.put("pwfname", rec.getString("pwfname"));
                        obj.put("pwlname", rec.getString("pwlname"));

                    }
                    if (ps.executeUpdate() > 0) {
                        obj.put("status", "true");
                    } else {
                        obj.put("status", "false");
                    }
                    rec.close();
                    ps.close();
                    DB.ConnDB.closeConnection(con);
                    out.print(obj);
                } else if (status1.equals("G2")) {
                    String userid = request.getParameter("userid");
                    String sql = "SELECT * FROM wmuser";

                    ps = con.prepareStatement(sql);

                    rec = ps.executeQuery();

                    JSONObject obj = new JSONObject();
                    ArrayList arrlist = new ArrayList();

                    while ((rec.next()) && (rec != null)) {
                        JSONArray arrjson = new JSONArray();
                        String status = rec.getString("status");
                        String statusqi = rec.getString("statusqi");

                        if (status.equals("01")) {
                            status = "Admin";
                        } else if (status.equals("02")) {
                            status = "RM";
                        } else if (status.equals("03")) {
                            status = "QC RM";
                        } else if (status.equals("04")) {
                            status = "CUT";
                        }

                        if (statusqi.equals("Y")) {
                            statusqi = "มีสิทธิ์";
                        } else if (statusqi.equals("N")) {
                            statusqi = "ไม่มีสิทธิ์";
                        }

                        arrjson.add(rec.getString("userid"));
                        arrjson.add(rec.getString("password"));
                        arrjson.add(rec.getString("firstname"));
                        arrjson.add(rec.getString("lastname"));
                        arrjson.add(status);
                        arrjson.add(statusqi);
                        arrjson.add("<a href='user?status1=E1&userid=" + rec.getString("userid") + "'><button class='btn btn-warning btn-sm' type='button'>เเก้ไข</button></a>");
                        arrjson.add("<a href='user?status1=D2&userid=+" + rec.getString("userid") + "'><button class='btn btn-danger btn-sm' type='button'>ลบ</button></a>");
                        arrlist.add(arrjson);


                    }
                    obj.put("data", arrlist);
                    rec.close();
                    ps.close();
                    DB.ConnDB.closeConnection(con);
                    out.print(obj);
                } else if (status1.equals("S2")) {
                    try {
                        String userid = request.getParameter("userid");
                        String password = request.getParameter("password");
                        String firstname = request.getParameter("firstname");
                        String lastname = request.getParameter("lastname");
                        String status = request.getParameter("status");
                        String statusqi = request.getParameter("statusqi");
                        MessageDigest md;
                        md = MessageDigest.getInstance("MD5");
                        md.reset();
                        md.update(password.getBytes());
                        String digestpass = new BigInteger(1, md.digest()).toString(16).toUpperCase();

                        String sql = "INSERT INTO wmuser (userid, password, firstname, lastname, status, statusqi) VALUES (?, ?, ?,?, ?, ?)";

                        ps = con.prepareStatement(sql);
                        ps.setString(1, userid);
                        ps.setString(2, digestpass);
                        ps.setString(3, firstname);
                        ps.setString(4, lastname);
                        ps.setString(5, status);
                        ps.setString(6, statusqi);

                        if (ps.executeUpdate() > 0) {
                            out.print("true");
                        } else {
                            out.print("false");
                        }
                        rec.close();
                        ps.close();
                        DB.ConnDB.closeConnection(con);
                    } catch (Exception e) {
                        out.print("false");
                    }


                } else if (status1.equals("D2")) {
                    try {
                        String userid = request.getParameter("userid").trim();


                        String sql = "DELETE FROM wmuser WHERE wmuser.userid = ?";

                        ps = con.prepareStatement(sql);
                        ps.setString(1, userid);

                        if (ps.executeUpdate() > 0) {
                            out.print("true");
                        } else {
                            out.print("false");
                        }
                        rec.close();
                        ps.close();
                        DB.ConnDB.closeConnection(con);
                        out.print("<script langquage='javascript'>window.location='displayuser.jsp';</script>");




                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } else if (status1.equals("E1")) {
                    try {
                        String userid = request.getParameter("userid").trim();


                        String sql = "SELECT * FROM wmuser where wmuser.userid = ?";

                        ps = con.prepareStatement(sql);
                        ps.setString(1, userid);

                        rec = ps.executeQuery();
                        String url = "/displayedituser.jsp";
                        while ((rec.next()) && (rec != null)) {

                            request.setAttribute("userid", rec.getString("userid"));
                            request.setAttribute("password", rec.getString("password"));
                            request.setAttribute("firstname", rec.getString("firstname"));
                            request.setAttribute("lastname", rec.getString("lastname"));
                            request.setAttribute("status", rec.getString("status"));
                            request.setAttribute("statusqi", rec.getString("statusqi"));

                        }
                        rec.close();
                        ps.close();
                        DB.ConnDB.closeConnection(con);
                        getServletContext().getRequestDispatcher(url).forward(request, response);



                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } else if (status1.equals("U1")) {
                    try {
                        String sql = null;
                        String userid = (String) request.getParameter("userid");
                        String password = (String) request.getParameter("password");
                        String firstname = (String) request.getParameter("firstname");
                        String lastname = (String) request.getParameter("lastname");
                        String status = (String) request.getParameter("status");
                        String statusqi = (String) request.getParameter("statusqi");

                        sql = "UPDATE wmuser SET wmuser.password = ? , wmuser.firstname=?,wmuser.lastname=?,wmuser.status=?,wmuser.statusqi=? WHERE wmuser.userid = ?";
                        ps = con.prepareStatement(sql);
                        ps.setString(1, password);
                        ps.setString(2, firstname);
                        ps.setString(3, lastname);
                        ps.setString(4, status);
                        ps.setString(5, statusqi);
                        ps.setString(6, userid);


                        if (ps.executeUpdate() > 0) {
                            out.print("true");
                        } else {
                            out.print("false");
                        }
                        rec.close();
                        ps.close();
                        DB.ConnDB.closeConnection(con);

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } else if (status1.equals("G3")) {
                    try {
                        String sql = "SELECT * FROM wmuser WHERE wmuser.statusqi = 'Y'";
                        ps = con.prepareStatement(sql);
                        rec = ps.executeQuery();
                        JSONObject obj = new JSONObject();
                        ArrayList arrlist = new ArrayList();
                        ArrayList arrlist1 = new ArrayList();
                        while ((rec.next()) && (rec != null)) {
                            arrlist.add(rec.getString("firstname"));
                            arrlist1.add(rec.getString("firstname") + " " + rec.getString("lastname"));

                        }
                        obj.put("key", arrlist1);
                        obj.put("value", arrlist);
                        out.print(obj);

                        rec.close();
                        ps.close();
                        DB.ConnDB.closeConnection(con);

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } else if (status1.equals("RE1")) {
                    try {
                        String userid = (String) request.getParameter("userid");
                        String password = (String) request.getParameter("password");
                        MessageDigest md;
                        md = MessageDigest.getInstance("MD5");
                        md.reset();
                        md.update(password.getBytes());
                        String digestpass = new BigInteger(1, md.digest()).toString(16).toUpperCase();

                        String sql = "UPDATE wmuser SET wmuser.password = ? WHERE wmuser.userid = ?";
                        ps = con.prepareStatement(sql);
                        ps.setString(1, digestpass);
                        ps.setString(2, userid);

                        if (ps.executeUpdate() > 0) {
                            out.print("true");
                        } else {
                            out.print("false");
                        }

                        rec.close();
                        ps.close();
                        DB.ConnDB.closeConnection(con);

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SVuser.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SVuser.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SVuser.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SVuser.class.getName()).log(Level.SEVERE, null, ex);
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
