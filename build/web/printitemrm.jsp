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
                <%
            String pt = "yyyy-MM-dd";
            SimpleDateFormat ft1 = new SimpleDateFormat(pt, Locale.ENGLISH);
            String d1 = ft1.format(new Date());



                %>
                <div class="col-sm-12 col-md-12">
                    <div id="pageview">
                        <div class="card shadow ">
                            <div class="card-header">
                                พิมพ์ใบเเจ้งเข้าวัตถุดิบ
                            </div>
                            <div class="card-body">
                                <form action="getdatawm?status=G10" method="post" name="myform" id="myform" class="needs-validation" novalidate target="_blank">
                                    <div class="row mb-3">
                                        <div class="col-sm-12 col-md-3">
                                            <label>เลขที่เอกสาร : </label>
                                            <input class="form-control form-control-sm" type="number" name="mrno" id="mrno" required></input>
                                            
                                        </div>
                                        <div class="col-sm-12 col-md-3">
                                            <label>รหัสวัตถุดิบ : </label>
                                            <input class="form-control form-control-sm" type="text" name="item" id="item" required></input>
                                            
                                        </div>
                                        <div class="col-sm-12 col-md-2 ">
                                            <button class="btn btn-sm btn-secondary mt-4 w-75" type="button" name="getpalet" id="getpalet"><i class="bi bi-download"></i> ดึงเลขที่พาเลท</button>
                                        </div>
                                        <div class="col-sm-12 col-md-2">
                                            <label>เลขที่พาเลท : </label>
                                            <select class="form-select form-select-sm" id="palet" name="palet">
                                                
                                            </select>
                                            
                                        </div>
                                        <div class="col-sm-12 col-md-2 ">
                                            <button class="btn btn-sm btn-secondary mt-4 w-75" type="button" name="getdata" id="getdata"><i class="bi bi-download"></i> ดึงข้อมูล</button>
                                        </div>
                                    </div>
                                    
                                    <div class="col-sm-12 col-md-12">
                                        <table class="table table-sm table-bordered  text-center" id="mytable"  >
                                            <thead>
                                                <tr>
                                                    <th class="text-center">ม้วนที่</th>
                                                    <th class="text-center">ความยาว(เมตร)</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                
                                            </tbody>
                                            
                                        </table> 
                                    </div>
                                    <div class="row mt-3 text-center">
                                        <div class="col-sm-12 col-md-3">
                                            <label>วันที่ผ้าเข้า</label>
                                            <input class="form-control form-control-sm text-center" type="date" name="today" id="today" value="<%=d1%>"></input>
                                        </div>
                                        <div class="col-sm-12 col-md-3">
                                            <label>เเถวทั้งหมด</label>
                                            <input class="form-control form-control-sm text-center" type="number" name="totalrow" id="totalrow" value="" readonly></input>
                                        </div>
                                        <div class="col-sm-12 col-md-3">
                                            <label>ความยาวทั้งหมด</label>
                                            <input class="form-control form-control-sm text-center" type="number" name="totallong" id="totallong" value="" readonly></input>
                                        </div>
                                        <div class="col-sm-12 col-md-3">
                                            <button class="btn btn-sm btn-success mt-4 w-75" type="submit" id="printout"><i class="bi bi-printer"></i> พิมพ์ใบเเจ้งเข้า</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        <script>
            $(document).ready(function () {
                $("#page2").addClass("active");
                $("#palet").addClass("disabled");
                $("#getdata").addClass("disabled");
        
                function getpalet(mrno,item){
                    $("#palet").empty();
                    $("#getdata").removeClass("disabled");
                    
                    var url = "getdatawm?status=G18";
                    var data = '&mrno='+mrno+'&item='+item;
                    $.ajax({
                        type: "POST",
                        url: url,
                        data:data,
                        success: function(msg,status){
                            var de = $.parseJSON(msg);
                            if(de.status == "true"){
                                Swal.fire({
                                    icon:"success",                    
                                    title:"ดึงเลขที่พาเลตสำเร็จ",
                                    text:"ดึงเลขที่พาเลตสำเร็จ" 
                                });
                                $.each(de.palet,function(k,v){
                                    $("#palet").append( "<option value='"+v+"'>"+v+"</option>" ); 
                                });
                            }else if(de.status == "false"){
                                Swal.fire({
                                    icon:"error",                    
                                    title:"ดึงเลขที่พาเลตไม่สำเร็จ",
                                    text:"ดึงเลขที่พาเลตไม่สำเร็จ" 
                                });
                            }
                            
                                  
                        }    
                    });
                     
                }
                var table;
                function getdatawmqck(mrno,item,palet){
                    var url = 'getdatawm?status=G9&mrno='+mrno+'&item='+item+'&palet='+palet;
                    table = $("#mytable").DataTable({
                        bDestroy: true,
                        ajax: url,
                        responsive: false,
                        scrollY: true ,
                        scrollX: false 
                                        
                    }); 
                    $.ajax({
                        type: "POST",
                        url: url,
                        success: function(msg,status){
                            var de = $.parseJSON(msg);
                            $("#totalrow").val(de.count);   
                            $("#totallong").val(de.sum);  
                            $("#today").val(de.INVOICEDATE); 
                            
                            if(mrno != "" && item != "" && palet != ""){
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
                    if(s<10){
                        s = "0"+s;
                    }
                    if(d<10){
                        d = "0"+d;
                    }
                    if(h<10){
                        h = "0"+h;
                    }
                    var today = y+"-"+m+"-"+d+"T"+h+":"+i+":"+s;
                   
                    return String(today);
                }
                // document.getElementById("today").value = today();
                //$("#today").val(today);
                getdatawmqck("", "", "");
                
                $("#printout").addClass("disabled");
                $("#getdata").click(function(){
                    var mrno = $("#mrno").val();
                    var item = $("#item").val();
                    var palet = $("#palet").val();
                    if(mrno == "" ||item == "" || palet == ""){
                        $("#myform").addClass("was-validated");
                        Swal.fire({
                            icon: 'error',
                            title: 'ข้อมูลไม่ถูกต้อง',
                            text: 'กรุณาใส่ข้อมูลให้ถูกต้อง'
                        })
                    }else{
                        $("#printout").removeClass("disabled");
                        getdatawmqck(mrno, item, palet);
                        
                    }
                    
                });
                $("#getpalet").click(function(){
                    var mrno = $("#mrno").val();
                    var item = $("#item").val();
                    getpalet(mrno, item);
                })
    
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
