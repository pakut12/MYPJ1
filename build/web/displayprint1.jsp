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
        
               html,body{
                   
                   /*
                   border: solid black;
                   border-width: thin;
                   */
                   
               }
        
        
    </style>
    
    
    <body>
        
        <div class="container" id="main">
            <div class="row mb-3">
                <div class="col-3">
                    <div class="text-start"><b>สาขา :</b> 9000</div>
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
                    <div class="text-start"><b>รหัส :</b> 90BKL0174-DG65</div>
                </div>
                <div class="col-3 ">
                    <div class="text-start"><b>เลขที่ใบสั่งซื้อ :</b> 4592200652</div>
                </div>
                <div class="col-3 ">
                    <div class="text-end"><b>เลขที่บิล :</b> 193139</div>
                </div>
                <div class="col-3 ">
                    <div class="text-end"><b>วันที่บิล :</b> 23/7/2022</div>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-10">
                    <div class="text-start"><b>Description1/หน้าผ้าที่สั่งซื้อ :</b> 20174EA POLY KNIT WD.66 C#92/DKCHARCOAL</div>
                </div>
                <div class="col-2">
                    <div class="text-end"><b>พาเลต :</b> 125</div>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-6">
                    <div class="text-start"><b>Description2 :</b>  100% POLYESTER DOUBLE KNIT FABRIC KN M/</div>
                </div>
                <div class="col-6">
                    <div class="text-end"><b>Description3 :</b> C 22GG/34IN  YARN #100-36/150-48 WEIGHT</div>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-5">
                    <div class="text-start"><b>ร้านค้า :</b> บริษัท โทเร เท็กซ์ไทล์ (ประเทศไทย)</div>
                </div>
                <div class="col-3 ">
                    <div class="text-start"><b>เลขที่เอกสาร :</b> 902208002776</div>
                </div>
                <div class="col-2 ">
                    <div class="text-end"><b>หน่วยนับ :</b> YD</div>
                </div>
                <div class="col-2 ">
                    <div class="text-end"><b>วันที่ :</b> 26/8/2022</div>
                </div>
            </div>
        </div>
        <div class="row ">
            <div class="col-sm-12">
                <table class="table table-bordered border-dark text-center" id="mytable">
                    
                    <thead>
                        
                        <tr>
                            <th>ลำ<br>ดับ<br>ที่</th>
                            <th>หน้าผ้า<br>ที่วัดได้</th>
                            <th>สี</th>
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
                            <th>Mark</th>
                            <th>Mark</th>
                            <th>Mark</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%for (int n = 0; n < 40; n++) {%>
                        <tr>
                            <td><%=n + 1%></td>
                            <td>170</td>
                            <td>4.5</td>
                            <td>44</td>
                            <td>44</td>
                            <td>0</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>603104421</td>
                            <td>KH-602/25</td>
                            <td>1</td>
                            <td>*</td>
                            <td>*</td>
                            <td>*</td>
                            <td></td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
            
        </div>
        <hr>
        <div class="container">
            <div class="row ">
                <div class="col-6 ">
                    <div class="row">
                        <div class="col-6 text-center">
                            <label>จำนวนที่มารวม/จำนวนที่ได้รวม</label>
                            <hr>
                            <label>จำนวนที่มารวม : 12 YD</label>
                            <label>จำนวนที่ได้รวม : 12 YD</label>
                            
                        </div>
                        <div class="col-6 text-center"> 
                            <label>สรุปผล</label>
                            <hr>
                            <label>re1</label>
                            <br>
                            <label>re2</label>
                            <br>
                            <label>re3</label>
                        </div>
                    </div>
                    
                </div>
                <div class="col-3 text-center">
                    <label>น้ำหนัก KG/M</label>
                    <hr>
                    <label>0</label>
                </div>
                <div class="col-3 text-start ">
                    <label>ชื่อผู้ตรวจ : </label>
                    <hr>
                    <div class="text-start">
                        <label>ผู้รับผิดชอบ</label>
                        <br>
                        <label>จัดซื้อ : .......................................................</label>
                        <br>
                        <label>สต็อกวัตถุดิบ :  ..........................................</label>
                        <br>
                        <label>เเผนกตัด :  .................................................</label>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function(){
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
                $("#today").text(today());
                $("#today1").text(today1());
    
                $('#mytable').DataTable({
                    searching: false,
                    paging: false,
                    info: false,
                    "columnDefs": [
                        { "width": "1rem", "targets": 0 },
                        { "width": "1rem", "targets": 1 },
                        { "width": "1rem", "targets": 2 },
                        { "width": "1rem", "targets": 3 },
                        { "width": "1rem", "targets": 4 },
                        { "width": "1rem", "targets": 5 },
                        { "width": "1rem", "targets": 6 },
                        { "width": "1rem", "targets": 7 },
                        { "width": "1rem", "targets": 8 },
                        { "width": "1rem", "targets": 9 },
                        { "width": "1rem", "targets": 10 },
                        { "width": "1rem", "targets": 11},
                        { "width": "1rem", "targets": 12},
                        { "width": "1rem", "targets": 13},
                        { "width": "7rem", "targets": 14},
                        { "width": "1rem", "targets": 15},
                        { "width": "1rem", "targets": 16},
                        { "width": "1rem", "targets": 17},
                        { "width": "1rem", "targets": 18},
                      
                    ]
                  
                     
                });
    
                window.print();
                
            });
        </script>
        
        
    </body>
</html>
