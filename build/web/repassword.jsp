<%-- 
    Document   : index
    Created on : 29 ก.ค. 2565, 19:47:54
    Author     : Gus
--%>
<%@page import="java.util.*"%>
<%@page import="java.text.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <%@include file="share/head.jsp"%> 
    </head>
    <body>
        <%
            Object error = (Object) request.getAttribute("status");
            if (error == "error") {
        %>
        <script>
            Swal.fire({
                icon: 'error',
                title: 'ไม่สำเร็จ',
                text: 'เข้าสู่ระบบไม่สำเร็จ'
            })
        </script>
        <%            }

        %>
        <form action="" method="post" class="" novalidate>
            <div class="container mt-5">
                <div class="text-center h3 mb-3">RM / QC RM</div>
                <div class="card shadow-lg col-sm-12 col-md-5 mx-auto ">
                    <div class="card-header">
                        Forgot password
                    </div>
                    <div class="card-body ">
                        <label>USERID : </label>
                        <input class="form-control form-control-sm " type="number" name="userid" id="userid" required> 
                        <div class="invalid-feedback mb-3 text-center">
                            กรุณาใส่ข้อมูลให้ถูกต้อง
                        </div>
                        <label>NEW PASSWORD : </label>
                        <input class="form-control form-control-sm " type="password" name="newpassword" id="newpassword" required> 
                        <div class="invalid-feedback mb-3 text-center">
                            กรุณาใส่ข้อมูลให้ถูกต้อง
                        </div>
                        <br>
                        <div class="text-center">
                            <button type="button" class="btn btn-sm btn-success " id="btn-send" name="btn-send"><i class="bi bi-box-arrow-in-right"></i> OK</button>
                            <a href="index.jsp"> <button class="btn btn-sm btn-primary" type="button" id="back" name="back"><i class="bi bi-backspace"></i> Back</button></a>
                        </div>
                    </div>
                </div>
            </div>
            
        </form>
        
        <script>
            $(document).ready(function(){
                $("#btn-send").click(function (){
                    var userid = $("#userid").val();
                    var newpassword = $("#newpassword").val();
                    
                    $.ajax({
                        type:"POST",
                        url:"user?status1=RE1&userid="+userid+"&password="+newpassword,
                        success:function(msg,status){
                            if(msg == "true"){
                                Swal.fire({
                                    icon: 'success',
                                    title: 'บันทึดสำเร็จ',
                                    text: 'บันทึกสำเร็จ'
                                });
                            }else if(msg == "false"){
                                Swal.fire({
                                    icon: 'error',
                                    title: 'ไม่สำเร็จ',
                                    text: 'บันทึกข้อมูลไม่สำเร็จ'
                                });
                            }
                            
                        }
                    });
                });
            });
        </script>
        
        <%@ include file="share/footer.jsp" %>
    </body>
</html>
