<%@ page language="java" import="java.util.*,img.*" pageEncoding="utf-8"%>
<!doctype html>
<html>
 <head>
  <meta charset="UTF-8">
  <title>Java开发高端图像裁剪技术 --krry</title>
  <style type="text/css">
    *{margin:0;padding:0;}
	.cut{margin:20px auto;width:600px;}
	.cut h1{text-align:center;}
	.cut input{margin-top:10px;outline:none;padding-left: 8px;}
	.cut .c_btn input{width: 100%;border:0;font-size: 16px;font-family: "微软雅黑";
	                  height:40px;background: #FD9412;color: #fff;margin-top: 10px;transition:1s;cursor:pointer;border-radius:15px;}
    .cut .c_btn input:hover{background:#c923c5;color:#000;transition:1s;}
    .cut .filename{width:136px;}
	
  </style>
  <link rel="stylesheet" href="css/jquery.Jcrop.css" type="text/css"/>
 </head>
 <body>
 <form action="cutSuccess.jsp" method="post">
   <div class="cut">
      <h1>Java开发高端图像裁剪技术</h1>
	  <div class="c_img">
	    <img id="cutImg" src="img/2.jpg" alt="krry" width="600"/>
	  </div>
	  <div>
	    <input type="text" name="imagePath" value="img/2.jpg" class="filename"/>
		X轴:<input type="text" size="4" id="x1" name="x"/>
		Y轴:<input type="text" size="4" id="y1" name="y"/>
		宽度:<input type="text" size="4" id="w" name="w"/>
		高度:<input type="text" size="4" id="h" name="h"/>
	  </div>
	  <div class="c_btn"><input type="submit" value="确 认 裁 剪"/></div>
   </div>  

   <script src="js/jquery.min.js"></script>
   <script src="js/jquery.Jcrop.min.js"></script>
   <script type="text/javascript">
      $(function(){
	     $("#cutImg").Jcrop({
		    onChange:showCoords,   //获取选中值
			onSelect:showCoords, //拖动的值
		 });
		 function showCoords(c){
		    $("#x1").val(parseInt(c.x));
			$("#y1").val(parseInt(c.y));
			$("#w").val(parseInt(c.w));
			$("#h").val(parseInt(c.h));
		   
		   }
	  });
   </script>
 </body>
</html>
