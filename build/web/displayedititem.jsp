<%-- 
    Document   : displayedititem
    Created on : 24 ส.ค. 2565, 13:23:17
    Author     : pakutsing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String txt1 = request.getParameter("roll");
            String txt2 = request.getParameter("mrno");
            String txt3 = request.getParameter("item");

            out.print(txt1);
            out.print("<br>");
            out.print(txt2);
            out.print("<br>");
            out.print(txt3);
        %>
        <h2>Hello World!</h2>
    </body>
</html>
