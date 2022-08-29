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
                                โปรเเกรมคีย์ข้อมูลการตรวจสอบผ้าถัก
                            </div>
                            
                            <div class="card-body">
                                <div class="row mb-3">
                                    <div class="col-sm-12 col-md-6">
                                        <label>รหัสบาร์โค๊ด : </label>
                                        <input class="form-control form-control-sm" type="number" name="barcode" id="barcode" value="" required></input>
                                        <div class="invalid-feedback mb-3 text-center">
                                            กรุณาใส่ข้อมูลให้ถูกต้อง
                                        </div>
                                    </div>
                                    
                                    <div class="col-sm-12 col-md-6">
                                        <label>เลขที่เอกสาร : </label>
                                        <input class="form-control form-control-sm" type="text" name="doc" id="doc" value="" readonly></input>
                                        <div class="invalid-feedback mb-3 text-center">
                                            กรุณาใส่ข้อมูลให้ถูกต้อง
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row">
                                    <div class="col-sm-12 col-md-3">
                                        <label>รหัสวัตถุดิบ : </label>
                                        <input class="form-control form-control-sm" type="text" name="item" id="item" value="" readonly></input>
                                        <div class="invalid-feedback mb-3 text-center">
                                            กรุณาใส่ข้อมูลให้ถูกต้อง
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-2">
                                        <label>ม้วนที่ : </label>
                                        <input class="form-control form-control-sm" type="text" name="roll" id="roll" value="" readonly></input>
                                        <div class="invalid-feedback mb-3 text-center">
                                            กรุณาใส่ข้อมูลให้ถูกต้อง
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-2">
                                        <label>พาเลท : </label>
                                        <input class="form-control form-control-sm" type="text" name="pallet" id="pallet" value="" readonly></input>
                                        <div class="invalid-feedback mb-3 text-center">
                                            กรุณาใส่ข้อมูลให้ถูกต้อง
                                        </div>
                                    </div> 
                                    <div class="col-sm-12 col-md-5">
                                        <button class="btn btn-secondary mt-4 btn-sm" id="btn-getdata" type="button"><i class="bi bi-download"></i> ดึงข้อมูล</button>
                                        <button class="btn btn-danger mt-4 btn-sm" id="btn-reset" type="button"><i class="bi bi-arrow-clockwise"></i> เครียร์ข้อมูล</button>
                                        <button class="btn btn-success mt-4 btn-sm" id="btn-send" type="button"><i class="bi bi-hdd"></i> บันทึกข้อมูล</button>
                                    </div>
                                </div>
                                <div class="card  mt-3" >
                                    <div class="card-header">
                                        เเก้ไขข้อมูล
                                    </div>
                                    <div class="card-body">
                                        <div class="row mb-3">
                                            <div class="col-sm-12 col-md-4">
                                                <label>จำนวนที่มา : </label>
                                                <input class="form-control form-control-sm" type="text" name="quantity" id="quantity" value="" readonly></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-4">
                                                <label>จำนวนที่ได้ : </label>
                                                <input class="form-control form-control-sm" type="text" name="actqty" id="actqty" value="" required></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-4">
                                                <label>หน้าผ้าที่วัดได้ : </label>
                                                <input class="form-control form-control-sm" type="text" name="width" id="width" value="" required></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-sm-12 col-md-4">
                                                <label>ตำหนิ-ด้านเเทรก : </label>
                                                <input class="form-control form-control-sm" type="number" name="ethread" id="ethread" value="" onClick="this.select();" onkeyup="sum();" required></input>
                                                
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-4">
                                                <label>ตำหนิ-ด่าง : </label>
                                                <input class="form-control form-control-sm" type="number" name="ealkali" id="ealkali" value="" onClick="this.select();" onkeyup="sum();" required></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-4">
                                                <label>ตำหนิ-สกปรก : </label>
                                                <input class="form-control form-control-sm" type="number" name="edirty" id="edirty" value="" onClick="this.select();" onkeyup="sum();" required></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-sm-12 col-md-4">
                                                <label>ตำหนิ-น้ำมัน จุดสี : </label>
                                                <input class="form-control form-control-sm" type="number" name="eoil" id="eoil" value=""  onClick="this.select();" onkeyup="sum();" required></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-4">
                                                <label>ตำหนิ-ขาด : </label>
                                                <input class="form-control form-control-sm" type="number" name="ebroken" id="ebroken" value="" onClick="this.select();" onkeyup="sum();" required></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-4">
                                                <label>ตำหนิ-ปุ่มปม : </label>
                                                <input class="form-control form-control-sm" type="number" name="eknot" id="eknot" value="" onClick="this.select();" onkeyup="sum();" required></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-sm-12 col-md-4">
                                                <label>ตำหนิ-ตัวหนอน : </label>
                                                <input class="form-control form-control-sm" type="number" name="ejoint" id="ejoint" value="" onClick="this.select();" onkeyup="sum();" required></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-4">
                                                <label>ตำหนิ-ลายขวาง : </label>
                                                <input class="form-control form-control-sm" type="number" name="efurrow" id="efurrow" value="" onClick="this.select();" onkeyup="sum();" required></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-4">
                                                <label>ตำหนิรวม : </label>
                                                <input class="form-control form-control-sm" type="number" name="sum" id="sum" value="" onClick="this.select();" onkeyup="sum();" required></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-sm-12 col-md-4">
                                                <label>บาร์โค๊ดร้านค้า : </label>
                                                <input class="form-control form-control-sm" type="text" name="erepeat" id="erepeat" value="" required></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-4">
                                                <label>สี : </label>
                                                <input class="form-control form-control-sm" type="text" name="color" id="color" value="" readonly></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-4">
                                                <label>หม้อย้อม : </label>
                                                <input class="form-control form-control-sm" type="text" name="batch" id="batch" value="" readonly></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-sm-12 col-md-4">
                                                <label>วันที่ตรวจสอบ : </label>
                                                <input class="form-control form-control-sm" type="date" name="qcdate" id="qcdate" value="" readonly></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-4">
                                                <label>เกรดที่มา : </label>
                                                <input class="form-control form-control-sm" type="text" name="grade" id="grade" value="" readonly></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-4">
                                                <label>%การสูญเสีย : </label>
                                                <input class="form-control form-control-sm" type="text" name="gradeqc" id="gradeqc" value="" readonly></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-sm-12 col-md-4">
                                                <label>น้ำหนักผ้า : </label>
                                                <input class="form-control form-control-sm" type="text" name="weight" id="weight" value="" readonly></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-4">
                                                <label>การวางผ้า : </label>
                                                <input class="form-control form-control-sm" type="text" name="qtylay" id="qtylay" value="" readonly></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-4">
                                                <label>การนำไปคำนวน : </label>
                                                <div class="row">
                                                    <div class="col-sm-6 col-md-6">
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="radio" name="mark" id="mark1" value="*">
                                                            <label class="form-check-label" for="flexRadioDefault1">
                                                                คำนวน
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-6 col-md-6">
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="radio" name="mark" id="mark2"  value="" >
                                                            <label class="form-check-label" for="flexRadioDefault1">
                                                                ไม่คำนวน
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12 col-md-8">
                                                <label>ชื่อผู้ตรวจสอบ : </label>
                                                <input class="form-control form-control-sm" type="text" name="byname" id="byname" value="" required></input>
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
        
        
        
        <script>
            function sum(){
                var e1 = parseInt($("#ethread").val());
                var e2 = parseInt($("#ealkali").val());
                var e3 = parseInt($("#edirty").val());
                var e4 = parseInt($("#eoil").val());
                var e5 = parseInt($("#ebroken").val());
                var e6 = parseInt($("#eknot").val());
                var e7 = parseInt($("#ejoint").val());
                var e8 = parseInt($("#efurrow").val());
                
                var sum = e1+e2+e3+e4+e5+e6+e7+e8 ;
                
                $("#sum").val(sum);
            }
            
            $(document).ready(function () {
                var table;
                function getdata(barcode){ 
                    $.ajax({
                        type: "POST",
                        url: 'getdatawm?status=G11&barcode='+barcode,
                        success: function(msg,status){
                            var de = $.parseJSON(msg);
                            
                            $("#doc").val(de.mrno);  
                            $("#item").val(de.item);   
                            $("#roll").val(de.roll);   
                            $("#pallet").val(de.pallet);   
                            
                            $("#quantity").val(de.data[0]); 
                            $("#actqty").val(de.data[1]); 
                            $("#width").val(de.data[2]); 

                            if(de.data[3] == null){
                                de.data[3] = 0 ;
                            }
                            if(de.data[4] == null){
                                de.data[4] = 0 ;
                            }
                            if(de.data[5] == null){
                                de.data[5] = 0 ;
                            }
                            if(de.data[6] == null){
                                de.data[6] = 0 ;
                            }
                            if(de.data[7] == null){
                                de.data[7] = 0 ;
                            }
                            if(de.data[8] == null){
                                de.data[8] = 0 ;
                            }
                            if(de.data[8] == null){
                                de.data[8] = 0 ;
                            }
                            if(de.data[9] == null){
                                de.data[9] = 0 ;
                            }
                            if(de.data[10] == null){
                                de.data[10] = 0 ;
                            }
                            if(de.data[11] == null){
                                de.data[11] = 0 ;
                            }
        
        
                            $("#ethread").val(de.data[3]);  
                            $("#ealkali").val(de.data[4]);  
                            $("#edirty").val(de.data[5]);  
                            $("#eoil").val(de.data[6]);  
                            $("#ebroken").val(de.data[7]);  
                            $("#eknot").val(de.data[8]);  
                            $("#ejoint").val(de.data[9]);  
                            $("#efurrow").val(de.data[10]);  
                            $("#sum").val(de.data[11]);  
                            
        
                            $("#erepeat").val(de.data[12]);  
                            $("#color").val(de.data[13]);  
                            $("#batch").val(de.data[14]);  
                            $("#qcdate").val(de.data[15]);  
                            $("#grade").val(de.data[16]);  
                            $("#gradeqc").val(de.data[17]);  
                            $("#weight").val(de.data[18]);  
                            $("#qtylay").val(de.data[19]);
                            $("#byname").val(de.data[20]);  
                            $("#mark").val(de.data[21]);
                            
                            if($("#mark").val(de.data[21]) == null){
                                $("#mark1").prop('checked', true);
                            }else{
                                $("#mark2").prop('checked', true);
                            }
                            sum();
                        }    
                    });                    
                }
               
                $("#page3").addClass("active");
                $("#btn-send").addClass("disabled");
               
                $("#btn-getdata").click(function(){
                    if($("#barcode").val() == ""){
                        $("#myform").addClass("was-validated");
                        Swal.fire({
                            icon: 'error',
                            title: 'ข้อมูลไม่ถูกต้อง',
                            text: 'กรุณาใส่ข้อมูลให้ถูกต้อง'
                        });
                    }else{
                        $("#btn-send").removeClass("disabled");                       
                        getdata($("#barcode").val());  
                       
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