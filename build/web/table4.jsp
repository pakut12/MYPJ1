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
                <%@ include file="share/profile.jsp" %>
                <div class="col-sm-12 col-md-9">
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
                                            <button class="btn btn-success mt-4 btn-sm" id="btn-send" type="button"><i class="bi bi-hdd"></i> บันทึก</button>
                                            
                                        </div>
                                    </div>
                                    
                                </form> 
                                <div class="row mt-4">
                                    <div class="col-sm-12 col-md-6">
                                        <div class="row">
                                            <div class="col-sm-12 col-md-6">
                                                <label class="h6">Table WMBARCODE</label> 
                                            </div>
                                            <div class="col-sm-12 col-md-6">
                                                <label class="h6">จำนวนทั้งหมด : <label id="countwmbarcode"></label></label> 
                                            </div>
                                        </div>
                                        
                                        <table class="table table-sm table-bordered  text-center" id="mytable"  >
                                            <thead >
                                                <tr>
                                                    <th class="text-center">เลขที่ใบสั้งซื้อ</th>
                                                    <th class="text-center">สาขา</th>
                                                    <th class="text-center">รหัสวัตถุ</th>
                                                    <th class="text-center">ม้วนที่</th>
                                                    <th class="text-center">จำนวน</th>
                                                    <th class="text-center">หน่วย</th>
                                                    <th class="text-center">ลบ</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                
                                            </tbody>
                                            
                                        </table> 
                                    </div>
                                    <div class="col-sm-12 col-md-6">
                                        <div class="row">
                                            <div class="col-sm-12 col-md-6">
                                                <label class="h6">Table WMQCK</label> 
                                            </div>
                                            <div class="col-sm-12 col-md-6">
                                                <label class="h6">จำนวนทั้งหมด : <label id="countwmqck"></label></label> 
                                            </div>
                                        </div>
                                        
                                        <table class="table table-sm table-bordered  text-center" id="mytable1"  >
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
                        searching: false,
                        select:true,
                        info: false,
                        columnDefs: [
                            { "width": "10rem", "targets": 0 },
                            { "width": "5rem", "targets": 1 },
                            { "width": "10rem", "targets": 2 },
                            { "width": "5rem", "targets": 3 },
                            { "width": "5rem", "targets": 4 },
                            { "width": "5rem", "targets": 5 }, 
                            { "width": "5rem", "targets": 6 }, 
                        ],
                        fixedColumns:   {
                            left: false,
                            right: 1
                        }
                                            
                    }); 
                    $.ajax({
                        type: "POST",
                        url: 'getdatawm?status=G4&mrno='+mrno+'&item='+item,
                        success: function(msg,status){
                            var de = $.parseJSON(msg);
                            $("#countwmbarcode").text(de.count);   
                            console.log(de.count);
                                  
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
                        searching: false,
                        select:true,
                        info: false,
                        columnDefs: [
                            { "width": "10rem", "targets": 0 },
                            { "width": "10rem", "targets": 1 },
                            
                        ]
                                            
                    });
                    $.ajax({
                        type: "POST",
                        url: 'getdatawm?status=G5&mrno='+mrno+'&item='+item,
                        success: function(msg,status){
                            var de = $.parseJSON(msg);
                            $("#countwmqck").text(de.count);   
                            console.log(de.count);
                                      
                        }    
                    });                    
                }


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
                        getdata($("#mrno").val(),$("#item").val());  
                        getdata1($("#mrno").val(),$("#item").val());  
                    }         
                });
         
                $("#btn-send").click(function(){
                    //$("#btn-send").addClass("disabled");
                    //$("#btn-send").text("กำลังส่ง....");
                   
                    
                   
                    
       
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
        <br><br><br><br><br>
        <%@ include file="share/footer.jsp" %>
        
    </body>
</html>