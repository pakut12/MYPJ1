<%-- 
    Document   : home
    Created on : 30 ก.ค. 2565, 9:05:56
    Author     : Gus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <%@include file="share/head.jsp"%> 
    </head>
    <body>
        
        
        <%@include file="share/nav.jsp" %>
        
        <div class="container">
            <div class="row">
                
                <div class="col-sm-12 col-md-12">
                    <div id="pageview">
                        <div class="card shadowt text-center ">
                            <div class="card-header">
                                Home
                            </div>
                            <div class="card-body">
                                Welcome <% out.print(request.getSession().getAttribute("user"));%>
                                <br> <br>
                               [ คู่มือระบบ RM / QC RM <a href="manual.pdf" target="_blank">Click</a>]
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        <script>
            $(document).ready(function () {
                $("#page1").addClass("active");
            });

        </script>
        <%@ include file="share/footer.jsp" %>
        
    </body>
</html>
