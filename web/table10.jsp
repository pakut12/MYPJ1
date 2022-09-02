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
                                โปรเเกรมพิมพ์ใบตรวจสอบผ้าถัก
                            </div>
                            <div class="card-body">
                                <div class="row mb-3">
                                    <div class="col-sm-12 col-md-4">
                                        <label>เลขที่เอกสาร : </label>
                                        <input class="form-control form-control-sm" type="number" name="mrno" id="mrno" value="" required></input>
                                        <div class="invalid-feedback mb-3 text-center">
                                            กรุณาใส่ข้อมูลให้ถูกต้อง
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-4">
                                        <label>พาเลท : </label>
                                        <input class="form-control form-control-sm" type="number" name="pallet" id="pallet" value="" ></input>
                                        <div class="invalid-feedback mb-3 text-center">
                                            กรุณาใส่ข้อมูลให้ถูกต้อง
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-4">
                                        <button class="btn btn-secondary mt-4 btn-sm" id="btn-getdata" type="button"><i class="bi bi-download"></i> ดึงข้อมูล</button>
                                        <a href="table10.jsp"><button class="btn btn-danger mt-4 btn-sm" id="btn-reset" type="button"><i class="bi bi-arrow-clockwise"></i> เครียร์ข้อมูล</button></a>
                                        <button class="btn btn-success mt-4 btn-sm" id="btn-send" type="button"><i class="bi bi-printer"></i> พิมพ์รายงาน</button>
                                    </div>
                                    
                                </div>
                                <div class="row mb-3">
                                    <div class="col-sm-12 col-md-6">
                                        <div class="card">
                                            <div class="card-header">
                                                ผลการตรวจสอบของ QI
                                            </div>
                                            <div class="card-body mx-auto"> 
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="qicheck" id="qitrue" value="">
                                                    <label class="form-check-label" for="inlineRadio1">ผ่าน QI</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="qicheck" id="qifalse" value="">
                                                    <label class="form-check-label" for="inlineRadio2">ไม่ผ่าน QI</label>
                                                </div>
                                                
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-6">
                                        <div class="card">
                                            <div class="card-header">
                                                QI Approve
                                            </div>
                                            <div class="card-body "> 
                                                <div class="row  ">
                                                    <div class="col-sm-12 col-md-9">
                                                        <label>รายชื่อ : </label>
                                                        <select class="form-select form-select-sm ">
                                                            <option value="">คณิศา  ดิลกกาญจนาคม</option>
                                                            <option value="">รัชนก  กุณต๊ะคำ</option>
                                                            <option value="">ธวัชชัย  พรหมเวียง</option>
                                                        </select>
                                                        <div class="invalid-feedback mb-3 text-center">
                                                            กรุณาใส่ข้อมูลให้ถูกต้อง
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-12 col-md-3">
                                                        <button class="btn btn-success mt-4 btn-sm" id="btn-qi" type="button"><i class="bi bi-printer"></i> QI Approve</button>
                                                        
                                                    </div>
                                                </div>
                                                
                                                
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                                
                                <div class="row mt-4">
                                    <div class="col-sm-12 col-md-12">
                                        
                                        <table class="table table-sm table-bordered  text-center" id="mytable"  >
                                            <thead >
                                                <tr>
                                                    <th class="text-center">ม้วนที่</th>
                                                    <th class="text-center">รหัสวัตถุดิบ</th>
                                                    <th class="text-center">พาเลต</th>
                                                    <th class="text-center">จำนวนนับได้</th>
                                                    <th class="text-center">เกรด QC</th>
                                                    <th class="text-center">ผู้ตรวจสอบ</th>
                                                    <th class="text-center">สรุปผล1</th>
                                                    <th class="text-center">สรุปผล2</th>
                                                    <th class="text-center">สรุปผล3</th>
                                                    <th class="text-center">ผลรวม</th>
                                                    <th class="text-center">Mack</th>
                                                    
                                                    
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
                function getdata(mrno,pallet){
             
                    table = $("#mytable").DataTable({
                        bDestroy: true,
                        ajax: 'getdatawm?status=G15&mrno='+mrno+'&pallet='+pallet,
                        responsive: false,
                        scrollY: true ,
                        scrollX: true ,
                        columnDefs: [
                            { "width": "5rem", "targets": 0 },
                            { "width": "10rem", "targets": 1 },
                            { "width": "5rem", "targets": 2 },
                            { "width": "5rem", "targets": 3 },
                            { "width": "5rem", "targets": 4 },
                            { "width": "5rem", "targets": 5 },
                            { "width": "5rem", "targets": 6 },
                            { "width": "5rem", "targets": 7 },
                            { "width": "5rem", "targets": 8 },
                            { "width": "5rem", "targets": 9 },
                            { "width": "5rem", "targets": 10 }
                            
                        ],
                        
                        select: true
                                             
                    }); 
                    $.ajax({
                        type: "POST",
                        url: 'getdatawm?status=G15&mrno='+mrno+'&pallet='+pallet,
                        success: function(msg,status){
                            var de = $.parseJSON(msg);
                            
                        }    
                    });  
                               
                }
               
                $("#page3").addClass("active");
                $("#btn-send").addClass("disabled");
                $("#btn-qi").addClass("disabled");
                getdata("","");  
                $("#qitrue").prop("checked", true);
                
                $("#btn-getdata").click(function(){
                    if($("#mrno").val() == "" || $("#pallet").val() == ""){
                        $("#myform").addClass("was-validated");
                        Swal.fire({
                            icon: 'error',
                            title: 'ข้อมูลไม่ถูกต้อง',
                            text: 'กรุณาใส่ข้อมูลให้ถูกต้อง'
                        })
                    }else{
                        $("#btn-send").removeClass("disabled");                       
                        getdata($("#mrno").val(),$("#pallet").val());  
                       
                    }         
                });
              
                $("#btn-send").click(function(){
                    var mrno = $("#mrno").val();
                    var pallet = $("#pallet").val();
                   
                    var remark1 = $("#remark1").val();
                    var remark2 = $("#remark2").val();
                    var remark3 = $("#remark3").val();
                    var gradeqc = $("#gradeqc").val();
                    var mrno = $("#mrno").val();
                    var item = $("#item").val();
                    
                    if(mrno == "" || pallet == ""){
                        Swal.fire({
                            icon: 'error',
                            title: 'ข้อมูลไม่ถูกต้อง',
                            text: 'กรุณาใส่ข้อมูลให้ถูกต้อง'
                        })
                    }else{
                          
                        $.ajax({
                            type: "POST",
                            url: 'getdatawm?status=G12&mrno='+mrno+'&pallet='+pallet,
                            success: function(msg,status){
                                var de = $.parseJSON(msg);
                                $.each(de.arrroll,function(k,v){
                                    var url = 'edititem?status=G4&remark1='+remark1+'&remark2='+remark2+'&remark3='+remark3+'&mrno='+mrno+'&item='+item+'&roll='+v+'&gradeqc='+gradeqc;
                                    $.ajax({
                                        type: "POST",
                                        url: url,
                                        success: function(msg,status){
                                            if(msg == 'true'){
                                                Swal.fire({
                                                    icon: 'success',
                                                    title: 'บันทึกข้อมูลสำเร็จ',
                                                    text: 'บันทึกข้อมูลสำเร็จ'
                                                })
                                                
                                            }else{
                                                Swal.fire({
                                                    icon: 'error',
                                                    title: 'บันทึกข้อมูลไม่สำเร็จ',
                                                    text: 'บันทึกข้อมูลไม่สำเร็จ'
                                                })
                                            }
                                        }    
                                    });   
                                });
                                getdata($("#mrno").val(),$("#pallet").val());  
                            }
                        });   
                    }
                  
               
             
         
                    
                    
                   
                  
                    
                   
                    
       
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