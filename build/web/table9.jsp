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
                                โปรเเกรมคีย์สรุปผลการตรวจสอบผ้าถัก
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
                                        <label>รหัสวัตถุดิบ : </label>
                                        <input class="form-control form-control-sm" type="text" name="item" id="item" value="" readonly></input>
                                        <div class="invalid-feedback mb-3 text-center">
                                            กรุณาใส่ข้อมูลให้ถูกต้อง
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-4">
                                        <label>จำนวนม้วนผ้า : </label>
                                        <input class="form-control form-control-sm" type="text" name="count" id="count" value="" readonly></input>
                                        <div class="invalid-feedback mb-3 text-center">
                                            กรุณาใส่ข้อมูลให้ถูกต้อง
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row">
                                    <div class="col-sm-12 col-md-6">
                                        <label>รายงานละเอียดวัตถุดิบ : </label>
                                        <input class="form-control form-control-sm" type="text" name="des1" id="des1" value="" readonly></input>
                                        <div class="invalid-feedback mb-3 text-center">
                                            กรุณาใส่ข้อมูลให้ถูกต้อง
                                        </div>
                                    </div>
                                    
                                    <div class="col-sm-12 col-md-6">
                                        <button class="btn btn-secondary mt-4 btn-sm" id="btn-getdata" type="button"><i class="bi bi-download"></i> ดึงข้อมูล</button>
                                        <a href="table9.jsp"><button class="btn btn-danger mt-4 btn-sm" id="btn-reset" type="button"><i class="bi bi-arrow-clockwise"></i> เครียร์ข้อมูล</button></a>
                                        <button class="btn btn-success mt-4 btn-sm" id="btn-send" type="button"><i class="bi bi-hdd"></i> บันทึกข้อมูล</button>
                                    </div>
                                </div>
                                <div class="row mt-4">
                                    <div class="col-sm-12 col-md-12">
                                        
                                        
                                        <table class="table table-sm table-bordered  text-center" id="mytable"  >
                                            <thead >
                                                <tr>
                                                    <th class="text-center">ลำดับ</th>
                                                    <th class="text-center">หน้าผ้าที่วัดได้</th>
                                                    <th class="text-center">จำนวนที่มา</th>
                                                    <th class="text-center">จำนวนที่ได้</th>
                                                    <th class="text-center">จุดสี-น้ำมัน-สกปรก</th>
                                                    <th class="text-center">ลายขวาง</th>
                                                    <th class="text-center">ความกว้างไม่ได้มาตรฐาน</th>
                                                    <th class="text-center">ปุ่มปม</th>
                                                    <th class="text-center">เส้นด้ายขาด</th>
                                                    <th class="text-center">รอยต่าง</th>
                                                    <th class="text-center">รอยเข็ม</th>
                                                    <th class="text-center">รอยเข็มเข้าลึก</th>
                                                    <th class="text-center">ตำหนิรวม </th>
                                                    <th class="text-center">คะเเนน</th>
                                                    <th class="text-center">บาร์โค๊ดร้านค้า</th>
                                                    <th class="text-center">Mark</th>
                                                    
                                                </tr>
                                            </thead>
                                            <tbody>
                                                
                                            </tbody>
                                            
                                        </table> 
                                        
                                    </div>
                                    
                                </div>
                                
                                <div class="row mt-3">
                                    <div class="col-sm-12 col-md-6">
                                        <div class="card">
                                            <div class="card-header">
                                                คีย์สรุปผลการตรวจสอบ
                                            </div>
                                            <div class="card-body">
                                                <label> Remack1 : </label>
                                                <input class="form-control form-control-sm mb-2" type="text" name="des1" id="des1" value="" ></input>
                                                <label> Remack2  : </label>
                                                <input class="form-control form-control-sm mb-2" type="text" name="des1" id="des1" value="" ></input>
                                                <label> Remack3 : </label>
                                                <input class="form-control form-control-sm mb-2" type="text" name="des1" id="des1" value="" ></input>
                                            </div>
                                        </div> 
                                    </div>
                                    <div class="col-sm-12 col-md-6">
                                        <div class="card">
                                            <div class="card-header">
                                                ระบุข้อมูลเพื่อคำนวน % การสูญเสีย
                                            </div>
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-sm-12 col-md-6">
                                                        <label>จำนวนที่มารวม : </label>
                                                        <input class="form-control form-control-sm" type="text" name="des1" id="des1" value="" ></input>
                                                        <div class="invalid-feedback mb-3 text-center">
                                                            กรุณาใส่ข้อมูลให้ถูกต้อง
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-12 col-md-6">
                                                        <label>จำนวนที่รวมได้ : </label>
                                                        <input class="form-control form-control-sm" type="text" name="des1" id="des1" value="" ></input>
                                                        <div class="invalid-feedback mb-3 text-center">
                                                            กรุณาใส่ข้อมูลให้ถูกต้อง
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-sm-12 col-md-6">
                                                        <label>จำนวนม้วนที่ * : </label>
                                                        <input class="form-control form-control-sm" type="text" name="des1" id="des1" value="" ></input>
                                                        <div class="invalid-feedback mb-3 text-center">
                                                            กรุณาใส่ข้อมูลให้ถูกต้อง
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-12 col-md-6">
                                                        <label>จำนวนรวม * : </label>
                                                        <input class="form-control form-control-sm" type="text" name="des1" id="des1" value="" ></input>
                                                        <div class="invalid-feedback mb-3 text-center">
                                                            กรุณาใส่ข้อมูลให้ถูกต้อง
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-sm-12 col-md-6">
                                                        <label> การสูญเสีย : </label>
                                                        <input class="form-control form-control-sm" type="text" name="des1" id="des1" value="" ></input>
                                                        <div class="invalid-feedback mb-3 text-center">
                                                            กรุณาใส่ข้อมูลให้ถูกต้อง
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
                </div>
            </div>
        </div>
        
        <script>
            
            $(document).ready(function () {
                var table;
                function getdata(po){
                    table = $("#mytable").DataTable({
                        bDestroy: true,
                        ajax: 'getdatawm?status=G12&mrno='+po,
                        responsive: false,
                        scrollY: true ,
                        scrollX: true ,
                       
                        columnDefs: [
                            { "width": "1rem", "targets": 0 },
                            { "width": "7rem", "targets": 1 },
                            { "width": "5rem", "targets": 2 },
                            { "width": "10rem", "targets": 3 },
                            { "width": "10rem", "targets": 4 },
                            { "width": "7rem", "targets": 5 },
                            { "width": "10rem", "targets": 6 },
                            { "width": "7rem", "targets": 7 },
                            { "width": "7rem", "targets": 8 },
                            { "width": "7rem", "targets": 9 },
                            { "width": "5rem", "targets": 10 },
                            { "width": "10rem", "targets": 11},  
                            { "width": "5rem", "targets": 12 },
                            { "width": "5rem", "targets": 13 },  
                            { "width": "10rem", "targets": 14 },
                            { "width": "5rem", "targets": 15 },
                        ],
                        select:true
                        
                       
                                            
                    }); 
                    $.ajax({
                        type: "POST",
                        url: 'getdatawm?status=G7&po='+po,
                        success: function(msg,status){
                            var de = $.parseJSON(msg);
                            $("#countwmbarcode").text(de.count);   
                            console.log(de.count);
                                  
                        }    
                    });                    
                }
               


                $("#page2").addClass("active");
                $("#btn-send").addClass("disabled");
                getdata("902207002597");  
                
                
                $("#btn-getdata").click(function(){
                    if($("#po").val() == ""){
                        $("#myform").addClass("was-validated");
                        Swal.fire({
                            icon: 'error',
                            title: 'ข้อมูลไม่ถูกต้อง',
                            text: 'กรุณาใส่ข้อมูลให้ถูกต้อง'
                        })
                       
                    }else{
                        $("#btn-send").removeClass("disabled");                       
                        getdata($("#mrno").val());  
                       
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