<%-- 
    Document   : head
    Created on : 30 ก.ค. 2565, 8:21:49
    Author     : Gus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg bg-light fixed-top shadow ">
    <div class="container">
        <a class="navbar-brand" href="#">RM</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                
                <li class="nav-item"> 
                    <a class="nav-link " aria-current="page" href="home.jsp" id="page1">
                        <i class="bi bi-house-door-fill "></i>
                    หน้าเเรก</a>
                </li>
                
                <li class="nav-item dropdown ">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"  id="page2">
                        <i class="bi bi-list"></i> ผ้าถัก
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="table.jsp"><i class="bi bi-arrow-bar-down"></i> ดึงข้อมูลจาก SAP ด้วยเลขที่ PO</a></li>
                        <li><a class="dropdown-item" href="table2.jsp"><i class="bi bi-key"></i> คีย์ข้อมูลใบเเจ้งเข้าวัตถุดิบ</a></li>
                        <li><a class="dropdown-item" href="table1.jsp"><i class="bi bi-send"></i> ส่งข้อมูลให้ทาง QC</a></li>
                        <li><a class="dropdown-item" href="print.jsp"><i class="bi bi-printer"></i> พิมพ์ใบเเจ้งเข้าวัตถุดิบ</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown ">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"  id="page3">
                        <i class="bi bi-three-dots-vertical"></i> ควบคุม
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="table3.jsp"><i class="bi bi-keyboard"></i> โปรเเกรมคีย์เเละเเก้ไขข้อมูลใบ Invoice</a></li>
                        <li><a class="dropdown-item" href=""><i class="bi bi-trash"></i> โปรเเกรมลบข้อมูลตามเลขที่เอกสาร</a></li>
                        <li><a class="dropdown-item" href=""><i class="bi bi-bar-chart"></i> โปรเเกรมเเสดงข้อมูลตามเลขที่เอกสาร</a></li>
                        <li><a class="dropdown-item" href=""><i class="bi bi-printer"></i> โปรเเกรมเเสดงข้อมูลตามเลขที่ใบสั้งซื้อ (PO)</a></li>
                        
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp"><i class="bi bi-box-arrow-left"></i> Logout</a>
                </li>
            </ul>
            
        </div>
    </div>
</nav>

<br><br><br><br>
