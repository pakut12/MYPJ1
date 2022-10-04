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
        <%
        String userid = (String) request.getAttribute("userid");
            String password = (String) request.getAttribute("password");
            String firstname = (String) request.getAttribute("firstname");
            String lastname = (String) request.getAttribute("lastname");
            String status = (String) request.getAttribute("status");
            String statusqi = (String) request.getAttribute("statusqi");

            String msgstatus = null;
            String msgstatusqi = null;

            if (userid.equals("")) {
                userid = "";
            } else if (password.equals("")) {
                password = "";
            } else if (firstname.equals("")) {
                firstname = "";
            } else if (lastname.equals("")) {
                lastname = "";
            } else if (status.equals("")) {
                status = "";
            } else if (statusqi.equals("")) {
                statusqi = "";
            }

            if (status.equals("01")) {
                msgstatus = "Admin";
            } else if (status.equals("02")) {
                msgstatus = "RM";
            } else if (status.equals("03")) {
                msgstatus = "QC RM";
            }else if (status.equals("04")) {
                msgstatus = "CUT";
            }

            if (statusqi.equals("Y")) {
                msgstatusqi = "Y";
            } else if (statusqi.equals("N")) {
                msgstatusqi = "N";
            }

        %>
        <div class="container">
            <div class="row">
                
                <div class="col-sm-12 col-md-12">
                    <div id="pageview">
                        <div class="card shadowt  ">
                            <div class="card-header">
                                ระบบจัดการสมาชิก
                            </div>
                            <div class="card-body">
                                <div class="row ">
                                    <div class="col-sm-12 col-md-6 mx-auto">
                                        <div class="card mb-3">
                                            <div class="card-header">
                                                เเก้ไขสมาชิก
                                            </div>
                                            <div class="card-body">
                                                <form class="" id="myform">
                                                    
                                                    
                                                    <label>Userid : </label>
                                                    <input class="form-control form-control-sm" type="number" id="userid" value="<%=userid%>" readonly ></input>
                                                    <label>Password : </label>
                                                    <input class="form-control form-control-sm" type="password" id="password" value="<%=password%>" ></input>
                                                    <label>Firstname : </label>
                                                    <input class="form-control form-control-sm" type="text" id="firstname" value="<%=firstname%>" required></input>
                                                    <label>Lastname : </label>
                                                    <input class="form-control form-control-sm" type="text" id="lastname" value="<%=lastname%>" required></input>
                                                    <label>Status : </label>
                                                    <select class="form-select form-select-sm" id="status" required>
                                                        <option value="<%=status%>" ><%=msgstatus%></option>
                                                        <option value="01">Admin</option>
                                                        <option value="02">RM</option>
                                                        <option value="03">QC RM</option>
                                                        <option value="04">CUT</option>
                                                    </select>
                                                    <label>Approve  : </label>
                                                    <select class="form-select form-select-sm" id="statusqi" required>
                                                        <option value="<%=msgstatusqi%>" ><%if (msgstatusqi.equals("Y")) {
                out.print("มีสิทธิ์");
            } else {
                out.print("ไม่มีสิทธิ์");
            }%></option>
                                                        <option value="Y">มีสิทธิ์</option>
                                                        <option value="N">ไม่มีสิทธิ์</option>
                                                    </select>
                                                    <div class="row mt-3">
                                                        
                                                        <div class="col-sm-12 col-md-12">
                                                            <button class="btn btn-success btn-sm  w-100" type="button" id="btn-save" name="btn-save"><i class="bi bi-hdd"></i> บันทึก</button>
                                                            
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        <script>
            
            $(document).ready(function () {
                     
                $("#page5").addClass("active"); 
                
                
                $("#btn-save").click(function(){
                    $("#myform").addClass("was-validated");
                    var userid = $("#userid").val();
                    var password = $("#password").val();
                    var firstname = $("#firstname").val();
                    var lastname = $("#lastname").val();
                    var status = $("#status").val();
                    var statusqi = $("#statusqi").val();
                    if(status == "" || statusqi == ""){
                        Swal.fire({
                            icon: 'error',
                            title: 'กรุณากรอกข้อมูลให้ถูกต้อง',
                            text: 'กรุณากรอกข้อมูลให้ถูกต้อง'
                        })
                        
                    }else {
               
                        var url = "user?status1=U1"
                        var data = "&userid="+userid+"&password="+password+"&firstname="+firstname+"&lastname="+lastname+"&status="+status+"&statusqi="+statusqi
                        $.ajax({
                            type:"POST",
                            url:url,
                            data:data,
                            success:function(msg,status){
                                if(msg == 'true'){
                                    Swal.fire({
                                        icon: 'success',
                                        title: 'บันทึกข้อมูลสำเร็จ',
                                        text: 'บันทึกข้อมูลสำเร็จ'
                                    });
                                    setInterval(function () {window.location="displayuser.jsp";}, 1000);
                                  
                                }else if(msg == 'false'){
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'บันทึกข้อมูลไม่สำเร็จ',
                                        text: 'บันทึกข้อมูลไม่สำเร็จ'
                                    })
                                }
                            }
                        });
                         
                         
                    }
                   
                });
               
            });

        </script>
        <%@ include file="share/footer.jsp" %>
        
    </body>
</html>
