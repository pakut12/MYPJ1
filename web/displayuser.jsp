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
                        <div class="card shadowt  ">
                            <div class="card-header">
                                ระบบจัดการสมาชิก
                            </div>
                            <div class="card-body">
                                <div class="row ">
                                    <div class="col-sm-12 col-md-6 mx-auto">
                                        <div class="card mb-3">
                                            <div class="card-header">
                                                เพิ่มสมาชิก
                                            </div>
                                            <div class="card-body">
                                                <form class="" id="myform" action="user?status1=S1" method="post" >
                                                    
                                                    <label>Userid : </label>
                                                    <input class="form-control form-control-sm" type="number" id="userid" name="userid" required ></input>
                                                    <label>Password : </label>
                                                    <input class="form-control form-control-sm" type="password" id="password" name="password" required></input>
                                                    <label>Firstname : </label>
                                                    <input class="form-control form-control-sm" type="text" id="firstname" name="firstname" required></input>
                                                    <label>Lastname : </label>
                                                    <input class="form-control form-control-sm" type="text" id="lastname" name="lastname" required></input>
                                                    <label>Status : </label>
                                                    <select class="form-select form-select-sm" id="status" name="status" required>
                                                        <option value="">โปรดเลือก....</option>
                                                        <option value="01">Admin</option>
                                                        <option value="02">RM</option>
                                                        <option value="03">QC RM</option>
                                                        <option value="04">PT</option>
                                                    </select>
                                                    <label>Approve : </label>
                                                    <select class="form-select form-select-sm" id="statusqi" name="statusqi" required>
                                                        <option value="" >โปรดเลือก....</option>
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
                                
                                <div class="card">
                                    <div class="card-header">
                                        เเสดงรายชื่อสมาชิก
                                    </div>
                                    <div class="card-body">
                                        <table class="table table-bordered text-center" id="mytable">
                                            <thead>
                                                <tr>
                                                    <th>Userid</th>
                                                    <th>Password</th>
                                                    <th>Firstname</th>
                                                    <th>Lastname</th>
                                                    <th>Status</th>
                                                    <th>Approve</th>
                                                    <th>เเก้ไข</th>
                                                    <th>ลบ</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        <script>
            var table;
            function getdata(){
                table =  $("#mytable").DataTable({
                    ajax:"user?status1=G2",
                    bDestroy: true
                   
                });
            }  
            $(document).ready(function () {
                      
                getdata();
            
                $("#page5").addClass("active"); 
               
                $("#btn-getdata").click(function(){
                    var userid = $("#userid").val();
                    var url = "user?status1=G1&userid="+ userid ;
                    
                    $.ajax({
                        type:"POST",
                        url:url,
                        success:function(msg,status){
                            if( $("#userid").val() != ""){
                                $("#btn-save").removeClass("disabled");
                            }
                            
                            var de = $.parseJSON(msg);
                            if(de.status == "false"){
                                $("#password").val("");
                                $("#firstname").val(""); 
                                $("#lastname").val("");
                                $("#password").attr("readonly",false);
                                $("#firstname").attr("readonly",false);
                                $("#lastname").attr("readonly",false);
                                $("#data").text("ไม่มีข้อมูล");
                                Swal.fire({
                                    icon: 'error',
                                    title: 'ไม่พบข้อมูล',
                                    text: 'ไม่พบข้อมูล'
                                })
                            }else{
                                Swal.fire({
                                    icon: 'success',
                                    title: 'ดึงข้อมูลสำเร็จ',
                                    text: 'ดึงข้อมูลสำเร็จ'
                                })
                                $("#password").attr("readonly",true);
                                $("#firstname").attr("readonly",true);
                                $("#lastname").attr("readonly",true);
                                $("#password").val(de.password);
                                $("#firstname").val(de.pwfname); 
                                $("#lastname").val(de.pwlname);
                                $("#data").text("มีข้อมูล");
                            }
                            
                        }
                    });
                    
                });
        
                $("#btn-save").click(function(){
                    $("#myform").addClass("was-validated");
                    var userid = $("#userid").val();
                    var password = $("#password").val();
                    var firstname = $("#firstname").val();
                    var lastname = $("#lastname").val();
                    var status = $("#status").val();
                    var statusqi = $("#statusqi").val();
                    var form = $("#myform").serialize();
                   
                    if(status == "" || statusqi == ""){
                        Swal.fire({
                            icon: 'error',
                            title: 'กรุณากรอกข้อมูลให้ถูกต้อง',
                            text: 'กรุณากรอกข้อมูลให้ถูกต้อง'
                        })
                        
                    }else {
                        var data = $("#data").text();
                        var url = null;
                        
                        url = "user?status1=S1"
                       
                        // var url = "../user?status1=S1&userid="+userid+"&password="+password+"&firstname="+firstname+"&lastname="+lastname+"&status="+status+"&statusqi="+statusqi

                        $.ajax({
                            type:"POST",
                            url:url,
                            data:form, 
                            success:function(msg,status){
                                console.log(msg);
                                if(msg == 'true'){
                                    Swal.fire({
                                        icon: 'success',
                                        title: 'บันทึกข้อมูลสำเร็จ',
                                        text: 'บันทึกข้อมูลสำเร็จ'
                                    })
                                }else if(msg == 'false'){
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'บันทึกข้อมูลไม่สำเร็จ',
                                        text: 'บันทึกข้อมูลไม่สำเร็จ'
                                    })
                                }
                            }
                        });
                        getdata();
                         
                    }
                   
                });
               
            });

        </script>
        <%@ include file="share/footer.jsp" %>
        
    </body>
</html>
