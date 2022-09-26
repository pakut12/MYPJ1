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
                        <div class="card shadow ">
                            <div class="card-header text-center">
                                โปรเเกรมลบข้อมูลตามเลขที่เอกสาร
                            </div>
                            <div class="card-body">
                                <form id="myform" class="" >
                                    <div class="row mb-3">
                                        <%
            String item = (String) request.getAttribute("item");
            String mrno = (String) request.getAttribute("mrno");

            if (item != null && mrno != null) {

                                        %>
                                        <div class="col-sm-12 col-md-4">
                                            <label>เลขที่เอกสาร : </label>
                                            <input class="form-control form-control-sm" type="number" name="mrno" id="mrno" value="<%=mrno%>" required></input>
                                            <div class="invalid-feedback mb-3 text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-4"> 
                                            <label>รหัสวัตถุดิบ : </label>
                                            <input class="form-control form-control-sm" type="text" name="item" id="item"  value="<%=item%>" required></input>
                                            <div class="invalid-feedback mb-3 text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        <%            } else {
                                        %>             
                                        <div class="col-sm-12 col-md-4">
                                            <label>เลขที่เอกสาร : </label>
                                            <input class="form-control form-control-sm" type="number" name="mrno" id="mrno" required></input>
                                            <div class="invalid-feedback mb-3 text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-4">
                                            <label>รหัสวัตถุดิบ : </label>
                                            <input class="form-control form-control-sm" type="text" name="item" id="item" required></input>
                                            <div class="invalid-feedback mb-3 text-center">
                                                กรุณาใส่ข้อมูลให้ถูกต้อง
                                            </div>  
                                        </div>
                                        
                                        <%            }
                                        %>
                                        <div class="col-sm-12 col-md-4">
                                            <button class="btn btn-secondary mt-4 mx-1 btn-sm" id="btn-getdata" type="button"><i class="bi bi-download"></i> ดึงข้อมูล</button>
                                            <a href="deldoc.jsp"><button class="btn btn-danger mt-4 btn-sm" id="btn-reset" type="button"><i class="bi bi-arrow-clockwise"></i> เคลียร์ข้อมูล</button> </a>
                                            
                                        </div>
                                    </div>
                                    
                                </form> 
                                <div class="row mt-4">
                                    <div class="col-sm-12 col-md-6">
                                        <div class="row">
                                            <div class="col-sm-12 col-md-4">
                                                <label class="h6">Table WMBARCODE</label> 
                                            </div>
                                            <div class="col-sm-12 col-md-4 text-end">
                                                <label class="h5 ">จำนวนทั้งหมด : <label id="countwmbarcode"></label></label> 
                                            </div>
                                            <div class="col-sm-12 col-md-4 text-end">
                                                <button class="btn btn-sm btn-danger w-50" id="del_wmbarcode">ลบข้อมูล</button>
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <table class="table table-sm table-bordered  text-center w-100 " id="mytable">
                                                <thead >
                                                    <tr>
                                                        <th class="text-center">เลขที่ใบสั้งซื้อ</th>
                                                        <th class="text-center">สาขา</th>
                                                        <th class="text-center">รหัสวัตถุ</th>
                                                        <th class="text-center">ม้วนที่</th>
                                                        <th class="text-center">จำนวน</th>
                                                        <th class="text-center">หน่วย</th>
                                                        
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    
                                                </tbody>
                                                
                                            </table> 
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-6">
                                        <div class="row">
                                            <div class="col-sm-12 col-md-4">
                                                <label class="h6">Table WMQCK</label> 
                                            </div>
                                            <div class="col-sm-12 col-md-4 text-end">
                                                <label class="h5">จำนวนทั้งหมด : <label id="countwmqck"></label></label> 
                                            </div>
                                            <div class="col-sm-12 col-md-4 text-end">
                                                <button class="btn btn-sm btn-danger w-50" id="del_wmqck">ลบข้อมูล</button>
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <table class="table table-sm table-bordered  text-center w-100" id="mytable1"  >
                                                <thead>
                                                    <tr>
                                                        <th class="text-center">รหัสวัตดุดิบ</th>
                                                        <th class="text-center">ม้วนที่</th>
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
        </div>
        
        <script>
            
            $(document).ready(function () {
                var table;
                function getdata(mrno,item){
                    table = $("#mytable").DataTable({
                        bDestroy: true,
                        ajax: 'getdatawm?status=G4&mrno='+mrno+'&item='+item,
                        responsive: false,
                        scrollY: true ,
                        scrollX: true ,
                        searching: true,
                        select:true,
                        info: true,
                        columnDefs: [
                            { "width": "6rem", "targets": 0 },
                            { "width": "5rem", "targets": 1 },
                            { "width": "8rem", "targets": 2 },
                            { "width": "2rem", "targets": 3 },
                            { "width": "2rem", "targets": 4 },
                            { "width": "2rem", "targets": 5 }, 
                            
                        ]
                       
                                            
                    }); 
                    $.ajax({
                        type: "POST",
                        url: 'getdatawm?status=G4&mrno='+mrno+'&item='+item,
                        success: function(msg,status){
                            var de = $.parseJSON(msg);
                            $("#countwmbarcode").text(de.count);   
                            console.log(de.count);
                            if(mrno != "" && item != ""){
                                if(de.count > 0){
                                    Swal.fire({
                                        icon:"success",
                                        title:"ดึงข้อมูลสำเร็จ",
                                        text:"ดึงข้อมูลสำเร็จ"
                                    });
                                }else if(de.count <= 0){
                                    Swal.fire({
                                        icon:"error",
                                        title:"ไม่พบข้อมูล",
                                        text:"ไม่พบข้อมูล"
                                    });
                                }
                                
                            }
                                  
                        }    
                    });                    
                }
                var table1;
                function getdata1(mrno,item){
                    table = $("#mytable1").DataTable({
                        bDestroy: true,
                        ajax: 'getdatawm?status=G5&mrno='+mrno+'&item='+item,
                        responsive: false,
                        scrollY: true ,
                        scrollX: true ,
                        searching: true,
                        select:true,
                        info: true
                       
                                            
                    });
                    $.ajax({
                        type: "POST",
                        url: 'getdatawm?status=G5&mrno='+mrno+'&item='+item,
                        success: function(msg,status){
                            var de = $.parseJSON(msg);
                            $("#countwmqck").text(de.count);   
                            console.log(de.count);
                            if(mrno != "" && item != ""){
                                if(de.count > 0){
                                    Swal.fire({
                                        icon:"success",
                                        title:"ดึงข้อมูลสำเร็จ",
                                        text:"ดึงข้อมูลสำเร็จ"
                                    });
                                }else if(de.count <= 0){
                                    Swal.fire({
                                        icon:"error",
                                        title:"ไม่พบข้อมูล",
                                        text:"ไม่พบข้อมูล"
                                    });
                                }
                                
                            }
                                      
                        }    
                    });                    
                }

                $("#del_wmbarcode").addClass("disabled");
                $("#del_wmqck").addClass("disabled");
                $("#page2").addClass("active");
                $("#btn-send").addClass("disabled");
                getdata($("#mrno").val(),$("#item").val());  
                getdata1($("#mrno").val(),$("#item").val()); 
                
                $("#btn-getdata").click(function(){
                    if($("#mrno").val() == "" ||$("#item").val() == "" ){
                        $("#myform").addClass("was-validated");
                        Swal.fire({
                            icon: 'error',
                            title: 'ข้อมูลไม่ถูกต้อง',
                            text: 'กรุณาใส่ข้อมูลให้ถูกต้อง'
                        })
                       
                    }else{
                        $("#btn-send").removeClass("disabled");    
                        $("#del_wmbarcode").removeClass("disabled");
                        $("#del_wmqck").removeClass("disabled");                        
                        getdata($("#mrno").val(),$("#item").val());  
                        getdata1($("#mrno").val(),$("#item").val());  
                    }         
                });
         
                $("#del_wmbarcode").click(function(){
                    $("#del_wmbarcode").addClass("disabled");
                    $("#del_wmbarcode").text("กำลังลบ....");
                    var mrno = $("#mrno").val();
                    var item = $("#item").val();
                    $.ajax({
                        type: "POST",
                        url: 'del?status=D1&mrno='+mrno+'&item='+item,
                        success: function(msg,status){
                            var de = $.parseJSON(msg);
                            console.log(de);
                            if(de.status == "true"){
                                Swal.fire({
                                    icon:"success",
                                    title:"ลบข้อมูลสำเร็จ",
                                    text:"ลบข้อมูลสำเร็จ"
                                });
                            }else if(de.status  == "false"){
                                Swal.fire({
                                    icon:"error",
                                    title:"ลบข้อมูลไม่สำเร็จ",
                                    text:"ลบข้อมูลไม่สำเร็จ"
                                });
                            } 
                            $("#del_wmbarcode").removeClass("disabled");
                            $("#del_wmbarcode").text("ลบ");
                            getdata($("#mrno").val(),$("#item").val());  
                            getdata1($("#mrno").val(),$("#item").val());  
                            
                                      
                        }    
                    });
                
                });
                $("#del_wmqck").click(function(){
                    var mrno = $("#mrno").val();
                    var item = $("#item").val();
                    $("#del_wmqck").addClass("disabled");
                    $("#del_wmqck").text("กำลังลบ....");
                    $.ajax({
                        type: "POST",
                        url: 'del?status=D2&mrno='+mrno+'&item='+item,
                        success: function(msg,status){
                            var de = $.parseJSON(msg);
                            console.log(de);
                            if(de.status == "true"){
                                Swal.fire({
                                    icon:"success",
                                    title:"ลบข้อมูลสำเร็จ",
                                    text:"ลบข้อมูลสำเร็จ"
                                });
                            }else if(de.status  == "false"){
                                Swal.fire({
                                    icon:"error",
                                    title:"ลบข้อมูลไม่สำเร็จ",
                                    text:"ลบข้อมูลไม่สำเร็จ"
                                });
                            } 
                            $("#del_wmbarcode").removeClass("disabled");
                            $("#del_wmbarcode").text("ลบ");
                            getdata($("#mrno").val(),$("#item").val());  
                            getdata1($("#mrno").val(),$("#item").val());  
                            
                                      
                        }    
                    });
                   
                   
                    
       
                });
            });
        </script>
        <script>
            (function () {
                'use strict'
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.querySelectorAll('.needs-validation')

                // Loop over them and prevent submission
                Array.prototype.slice.call(forms)
                .forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }
                        form.classList.add('was-validated')
                    }, false)
                })
            })()
        </script>
        
        <%@ include file="share/footer.jsp" %>
        
    </body>
</html>