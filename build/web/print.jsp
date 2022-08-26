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
                <div class="col-9">
                    <div id="pageview">
                        <div class="card shadow ">
                            <div class="card-header">
                                พิมพ์ใบเเจ้งเข้าวัตถุดิบ
                            </div>
                            <div class="card-body">
                                <form action="print" method="post" name="myform" class="needs-validation" novalidate target="_blank">
                                    <div class="row mb-3">
                                        <div class="col-3">
                                            <label>เลขที่เอกสาร : </label>
                                            <input class="form-control form-control-sm" type="number" name="mrno" id="mrno" required></input>
                                            
                                        </div>
                                        <div class="col-3">
                                            <label>รหัสวัตถุดิบ : </label>
                                            <input class="form-control form-control-sm" type="text" name="item" id="item" required></input>
                                            
                                        </div>
                                        <div class="col-3">
                                            <label>เลขที่พาเลท : </label>
                                            <input class="form-control form-control-sm" type="number" name="palet" id="palet" required></input>
                                            
                                        </div>
                                        <div class="col-3">
                                            <button class="btn btn-sm btn-success mt-4 w-75" type="button" name="getdata" id="getdata">ดึงข้อมูล</button>
                                        </div>
                                    </div>
                                    
                                    <div class="col-auto">
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
                                        <div class="col-3">
                                            <label>วันที่ผ้าเข้า</label>
                                            <input class="form-control form-control-sm text-center" type="date" name="today" id="today" value="" readonly></input>
                                        </div>
                                        <div class="col-3">
                                            <label>เเถวทั้งหมด</label>
                                            <input class="form-control form-control-sm text-center" type="number" name="totalrow" id="totalrow" value="" readonly></input>
                                        </div>
                                        <div class="col-3">
                                            <label>ความยาวทั้งหมด</label>
                                            <input class="form-control form-control-sm text-center" type="number" name="totallong" id="totallong" value="" readonly></input>
                                        </div>
                                        <div class="col-3">
                                            <button class="btn btn-sm btn-success mt-4 w-75" type="submit">พิมพ์ใบเเจ้งเข้า</button>
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
           
                var table;
                function getdatawmqck(mrno,item,palet){
                    table = $("#mytable").DataTable({
                        bDestroy: true,
                        ajax: 'getdatawm?status=G9&mrno='+mrno+'&item='+item+'&palet='+palet,
                        responsive: false,
                        scrollY: true ,
                        scrollX: false 
                                        
                    }); 
                    $.ajax({
                        type: "POST",
                        url: 'getdatawm?status=G9&mrno='+mrno+'&item='+item+'&palet='+palet,
                        success: function(msg,status){
                            var de = $.parseJSON(msg);
                            $("#totalrow").val(de.count);   
                            $("#totallong").val(de.sum);   
                            console.log(de.count);        
                        }    
                    });                    
                }
                function today(){
                    var date = new Date();
                    var d =date.getDate()
                    var m = date.getMonth();
                    var y = date.getFullYear();
                    if(m <10){
                        m = "0"+m;
                    }
                    var today = y+"-"+m+"-"+d;
                    return today;
                }
                $("#today").val(today);
                getdatawmqck("", "", "");
                
             
                $("#getdata").click(function(){
                    var mrno = $("#mrno").val();
                    var item = $("#item").val();
                    var palet = $("#palet").val();
                    if(mrno == "" ||item == "" || palet == ""){
                        Swal.fire({
                            icon: 'error',
                            title: 'ข้อมูลไม่ถูกต้อง',
                            text: 'กรุณาใส่ข้อมูลให้ถูกต้อง'
                        })
                    }else{
                        getdatawmqck(mrno, item, palet);
                        
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
        <%@ include file="share/footer.jsp" %>
        
    </body>
</html>
