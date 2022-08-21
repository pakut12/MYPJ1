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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        
        body{
            height:5.5in;
            width:9in;                                 
        }
    </style>
    <body>
        <div class="h3 fw-bold">ใบเเจ้งเข้าวัตถุดิบ</div>
        
        <div class="row">
            <div  class="col-8 ">
                <label class="fw-bold">Name of Vendor : </label>
                <label>บริษัท โทเร เท็กซ์ไทล์ (ประเทศไทย)</label> 
            </div>
            
            <div  class="col-4">
                <label class="fw-bold">Documaent No. :</label>
                <label>902208002776</label> 
            </div>
        </div>
        <div class="row">
            <div  class="col-8 ">
                <label class="fw-bold">Po No. : </label>
                <label>4592200652  /20</label> 
            </div>
            
            <div  class="col-4 ">
                <label class="fw-bold">Pallet : </label>
                <label>39</label> 
            </div> 
        </div>
        <div class="row">
            <div  class="col-4 ">
                <label class="fw-bold">Current Date : </label>
                <label>15/8/2022 11:33:55</label> 
            </div>
            <div  class="col-4 ">
                <label class="fw-bold">วันที่ผ้าเข้า : </label>
                <label class="h3">11/8/2022</label> 
            </div>
            <div  class="col-4 ">
                <label class="fw-bold">Invoice No : </label>
                <label>193139</label> 
            </div> 
        </div>
        <div class="row">
            <div  class="col-8 ">
                <label class="fw-bold">Plant : </label>
                <label>9000</label> 
            </div>
            
            <div  class="col-4 ">
                <label class="fw-bold">Invoice date : </label>
                <label>11/8/2022</label> 
            </div> 
            
            
        </div>
        <div class="row">
            <div  class="col-8 ">
                <label class="fw-bold ">Materal : </label>
                <label class="h3">90BKL0174-DG65</label> 
            </div>
            
            <div  class="col-4 ">
                <label>20174EA POLY KNIT WD.66 C#92/DKCHARCOAL</label> 
            </div> 
            
        </div>
        <div class="row">
            <div  class="col-8 ">
                <label class="fw-bold">Lot : </label>
                <label></label> 
            </div>
            
            <div  class="col-4 ">
                <label class="fw-bold">Quantity : </label>
                <label class="h3">631</label> 
                <label>YD</label> 
            </div> 
            
        </div>
        
        <div class="row mt-2">
            <div  class="col-12 ">
                <table class="table table-bordered border-dark text-center">
                    <thead>
                        <tr>
                            <th>เบอร์สี</th>
                            <th>หน้า</th>
                            <th colspan="10">รายการ</th>
                            <th colspan="2"></th>
                        </tr>
                        <tr>
                            <th></th>
                            <th>กว้าง</th>
                            <th>1</th>
                            <th>2</th>
                            <th>3</th>
                            <th>4</th>
                            <th>5</th>
                            <th>6</th>
                            <th>7</th>
                            <th>8</th>
                            <th>9</th>
                            <th>10</th>
                            <th>YD</th>
                            <th>ม้วย</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>40</td>
                            <td>45</td>
                            <td>45</td>
                            <td>45</td>
                            <td>45</td>
                            <td>45</td>
                            <td>45</td>
                            <td>44</td>
                            <td>45</td>
                            <td>47</td>
                            <td>631</td>
                            <td>14</td>
                            
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>47</td>
                            <td>47</td>
                            <td>47</td>
                            <td>44</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            
                        </tr>
                        
                    </tbody>
                </table>
            </div>
            
        </div>
        <div class="row">
            <div  class="col-4 ">
                <label class="fw-bold">ผู้เเจ้งเข้า : </label>
                <label>.............................</label> 
            </div>
            <div  class="col-4 ">
                <label class="fw-bold">ผู้รับตรวจสอบ : </label>
                <label>.............................</label> 
            </div>
            <div  class="col-4 ">
                <label class="fw-bold">วันที่ตรวจเสร็จ : </label>
                <label>.............................</label> 
            </div> 
            
        </div>
        
        
        
        <script>
            $(document).ready(function(){
                window.print();
            });
        </script>
        
        
    </body>
</html>
