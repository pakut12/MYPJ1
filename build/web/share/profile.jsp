<%-- 
    Document   : profile
    Created on : 15 ส.ค. 2565, 14:24:33
    Author     : pakutsing
--%>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-sm-12 col-md-3"> 
    <div class="card shadow ">
        <div class="card-header">
            โปรไฟล์
        </div>
        <div class="card-body text-center">
            <%
            String pattern = "dd/MM/yyyy";
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
            String date = simpleDateFormat.format(new Date());
            %>
            <p>User : <%= session.getAttribute("user")%></p>
            <p>Date : <%=date%></p>
        </div>
    </div>
</div>
