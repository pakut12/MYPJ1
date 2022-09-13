<%-- 
    Document   : index
    Created on : 5 ก.ย. 2565, 19:05:01
    Author     : Gus
--%>
<%@page import="java.sql.Connection" %>
<%@page import="java.util.Map" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.io.*" %>
<%@page import="net.sf.jasperreports.engine.JasperRunManager" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Hello World!</h2>
        <%
            try {
                Connection connect = null;
                // Create Connection
                connect = DB.ConnDB.getConnection();
                Map param = new HashMap();
                //param.put("iduser","35");
                ServletContext context = getServletContext();
                File reportFile = new File(context.getRealPath("report/report1.jasper"));
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), null, connect);
                response.setCharacterEncoding("UTF-8");
                response.setContentType("application/Pdf");
                response.setContentLength(bytes.length);
                ServletOutputStream output = response.getOutputStream();
                output.write(bytes, 0, bytes.length);
                output.flush();
                output.close();

            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
