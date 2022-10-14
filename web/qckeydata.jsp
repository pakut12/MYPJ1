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
        
        <div class="container h-50 ">
            <div class="row">
                
                <div class="col-sm-12 col-md-12" >
                    <div id="pageview">
                        <div class="card shadow ">
                            <div class="card-header text-center">
                                โปรเเกรมคีย์ข้อมูลการตรวจสอบผ้าถัก
                            </div>
                            
                            <div class="card-body">
                                <div class="row ">
                                    <div class="col-sm-12 col-md-6">
                                        <label>รหัสบาร์โค๊ด : </label>
                                        <input class="form-control form-control-sm" type="number" name="barcode" id="barcode" value="" onClick="this.select();" required></input>
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
                                        <a href="qckeydata.jsp"><button class="btn btn-danger mt-4 btn-sm" id="btn-reset" type="button"><i class="bi bi-arrow-clockwise"></i> เคลียร์ข้อมูล</button></a>
                                        <button class="btn btn-success mt-4 btn-sm" id="btn-send" type="button"><i class="bi bi-hdd"></i> บันทึกข้อมูล</button>
                                    </div>
                                </div>
                                
                                <div class="card  mt-3" >
                                    <div class="card-header">
                                        เเก้ไขข้อมูล
                                    </div>
                                    <div class="card-body">
                                        <div class="row ">
                                            <div class="col-sm-12 col-md-3">
                                                <label>จำนวนที่มา : </label>
                                                <input class="form-control form-control-sm" type="text" name="quantity" id="quantity" value="" readonly></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-3">
                                                <label>จำนวนที่ได้ : </label>
                                                <input class="form-control form-control-sm" type="text" name="actqty" id="actqty" value="" onkeyup="sum();" required></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-3">
                                                <label>หน้าผ้าที่วัดได้ : </label>
                                                <input class="form-control form-control-sm" type="number" name="width" id="width" value="" required></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-3">
                                                <label>จุดสี-น้ำมัน-สกปรก : </label>
                                                <input class="form-control form-control-sm" type="number" name="ethread" id="ethread" value="" onClick="this.select();" onkeyup="sum();" required></input>
                                                
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row ">
                                            <div class="col-sm-12 col-md-3">
                                                <label>ลายขวาง : </label>
                                                <input class="form-control form-control-sm" type="number" name="ealkali" id="ealkali" value="" onClick="this.select();" onkeyup="sum();" required></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-3">
                                                <label>ความกว้างไม่ได้มาตรฐาน : </label>
                                                <input class="form-control form-control-sm" type="number" name="edirty" id="edirty" value="" onClick="this.select();" onkeyup="sum();" required></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-3">
                                                <label>ปุ่มปม : </label>
                                                <input class="form-control form-control-sm" type="number" name="eoil" id="eoil" value=""  onClick="this.select();" onkeyup="sum();" required ></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-3">
                                                <label>เส้นด้ายขาด : </label>
                                                <input class="form-control form-control-sm" type="number" name="ebroken" id="ebroken" value="" onClick="this.select();" onkeyup="sum();" required></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row ">
                                            
                                            <div class="col-sm-12 col-md-3">
                                                <label>รอยต่าง : </label>
                                                <input class="form-control form-control-sm" type="number" name="eknot" id="eknot" value="" onClick="this.select();" onkeyup="sum();" required></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-3">
                                                <label>รอยเข็ม : </label>
                                                <input class="form-control form-control-sm" type="number" name="ejoint" id="ejoint" value="" onClick="this.select();" onkeyup="sum();" required></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-3">
                                                <label>รอยเข็มเข้าลึก : </label>
                                                <input class="form-control form-control-sm" type="number" name="efurrow" id="efurrow" value="" onClick="this.select();" onkeyup="sum();" required></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-3">
                                                <label>ตำหนิรวม : </label>
                                                <input class="form-control form-control-sm" type="number" name="sum" id="sum" value="" onClick="this.select();" onkeyup="sum();" required></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            
                                        </div>
                                        
                                        <div class="row">
                                            <div class="col-sm-12 col-md-3">
                                                <label>บาร์โค๊ดร้านค้า : </label>
                                                <input class="form-control form-control-sm" type="number" name="erepeat" id="erepeat" value="" required></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-3">
                                                <label>สี : </label>
                                                <input class="form-control form-control-sm" type="text" name="color" id="color" value="" readonly></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-3">
                                                <label>มาตรฐานสี : </label>
                                                <input class="form-control form-control-sm" type="number" name="scolor" id="scolor" value="" ></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-3">
                                                <label>คะเเนน : </label>
                                                <input class="form-control form-control-sm" type="text" name="point" id="point" value="" readonly></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                                
                                            </div>
                                        </div>
                                        <div class="row ">
                                            
                                            <div class="col-sm-12 col-md-3">
                                                <label>เกรดที่มา : </label>
                                                <input class="form-control form-control-sm" type="text" name="grade" id="grade" value="" readonly></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-3">
                                                <label>หม้อย้อม : </label>
                                                <input class="form-control form-control-sm" type="text" name="batch" id="batch" value="" readonly></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-3">
                                                <label>น้ำหนักผ้า : </label>
                                                <input class="form-control form-control-sm" type="text" name="weight" id="weight" value="" readonly></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-3">
                                                <label>การวางผ้า : </label>
                                                <input class="form-control form-control-sm" type="text" name="qtylay" id="qtylay" value="" readonly></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row ">
                                            
                                            
                                            <div class="col-sm-12 col-md-4">
                                                <label>วันที่ตรวจสอบ : </label>
                                                <input class="form-control form-control-sm" type="date" name="qcdate" id="qcdate" value="" readonly></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-4">
                                                <label>ชื่อผู้ตรวจสอบ : </label>
                                                <input class="form-control form-control-sm" type="text" name="byname1" id="byname1" value="<%=session.getAttribute("name")%>" readonly></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-4">
                                                <label>ชื่อผู้ตรวจสอบล่าสุด : </label>
                                                <input class="form-control form-control-sm" type="text" name="byname" id="byname" value="" readonly></input>
                                                <div class="invalid-feedback mb-3 text-center">
                                                    กรุณาใส่ข้อมูลให้ถูกต้อง
                                                </div>
                                            </div>
                                            <input class="form-control form-control-sm" type="hidden" name="mark_toterr" id="mark_toterr" value="" required></input>
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
                console.log(sum);
                var sum1 = ((sum / 100)* $("#actqty").val());
               
                $("#point").val(sum1.toFixed(2));
                if($("#point").val() > 7){
                    $("#mark_toterr").val("*");  
                }else{
                    $("#mark_toterr").val("");  
                }
                
            }
            function today(){
                var date = new Date();
                var d =date.getDate()
                var m = date.getMonth()+1;
                var y = date.getFullYear();
                if(m <10){
                    m = "0"+m;
                }
                if(d <10){
                    d = "0"+d;
                }
                var today = y+"-"+m+"-"+d;
                return today;
            }
    
    
            $(document).ready(function () {
               
                function getdata(barcode){ 
                    $.ajax({
                        type: "POST",
                        url: 'getdatawm?status=G11&barcode='+barcode,
                        success: function(msg,status){
                            console.log(msg);
                            try{
                                
                                var de = $.parseJSON(msg);
                               
                                $("#doc").val(de.mrno);  
                                $("#item").val(de.item);   
                                $("#roll").val(de.roll);   
                                $("#pallet").val(de.pallet);   
                            
                                $("#quantity").val(de.data[0]); 
                                $("#actqty").val(de.data[1]); 
                                $("#width").val(de.data[2]); 

                                if(de.data[3] == null ||de.data[3] == " "||de.data[3] == ""){
                                    de.data[3] = 0 ;
                                }
                                if(de.data[4] == null ||de.data[4] == " " ||de.data[4] == ""){
                                    de.data[4] = 0 ;
                                }
                                if(de.data[5] == null ||de.data[5] == " " ||de.data[5] == ""){
                                    de.data[5] = 0 ;
                                }
                                if(de.data[6] == null ||de.data[6] == " " ||de.data[6] == ""){
                                    de.data[6] = 0 ;
                                }
                                if(de.data[7] == null ||de.data[7] == " " ||de.data[7] == ""){
                                    de.data[7] = 0 ;
                                }
                                if(de.data[8] == null ||de.data[8] == " " ||de.data[8] == ""){
                                    de.data[8] = 0 ;
                                }
                                if(de.data[8] == null ||de.data[8] == " " ||de.data[8] == ""){
                                    de.data[8] = 0 ;
                                }
                                if(de.data[9] == null || de.data[9] == " " ||de.data[9] == ""){
                                    de.data[9] = 0 ;
                                }
                                if(de.data[10] == null || de.data[10] == " " ||de.data[10] == ""){
                                    de.data[10] = 0 ;
                                }
                                if(de.data[11] == null || de.data[11] == " " ||de.data[11] == ""){
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
                                $("#qcdate").val(today());  
                                $("#grade").val(de.data[16]);  
                                $("#scolor").val(de.data[17]);  
                                $("#weight").val(de.data[18]);  
                                $("#qtylay").val(de.data[19]);
                                $("#byname").val(de.data[20]);  
                                $("#mark_toterr").val(de.data[21]);  
                            
                                sum();
                                Swal.fire({
                                    icon:"success",
                                    title:"ดึงข้อมูลสำเร็จ",
                                    text:"ดึงข้อมูลสำเร็จ"
                                });
                            }catch(err){
                                Swal.fire({
                                    icon:"error",
                                    title:"ไม่พบข้อมูล",
                                    text:"ไม่พบข้อมูล"
                                });
                                $("#doc").val("");  
                                $("#item").val("");   
                                $("#roll").val("");   
                                $("#pallet").val("");   
                            
                                $("#quantity").val(""); 
                                $("#actqty").val(""); 
                                $("#width").val(""); 
                                $("#ethread").val("");  
                                $("#ealkali").val("");  
                                $("#edirty").val("");  
                                $("#eoil").val("");  
                                $("#ebroken").val("");  
                                $("#eknot").val("");  
                                $("#ejoint").val("");  
                                $("#efurrow").val("");  
                                $("#sum").val("");  
                            
                                $("#erepeat").val("");
                                $("#color").val("");
                                $("#batch").val("");
                                $("#qcdate").val("");
                                $("#grade").val("");
                                $("#scolor").val(""); 
                                $("#weight").val("");  
                                $("#qtylay").val("");
                                $("#byname").val("");
                                $("#mark_toterr").val("");
                                $("#point").val("");
                            }
                        }
                    });                    
                }
               
                $("#page3").addClass("active");
                $("#btn-send").addClass("disabled");
               
                $("#btn-getdata").click(function(){
                    if($("#barcode").val() == ""){
                        
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
                    Swal.fire({
                        title: 'คุณต้องการบันทึกหรือไม่',
                        text: "คุณต้องการบันทึกหรือไม่",
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'OK'
                    }).then(function(result){
                        if (result.isConfirmed) {
                            var actqty = $("#actqty").val();
                            var ethread = $("#ethread").val();
                            var eoil = $("#eoil").val();
                            var eknot = $("#eknot").val();
                            var ejoint = $("#ejoint").val();
                            var efurrow = $("#efurrow").val();
                            var edirty = $("#edirty").val();
                            var ealkali = $("#ealkali").val();
                            var ebroken = $("#ebroken").val();
                            var erepeat = $("#erepeat").val();
                            var sum = $("#sum").val();
                            var width = $("#width").val();
                            var scolor = $("#scolor").val();
                            var byname1 = $("#byname1").val();
                            var weight = $("#weight").val();
                            var qtylay = $("#qtylay").val();
                            var mark_toterr = $("#mark_toterr").val();
                            var qcdate = $("#qcdate").val();
                            var point = $("#point").val();
                   
                            var mrno = $("#doc").val();
                            var item = $("#item").val();
                            var roll = $("#roll").val();
                            var pallet = $("#pallet").val();
        
                            var url = "edititem?status=G3";
            
                            $.ajax({
                                type: "POST",
                                url: url,
                                data: "&actqty="+actqty+"&ethread="+ethread+"&eoil="+eoil+"&eknot="+eknot+"&ejoint="+ejoint+"&efurrow="+efurrow+"&edirty="+edirty+"&ealkali="+ealkali+"&ebroken="+ebroken+"&erepeat="+erepeat+"&sum="+sum+"&width="+width+"&scolor="+scolor+"&byname1="+byname1+"&weight="+weight+"&qtylay="+qtylay+"&mark_toterr="+mark_toterr+"&qcdate="+qcdate+"&point="+point+"&mrno="+mrno+"&item="+item+"&roll="+roll+"&pallet="+pallet,
                                success: function(msg,status){          
                                    if(msg == "true"){
                                        Swal.fire({
                                            icon: 'success',
                                            title: 'บันทึกข้อมูลสำเร็จ',
                                            text: 'บันทึกข้อมูลสำเร็จ'
                                        });
                                        //getdata($("#barcode").val()); 
                                    }else if(msg == "false"){
                                        Swal.fire({
                                            icon: 'error',
                                            title: 'บันทึกข้อมูลไม่สำเร็จ',
                                            text: 'บันทึกข้อมูลไม่สำเร็จ'
                                        });
                                    }
                                }    
                            });  
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