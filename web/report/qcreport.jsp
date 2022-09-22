<%-- 
    Document   : index
    Created on : 5 ก.ย. 2565, 19:05:01
    Author     : Gus
--%>
<%@page import="java.sql.Connection" %>
<%@page import="java.util.Map" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.io.*" %>
<%@page import="net.sf.jasperreports.engine.JasperRunManager" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <script src="../js/pdfmake.min.js"></script>
        <script src="../js/vfs_fonts.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            String mrno = request.getParameter("mrno");
            String palet = request.getParameter("palet");
        %>
        <script>
            function covertoday(date){
                var coverdate =null;
                if(date == null){
                    coverdate = ''
                }else{
                    var y = date.substring(0, 4);
                    var m = date.substring(5, 7);
                    var d = date.substring(8, 10);
                    coverdate = d+"/"+m+"/"+y;
                }
                   
                return coverdate;
            }
            var a = <%=mrno%>
            var b = <%=palet%>
            
            $.ajax({
                type: "POST",
                url: '../getdatawm?status=G20&mrno='+a+'&pallet='+b,
                success: function(msg,status){
                    var de = $.parseJSON(msg);
                    var re1 = "";
                    var re2 = "";
                    var re3 = "";
                    if(de.REMARKRM1 == null){
                        re1 = "";
                    }else{
                        re1 = de.REMARKRM1;
                    }
                        
                    if(de.REMARKRM2 == null){
                        re2 = "";
                    }else{
                        re2 = de.REMARKRM2;
                    }
                    if(de.REMARKRM3 == null){
                        re3 = "";
                    }else{
                        re3 = de.REMARKRM3;
                    }
                   
        
        
                    var arr1 = [];
                    arr1[0] = [
                        {
                            border: [true, true, true, true],  
                            text: 'ม้วนที'
                        }, 
                        {
                            border: [true, true, true, true],  
                            text: 'หน้าผ้า\nที่วัดได้'
                        }, 
                        {
                            border: [true, true, true, true],  
                            text: 'สี'
                        },
                        {
                            border: [true, true, true, true],  
                            text:   'มาตรฐาน\nสี'
                        },  
                        {
                            border: [true, true, true, true],  
                            text:  'จำนวน\nที่มา'
                        },  
                        {
                            border: [true, true, true, true],  
                            text:   'จำนวน\nที่ได้'
                        },  
                        {
                            border: [true, true, true, true],  
                            text: 'จุดสี-น้ำมัน-สกปรก'
                        },  
                        {
                            border: [true, true, true, true],  
                            text: 'ลาย\nขวาง' 
                        }, 
                        {
                            border: [true, true, true, true],  
                            text:    'ความกว้าง\nไม่ได้\nมาตรฐาน' 
                        },  
                        {
                            border: [true, true, true, true],  
                            text:  'ปุ่ม\nปม' 
                        },  
                        {
                            border: [true, true, true, true],  
                            text:  'เส้นด้าย\nขาด' 
                        },  
                        {
                            border: [true, true, true, true],  
                            text: 'รอย\nด่าง' 
                        }, 
                        {
                            border: [true, true, true, true],  
                            text:  'รอย\nเข็ม' 
                        }, 
                        {
                            border: [true, true, true, true],  
                            text: 'รอยเข็ม\nเข้าลึก' 
                        }, 
                        {
                            border: [true, true, true, true],  
                            text: 'บาร์โค็ด\nร้านค้า' 
                        }, 
                        {
                            border: [true, true, true, true],  
                            text: 'หม้อ\nย้อม' 
                        }, 
                        {
                            border: [true, true, true, true],  
                            text:  'ตำหนิ\nรวม' 
                        }, 
                        {
                            border: [true, true, true, true],  
                            text: 'คะเเนน'
                        },  
                        {
                            border: [true, true, true, true],  
                            text: 'MARK'
                        }
                        
                        
                    ]
                    var arr = [];
                    var row = de.data.length;
                    var rowclose = row - 1;
                    for(var x =0; x<row; x++){
                        if(rowclose == x){
                            arr = [
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][0]
                                }, 
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][1]
                                }, 
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][2]
                                },
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][3]
                                },  
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][4]
                                },  
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][5]
                                },  
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][6]
                                },  
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][7] 
                                }, 
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][8] 
                                },  
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][9]
                                },  
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][10] 
                                },  
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][11]
                                }, 
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][12] 
                                }, 
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][13] 
                                }, 
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][14] 
                                }, 
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][15] 
                                }, 
                                {
                                    border: [false, false, true, true],  
                                    text:  de.data[x][16] 
                                }, 
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][17]
                                },  
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][18]
                                }
                                            
                            ];
                        
                        }else{
                            arr = [
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][0]
                                }, 
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][1]
                                }, 
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][2]
                                },
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][3]
                                },  
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][4]
                                },  
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][5]
                                },  
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][6]
                                },  
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][7] 
                                }, 
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][8] 
                                },  
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][9]
                                },  
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][10] 
                                },  
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][11]
                                }, 
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][12] 
                                }, 
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][13] 
                                }, 
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][14] 
                                }, 
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][15] 
                                }, 
                                {
                                    border: [false, false, true, false],  
                                    text:  de.data[x][16] 
                                }, 
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][17]
                                },  
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][18]
                                }
                                            
                            ];
                        }
                        
                        arr1[x+1] = arr ;
                        
                    }
                   
                    pdfMake.fonts = {
                        THSarabunNew: {
                            normal: 'THSarabunNew.ttf',
                            bold: 'THSarabunNew-Bold.ttf',
                            italics: 'THSarabunNew-Italic.ttf',
                            bolditalics: 'THSarabunNew-BoldItalic.ttf'
                        },
                        Roboto: {
                            normal: 'Roboto-Regular.ttf',
                            bold: 'Roboto-Medium.ttf',
                            italics: 'Roboto-Italic.ttf',
                            bolditalics: 'Roboto-MediumItalic.ttf'
                        }
                    }
                    
                    
                    var docDefinition = {
                        pageSize: {
                            width: 600,
                            height: 800
                        },
                        pageMargins: [ 35, 130, 30, 130 ],
                       
                        footer: function(currentPage, pageCount) { 
                            return [
                                
                                {
                                    columns: [
                                        {
                                            width: 'auto',
                                            text: 'จำนวนที่มา : '+de.sumqt+' '+de.UNIT+' \n จำนวนที่ได้ : '+de.sumaqt+' '+ de.UNIT,
                                            fontSize: 12,
                                            alignment: 'center',
                                            margin: [60,20, 0, 50]
                                        },
                                        {
                                            width: 'auto',
                                            text: 'สรุปผล \n  '+re1+'\n '+re2+'\n  '+re3+'\n FORM NO.FM-TWN-02/1 เเก้ไขครั้งที่ 01 อนุมัติใช้ 01/07/49',
                                            fontSize: 12,
                                            alignment: 'left',
                                            margin: [35,10, 0, 0]
                               
                                        },
                                        {
                                            width: '*',
                                            text: 'น้ำหนัก KG/M: \n '+de.sumweight,
                                            fontSize: 12,
                                            alignment: 'center',
                                            margin: [0,20, 0, 0]
                               
                                        },
                                        {
                                            width: 'auto',
                                            text: 'ชื่อผู้ตรวจสอบ : '+de.BYNAME+'\n ผู้รับผิดชอบ.................................\n จัดซื้อ.................................\n สต็อกวัตถุดิบ.................................\n เเผนกตัด.................................\n',
                                            fontSize: 12,
                                            alignment: 'left',
                                            margin: [0,10, 35, 50]
                                        }
                            
                                    ]
                                }
                            ]
                        },
                        header: function(currentPage, pageCount, pageSize) {
                            // you can apply any logic and return any valid pdfmake element
                            
                            return [
                                
                                {
                                    columns: [
                                        {
                                            width: '*',
                                            text: 'สาขา : '+ de.PLANT,
                                            fontSize: 14,
                                            alignment: 'left',
                                            margin: [40,10, 0, 0]
                                           
                                            
                                        },
                                        {
                                            width: '*',
                                            text: 'บริษัท ไทยสปอร์ตการ์เมนต์ จำกัด \n ใบตรวจสอบผ้าถัก',
                                            fontSize: 17,
                                            alignment: 'center',
                                            bold:true,
                                            margin: [0,10, 0, 0]
                                        },
                                        {
                                            width: '*',
                                            text: 'หน้า : '+currentPage,
                                            fontSize: 14,
                                            alignment: 'right',
                                            margin: [0,10, 40, 0]
                                        }
                            
                                    ]
                                },
                                {
                                    columns: [{
                                            width: '*',
                                            text: 'รหัส : ' + de.ITEM,
                                            fontSize: 14,
                                            alignment: 'left',
                                            margin: [40,0, 0, 0]
                                        },
                                        {
                                            width: '*',
                                            text: 'เลขที่ใบสั้งซื้อ : ' + de.PO,
                                            fontSize: 14,
                                            alignment: 'center'
                                        },
                                        {
                                            width: '*',
                                            text: 'เลขที่บิล : ' + de.INVOICE,
                                            fontSize: 14,
                                            alignment: 'center'
                                        },
                                        {
                                            width: '*',
                                            text: 'วันที่บิล : ' + covertoday(de.INVOICEDATE),
                                            fontSize: 14,
                                            alignment: 'right',
                                            margin: [0,0, 40, 0]
                                        }]
                                },
                                {
                                    columns: [{
                                            width: 'auto',
                                            text: 'Description 1/หน้าผ้าที่สั่งซื้อ : ' + de.DESC1,
                                            fontSize: 14,
                                            alignment: 'left',
                                            margin: [40,0, 0, 0]
                                        },
                            
                                        {
                                            width: '*',
                                            text: 'พาเลต : ' + de.PALET,
                                            fontSize: 14,
                                            alignment: 'right',
                                            margin: [0,0, 40, 0]
                                            
                                        }]
                                }
                                ,{
                                    columns: [
                                        {
                                            width: '*',
                                            text: 'Description 2 : ' + de.DESC2,
                                            fontSize: 14,
                                            alignment: 'left',
                                            margin: [40,0, 0, 0]
                                        }, 
                                        {
                                            width: '*',
                                            text: 'Description 3 : ' + de.DESC3,
                                            fontSize: 14,
                                            alignment: 'right',
                                            margin: [0,0, 40, 0]
                                        }
                            
                                    ]
                                },
                                {
                                    columns: [{
                                            width: 'auto',
                                            text: 'ร้านค้า : ' + de.SUPNAME,
                                            fontSize: 14,
                                            alignment: 'left',
                                            margin: [40,0, 0, 0]
                                        },
                                        {
                                            width: '*',
                                            text: 'เลขที่เอกสาร : ' + de.MRNO,
                                            fontSize: 14,
                                            alignment: 'center'
                                        },
                                        {
                                            width: '*',
                                            text: 'หน่วยนับ : ' + de.UNIT,
                                            fontSize: 14,
                                            alignment: 'center'
                                        },
                                        {
                                            width: '*',
                                            text: 'วันที่ : ' + covertoday(de.QCDATE),
                                            fontSize: 14,
                                            alignment: 'right',
                                            margin: [0,0, 40, 0]
                                        }]
                                },
                            ]
                        },
                        background: [
                            {
                                canvas: [
                                    {
                                        type: 'rect',
                                        x: 35,
                                        y: 5,
                                        w: 535,
                                        h: 775,
                                        r: 0,
                                        lineWidth: 1,
                                        lineColor: '#000000'
                                    },
                                    {
                                        type: 'rect',
                                        x: 35,
                                        y: 5,
                                        w: 535,
                                        h: 125,
                                        r: 0,
                                        lineWidth: 1,
                                        lineColor: '#000000'
                                    },
                                    {
                                        type: 'rect',
                                        x: 35,
                                        y: 665,
                                        w: 120,
                                        h: 115,
                                        r: 0,
                                        lineWidth: 1,
                                        lineColor: '#000000'
                                    },
                                    {
                                        type: 'rect',
                                        x: 155,
                                        y: 665,
                                        w: 0,
                                        h: 115,
                                        r: 0,
                                        lineWidth: 1,
                                        lineColor: '#000000'
                                    },
                                    {
                                        type: 'rect',
                                        x: 155,
                                        y: 665,
                                        w: 215,
                                        h: 115,
                                        r: 0,
                                        lineWidth: 1,
                                        lineColor: '#000000'
                                    },
                                    {
                                        type: 'rect',
                                        x: 370,
                                        y: 665,
                                        w: 80,
                                        h: 115,
                                        r: 0,
                                        lineWidth: 1,
                                        lineColor: '#000000'
                                    },
                                    {
                                        type: 'rect',
                                        x: 450,
                                        y: 665,
                                        w: 120,
                                        h: 115,
                                        r: 0,
                                        lineWidth: 1,
                                        lineColor: '#000000'
                                    },
                                ]
                            }
                            
                        ],
                        content: [
                            {
                                style: 'tableExample',
                                margin: [0, 0, 0, 0],
                                table: {
                                    widths: ['auto', 
                                        'auto', 
                                        'auto', 
                                        'auto', 
                                        'auto', 
                                        'auto', 
                                        'auto', 
                                        'auto', 
                                        'auto', 
                                        'auto', 
                                        'auto', 
                                        'auto', 
                                        'auto', 
                                        'auto', 
                                        'auto', 
                                        'auto', 
                                        'auto', 
                                        'auto', 
                                        'auto'],
                                    body: arr1
                                   
                                }
                            },
                            
                    
                        ],
                        styles: {
                            footer:{
                                margin: [0, 5, 0, 15]
                            },
                            tableExample: {
                                margin: [0, 5, 0, 15],
                                fontSize: 10,
                                alignment: 'center'
                            }
                    
                        },
                        defaultStyle: {
                            font: 'THSarabunNew'
                        }
                    };
                    pdfMake.createPdf(docDefinition).open({}, window); 
                
        
        
        
        
                }
            });
            
        </script>
    </body>
</html>