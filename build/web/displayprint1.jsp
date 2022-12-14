<%-- 
    Document   : test
    Created on : 20 ส.ค. 2565, 17:23:49
    Author     : Gus
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <link href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>    
        
         body{
             font-size:12px;
         } 
         div.divFooter {
             position: fixed;
             bottom: 0;
             display: none;
         }
         div.main {
             position: fixed;
             top: 0;
         }
        
    </style>
    <%
            String user = (String) session.getAttribute("name");
    %>
    
    <body>
        
        <div class="main w-100" id="main">
            
            <div class="row mb-3">
                <div class="col-3">
                    <div class="text-start"><b>สาขา :</b> <label id="PLANT"></label></div>
                </div>
                <div class="col-6 ">
                    <div class="text-center h5" id="officename"><b>บริษัท ไทยสปอร์การ์เมนต์ จำกัด<br>ใบตรวจสอบ</b></div>
                </div>
                <div class="col-3 ">
                    <div class="text-end"><b>หน้าที่ </b>1</div>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-3">
                    <div class="text-start"><b>รหัส :</b> <label id="ITEM"></label></div>
                </div>
                <div class="col-3 ">
                    <div class="text-start"><b>เลขที่ใบสั่งซื้อ :</b> <label id="PO"></label></div>
                </div>
                <div class="col-3 ">
                    <div class="text-end"><b>เลขที่บิล :</b> <label id="INVOICE"></label></div>
                </div>
                <div class="col-3 ">
                    <div class="text-end"><b>วันที่บิล :</b> <label id="INVOICEDATE"></label></div>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-10">
                    <div class="text-start"><b>Description1/หน้าผ้าที่สั่งซื้อ :</b> <label id="DESC1"></label></div>
                </div>
                <div class="col-2">
                    <div class="text-end"><b>พาเลต :</b> <label id="PALET"></label></div>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-6">
                    <div class="text-start"><b>Description2 :</b>  <label id="DESC2"></label></div>
                </div>
                <div class="col-6">
                    <div class="text-end"><b>Description3 :</b> <label id="DESC3"></label></div>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-5">
                    <div class="text-start"><b>ร้านค้า :</b> <label id="SUPNAME"></label></div>
                </div>
                <div class="col-3 ">
                    <div class="text-start"><b>เลขที่เอกสาร :</b> <label id="MRNO"></label></div>
                </div>
                <div class="col-2 ">
                    <div class="text-end"><b>หน่วยนับ :</b> <label id="UNIT"></label></div>
                </div>
                <div class="col-2 ">
                    <div class="text-end"><b>วันที่ :</b> <label id="QCDATE"></label></div>
                </div>
            </div>
        </div>
        <div class="row ">
            <div class="col-sm-12">
                <br>  <br>  <br>  <br>  <br>  <br><br>  <br>  <br>  <br>  <br>  
                <table class="table table-bordered border-dark text-center  w-100" id="mytable">
                    
                    <thead>
                        
                        <tr>
                            <th>ลำ<br>ดับ<br>ที่</th>
                            <th>หน้าผ้า<br>ที่วัดได้</th>
                            <th>สี</th>
                            <th>มาตร<br>ฐานสี</th>
                            <th>จำนวน<br>ที่มา</th>
                            <th>จำนวน<br>ที่ได้</th>
                            <th>ด้าย<br>เเทรก</th>
                            <th>ด่าง</th>
                            <th>สก<br>ปรก</th>
                            <th>น้ำ<br>มัน</th>
                            <th>ขาด</th>
                            <th>ปุ่ม<br>ปม</th>
                            <th>ตัว<br>หนอน</th>
                            <th>ลาย<br>ขวาง</th>
                            <th>บาร์โค๊ด<br>ลูกค้า</th>
                            <th>Batch</th>
                            <th>ตำหนิรวม</th>
                            <th>คะ<br>เเนน</th>
                            <th>Mark</th>
                         
                        </tr>
                    </thead>
                    <tbody>
                        
                    </tbody>
                </table>
            </div>
            
        </div>
        <hr>
        <div class="divFooter w-100">
            <div class="row ">
                <div class="col-6 ">
                    <div class="row">
                        <div class="col-6 text-center">
                            <label>จำนวนที่มารวม/จำนวนที่ได้รวม</label>
                            <hr>
                            <label>จำนวนที่มารวม :  <label id="sumqt"></label> <label id="UNIT1"></label></label>
                            <label>จำนวนที่ได้รวม :  <label id="sumaqt"></label> <label id="UNIT2"></label></label>
                            
                        </div>
                        <div class="col-6 text-center"> 
                            <label>สรุปผล</label>
                            <hr>
                            <label id="REMARKRM1"></label>
                            <br>
                            <label id="REMARKRM2"></label>
                            <br>
                            <label id="REMARKRM3"></label>
                        </div>
                    </div>
                    
                </div>
                <div class="col-3 text-center">
                    <label>น้ำหนัก KG/M</label>
                    <hr>
                    <label><label id="sumweight"></label></label>
                </div>
                <div class="col-3 text-start ">
                    <label>ชื่อผู้ตรวจ : <%=user%></label>
                    
                    <div class="text-start">
                        <label>ผู้รับผิดชอบ</label>
                        <p>จัดซื้อ : ........................</p>
                        <p>สต็อกวัตถุดิบ : ........................</p>
                        <p>เเผนกตัด : ........................</p>
                    </div>
                </div>
            </div>
            
        </div>
        <script>
            $(document).ready(function(){
              
                var queryString = window.location.search;
               
                var urlParams = new URLSearchParams(queryString);
                var mrno = urlParams.get('mrno');
                var pallet = urlParams.get('pallet');
                function today(){
                    var date = new Date();
                    var d =date.getDate()
                    var m = date.getMonth()+1;
                    var y = date.getFullYear();
                    var h = date.getHours();
                    var i = date.getMinutes()
                    var s = date.getSeconds();
                    if(m <10){
                        m = "0"+m;
                    }
                    if(i<10){
                        i = "0"+i;
                    }

                    if(d<10){
                        d = "0"+d;
                    }
                    var today = d+"/"+m+"/"+y+" "+h+":"+i+":"+s;
                    return today;
                }
                function today1(){
                    var date = new Date();
                    var d =date.getDate()
                    var m = date.getMonth()+1;
                    var y = date.getFullYear();
                    var h = date.getHours();
                    var i = date.getMinutes()
                    var s = date.getSeconds();
                    if(m <10){
                        m = "0"+m;
                    }
                    
                    if(d <10){
                        d = "0"+d;
                    }
                    var today = d+"/"+m+"/"+y;
                    return today;
                }
                
                function covertoday(date){
                    var coverdate =null;
                    
                    var y = date.substring(0, 4);
                    var m = date.substring(5, 7);
                    var d = date.substring(8, 10);
                    coverdate = d+"/"+m+"/"+y;
                      
                    return coverdate;
                }
                
              
                $("#today").text(today());
                $("#today1").text(today1());
                
                
                $('#mytable').DataTable({
                    searching: false,
                    paging: false,
                    info: false,
                    ajax: 'getdatawm?status=G16&mrno='+mrno+'&pallet='+pallet+''
                    
                });
    
                
                $.ajax({
                    type: "POST",
                    url: 'getdatawm?status=G16&mrno='+mrno+'&pallet='+pallet+'',
                    success: function(msg,status){
                        var de = $.parseJSON(msg);
                        console.log(de);
                        
                        
                        $("#PLANT").text(de.PLANT);
                        $("#ITEM").text(de.ITEM);
                        $("#PO").text(de.PO);
                        $("#DESC1").text(de.DESC1);
                        $("#DESC2").text(de.DESC2);
                        $("#DESC3").text(de.DESC3);
                        $("#INVOICEDATE").text(covertoday(de.INVOICEDATE));
                        $("#MRNO").text(de.MRNO);
                        $("#UNIT").text(de.UNIT);
                        $("#UNIT1").text(de.UNIT);
                        $("#UNIT2").text(de.UNIT);
                        $("#QCDATE").text(covertoday(de.QCDATE));
                        $("#REMARKRM1").text(de.REMARKRM1);
                        $("#REMARKRM2").text(de.REMARKRM2);
                        $("#REMARKRM3").text(de.REMARKRM3);
                        $("#SUPNAME").text(de.SUPNAME);
                        $("#INVOICE").text(de.INVOICE);
                        $("#PALET").text(de.PALET);
                        $("#sumqt").text(de.sumqt);
                        $("#sumaqt").text(de.sumaqt);
                        $("#sumweight").text(de.sumweight);
                       
                                  
                    }    
                });  
                
                // window.print();
            });
        </script>
        
        
    </body>
</html>
