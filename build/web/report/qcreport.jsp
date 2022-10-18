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
                            text: 'ม้วน\nที',
                            fontSize: 10
                        }, 
                        {
                            border: [true, true, true, true],  
                            text: 'หน้าผ้าที่วัดได้',
                            fontSize: 10
                        }, 
                        {
                            border: [true, true, true, true],  
                            text: 'สี',
                            fontSize: 10
                        },
                        {
                            border: [true, true, true, true],  
                            text:   'มาตรฐาน\nสี',
                            fontSize: 10
                        },  
                        {
                            border: [true, true, true, true],  
                            text:  'จำนวน\nที่มา',
                            fontSize: 10
                        },  
                        {
                            border: [true, true, true, true],  
                            text:   'จำนวน\nที่ได้',
                            fontSize: 10
                        },  
                        {
                            border: [true, true, true, true],  
                            text: 'จุดสี-น้ำมัน-สกปรก',
                            fontSize: 10
                        },  
                        {
                            border: [true, true, true, true],  
                            text: 'ลาย\nขวาง' ,
                            fontSize: 10
                        }, 
                        {
                            border: [true, true, true, true],  
                            text:    'ความ\nกว้าง',
                            fontSize: 10 
                        },  
                        {
                            border: [true, true, true, true],  
                            text:  'ปุ่ม\nปม' ,
                            fontSize: 10
                        },  
                        {
                            border: [true, true, true, true],  
                            text:  'เส้นด้าย\nขาด' ,
                            fontSize: 10
                        },  
                        {
                            border: [true, true, true, true],  
                            text: 'รอยด่าง' ,
                            fontSize: 10
                        }, 
                        {
                            border: [true, true, true, true],  
                            text:  'รอยเข็ม' ,
                            fontSize: 10
                        }, 
                        {
                            border: [true, true, true, true],  
                            text: 'รอยเข็มเข้าลึก' ,
                            fontSize: 10
                        }, 
                        {
                            border: [true, true, true, true],  
                            text: 'บาร์โค็ด\nร้านค้า' ,
                            fontSize: 10
                        }, 
                        {
                            border: [true, true, true, true],  
                            text: 'หม้อ\nย้อม' ,
                            fontSize: 10
                        }, 
                        {
                            border: [true, true, true, true],  
                            text:  'ตำหนิ\nรวม' ,
                            fontSize: 10
                        }, 
                        {
                            border: [true, true, true, true],  
                            text: 'คะเเนน',
                            fontSize: 10
                        },  
                        {
                            border: [true, true, true, true],  
                            text: 'M',
                            fontSize: 10
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
                                    ,color:'#1700FF',
                                    fontSize: 12
                                }, 
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][1]
                                    ,color:'#1700FF',
                                    fontSize: 12
                                }, 
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][2]
                                    ,color:'#1700FF',
                                    fontSize: 12
                                },
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][3]
                                    ,color:'#1700FF',
                                    fontSize: 12
                                },  
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][4]
                                    ,color:'#1700FF',
                                    fontSize: 12
                                },  
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][5]
                                    ,color:'#1700FF',
                                    fontSize: 12
                                },  
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][6]
                                    ,color:'#1700FF',
                                    fontSize: 12
                                },  
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][7] 
                                    ,color:'#1700FF',
                                    fontSize: 12
                                }, 
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][8] 
                                    ,color:'#1700FF',
                                    fontSize: 12
                                },  
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][9]
                                    ,color:'#1700FF',
                                    fontSize: 12
                                },  
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][10] 
                                    ,color:'#1700FF',
                                    fontSize: 12
                                },  
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][11]
                                    ,color:'#1700FF',
                                    fontSize: 12
                                }, 
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][12] 
                                    ,color:'#1700FF',
                                    fontSize: 12
                                }, 
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][13] 
                                    ,color:'#1700FF',
                                    fontSize: 12
                                }, 
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][14] 
                                    ,color:'#1700FF',
                                    fontSize: 12
                                }, 
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][15] 
                                    ,color:'#1700FF',
                                    fontSize: 12
                                }, 
                                {
                                    border: [false, false, true, true],  
                                    text:  de.data[x][16] 
                                    ,color:'#1700FF',
                                    fontSize: 12
                                }, 
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][17]
                                    ,color:'#1700FF',
                                    fontSize: 12
                                },  
                                {
                                    border: [false, false, true, true],  
                                    text: de.data[x][18]
                                    ,color:'#1700FF',
                                    fontSize: 12
                                }
                                            
                            ];
                        
                        }else{
                            arr = [
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][0]
                                    ,color:'#1700FF',bold:true
                                }, 
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][1]
                                    ,color:'#1700FF',bold:true
                                }, 
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][2]
                                    ,color:'#1700FF',bold:true
                                },
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][3]
                                    ,color:'#1700FF',bold:true
                                },  
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][4]
                                    ,color:'#1700FF',bold:true
                                },  
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][5]
                                    ,color:'#1700FF',bold:true
                                },  
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][6]
                                    ,color:'#1700FF',bold:true
                                },  
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][7] 
                                    ,color:'#1700FF',bold:true
                                }, 
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][8] 
                                    ,color:'#1700FF',bold:true
                                },  
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][9]
                                    ,color:'#1700FF',bold:true
                                },  
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][10] 
                                    ,color:'#1700FF',bold:true
                                },  
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][11]
                                    ,color:'#1700FF',bold:true
                                }, 
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][12] 
                                    ,color:'#1700FF',bold:true
                                }, 
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][13] 
                                    ,color:'#1700FF',bold:true
                                }, 
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][14] 
                                    ,color:'#1700FF',bold:true
                                }, 
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][15] 
                                    ,color:'#1700FF',bold:true
                                }, 
                                {
                                    border: [false, false, true, false],  
                                    text:  de.data[x][16] 
                                    ,color:'#1700FF',bold:true
                                }, 
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][17]
                                    ,color:'#1700FF',bold:true
                                },  
                                {
                                    border: [false, false, true, false],  
                                    text: de.data[x][18]
                                    ,color:'#1700FF',bold:true
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
                        pageMargins: [ 35, 150, 30, 130 ],
                       
                        footer: function(currentPage, pageCount) { 
                            return [
                                
                                {
                                    columns: [
                                        {
                                            width: '25%', 
                                            text: [{ text: 'จำนวนที่มา : ', bold:true },{ text: de.sumqt+' '+de.UNIT,color:'#1700FF',bold:true },{ text: '\nจำนวนที่ได้ : ', bold:true },{ text: de.sumaqt+' '+de.UNIT ,color:'#1700FF',bold:true}],
                                            fontSize: 12,
                                            alignment: 'center',
                                            margin: [40,20, 0, 0]
                                        },
                                        {
                                            width: '39%', 
                                            
                                            text: [
                                                { text: 'สรุปผล : \n', bold:true },
                                                { text: re1+'\n'+re2+'\n'+re3 ,color:'#1700FF',bold:true }
                                                
                                            ],
                                            
                                            fontSize: 12,
                                            alignment: 'left',
                                            margin: [0,10, 0, 0]
                               
                                        },
                                        {
                                            width: '12%', 
                                            text: [{ text: 'น้ำหนัก KG/M : \n', bold:true },{ text: de.sumweight ,color:'#1700FF',bold:true  }],
                                            fontSize: 12,
                                            alignment: 'center',
                                            margin: [0,20, 0, 0]
                               
                                        },
                                        {
                                            width: '25%', 
                                            text: [{ text: 'ชื่อผู้ตรวจสอบ : ', bold:true },{ text: de.BYNAME ,color:'#1700FF',bold:true  },{ text: '\nผู้รับผิดชอบ : ' ,bold:true  },{ text: de.BYNAME1,bold:true,color:'#1700FF'  },{ text: '\n  จัดซื้อ............................................\n สต็อกวัตถุดิบ................................\n เเผนกตัด.......................................\n',bold:true  }],
                                            fontSize: 12,
                                            alignment: 'left',
                                            margin: [0,10, 30, 0]
                                        }
                            
                                    ]
                                },
                                {
                                    text: 'FORM NO.FM-TWN-02/1 เเก้ไขครั้งที่ 01 อนุมัติใช้ 01/07/49', 
                                    bold:true ,
                                    absolutePosition: {x:150, y:80}
                                },
                            ]
                        },
                        header: function(currentPage, pageCount, pageSize) {
                            // you can apply any logic and return any valid pdfmake element
                            
                            return [
                                
                                {
                                    columns: [
                                        {
                                            width: '*',
                                            text: [{ text: 'สาขา : ', bold:true },{ text: de.PLANT ,color:'#1700FF',bold:true }],
                                            fontSize: 14,
                                            alignment: 'left',
                                            margin: [40,20, 0, 0]
                                             
                                        },
                                        {
                                            width: '*',
                                            text: 'บริษัท ไทยสปอร์ตการ์เมนต์ จำกัด \n ใบตรวจสอบผ้าถัก',
                                            fontSize: 17,
                                            alignment: 'center',
                                            bold:true,
                                            margin: [0,20, 0, 0]
                                        },
                                        {
                                            width: '*',
                                            text: [{ text: 'หน้า : ', bold:true },{ text: currentPage ,color:'#1700FF',bold:true  }],
                                            fontSize: 14,
                                            alignment: 'right',
                                            margin: [0,20, 40, 0]
                                        }
                            
                                    ]
                                },
                                {
                                    columns: [{
                                            width: 190,
                                            text: [{ text: 'รหัส : ', bold:true },{ text: de.ITEM ,color:'#1700FF',bold:true }],
                                            fontSize: 14,
                                            alignment: 'left',
                                            margin: [40,0, 0, 0]
                                        },
                                        {
                                            width: '*',
                                            text: [{ text: 'เลขที่ใบสั้งซื้อ : ', bold:true },{ text: de.PO ,color:'#1700FF',bold:true  }],
                                            fontSize: 14,
                                            alignment: 'center'
                                        },
                                        {
                                            width: '*',
                                            text: [{ text: 'เลขที่บิล : ', bold:true },{ text: de.INVOICE ,color:'#1700FF',bold:true  }],
                                            fontSize: 14,
                                            alignment: 'center'
                                        },
                                        {
                                            width: '*',
                                            text: [{ text: 'วันที่บิล : ', bold:true },{ text: covertoday(de.INVOICEDATE) ,color:'#1700FF',bold:true  }],
                                            fontSize: 14,
                                            alignment: 'right',
                                            margin: [0,0, 40, 0]
                                        }]
                                },
                                {
                                    columns: [{
                                            width: 500,
                                            text: [{ text: 'Description 1/หน้าผ้าที่สั่งซื้อ : ', bold:true },{ text: de.DESC1 ,color:'#1700FF',bold:true }],
                                            fontSize: 14,
                                            alignment: 'left',
                                            margin: [40,0, 0, 0]
                                        },
                            
                                        {
                                            width: '*',
                                            text: [{ text: 'พาเลต : ', bold:true },{ text: de.PALET,color:'#1700FF',bold:true  }],
                                            fontSize: 14,
                                            alignment: 'right',
                                            margin: [0,0, 40, 0]
                                            
                                        }]
                                }
                                ,{
                                    columns: [
                                        {
                                            width: '*',
                                            text: [{ text: 'Description 2 : ', bold:true },{ text: de.DESC2 ,color:'#1700FF',bold:true }],
                                            fontSize: 13,
                                            alignment: 'left',
                                            margin: [40,0, 0, 0]
                                        }, 
                                        {
                                            width: '*',
                                            text: [{ text: 'Description 3 : ', bold:true },{ text: de.DESC3,color:'#1700FF',bold:true }],
                                            fontSize: 13,
                                            alignment: 'right',
                                            margin: [0,0, 40, 0]
                                        }
                            
                                    ]
                                },
                                {
                                    columns: [{
                                            width: 'auto',
                                            text: [{ text: 'ร้านค้า : ', bold:true },{ text: de.SUPNAME ,color:'#1700FF',bold:true }],
                                            fontSize: 14,
                                            alignment: 'left',
                                            margin: [40,0, 0, 0]
                                        },
                                        {
                                            width: '*',
                                            text: [{ text: 'เลขที่เอกสาร : ', bold:true },{ text: de.MRNO,color:'#1700FF',bold:true  }],
                                            fontSize: 14,
                                            alignment: 'center'
                                        },
                                        {
                                            width: '*',
                                            text: [{ text: 'หน่วยนับ : ', bold:true },{ text: de.UNIT,color:'#1700FF',bold:true  }],
                                            fontSize: 14,
                                            alignment: 'center'
                                        },
                                        {
                                            width: '*',
                                            text: [{ text: 'วันที่ : ', bold:true },{ text: covertoday(de.QCDATE) ,color:'#1700FF',bold:true }],
                                        
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
                                        y: 20,
                                        w: 542,
                                        h: 750,
                                        r: 0,
                                        lineWidth: 1,
                                        lineColor: '#000000'
                                    },
                                    {
                                        type: 'rect',
                                        x: 35,
                                        y: 20,
                                        w: 542,
                                        h: 130,
                                        r: 0,
                                        lineWidth: 1,
                                        lineColor: '#000000'
                                    },
                                    {
                                        type: 'rect',
                                        x: 35,
                                        y: 670,
                                        w: 110,
                                        h: 100,
                                        r: 0,
                                        lineWidth: 1,
                                        lineColor: '#000000'
                                    },
                                    {
                                        type: 'rect',
                                        x: 145,
                                        y: 670,
                                        w: 0,
                                        h: 100,
                                        r: 0,
                                        lineWidth: 1,
                                        lineColor: '#000000'
                                    },
                                    {
                                        type: 'rect',
                                        x: 145,
                                        y: 670,
                                        w: 240,
                                        h: 100,
                                        r: 0,
                                        lineWidth: 1,
                                        lineColor: '#000000'
                                    },
                                    {
                                        type: 'rect',
                                        x: 385,
                                        y: 670,
                                        w: 65,
                                        h: 100,
                                        r: 0,
                                        lineWidth: 1,
                                        lineColor: '#000000'
                                    },
                                    {
                                        type: 'rect',
                                        x: 450,
                                        y: 670,
                                        w: 127,
                                        h: 100,
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
                                
                                table: {
                                    headerRows: 1,
                                    widths: [
                                        14, 
                                        19, 
                                        15, 
                                        16, 
                                        20, 
                                        20, 
                                        20, 
                                        15, 
                                        16, 
                                        10, 
                                        22, 
                                        12, 
                                        12, 
                                        20, 
                                        51, 
                                        49, 
                                        17, 
                                        21, 
                                        1],
                                    body: arr1
                                   
                                   
                                }
                            },
                            
                    
                        ],
                        styles: {
                            footer:{
                                margin: [0, 0, 0, 15]
                            },
                            tableExample: {
                                margin: [0, 0, 0, 0],
                                
                                alignment: 'center',
                                bold:true
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