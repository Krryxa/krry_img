<%@ page language="java" import="java.util.*,img.*" pageEncoding="utf-8"%>

<%
    String realPath = request.getRealPath("/");  //获取图片服务器的绝对路径
    String imagePath = request.getParameter("imagePath");
    //裁剪以后保存小图片的路径
    String fileName = new Date().getTime()+".jpg";
    String targetPath = realPath+"/img/"+fileName;
    
    //裁剪图片的地址
    String srcPath = realPath + imagePath;
    String x = request.getParameter("x");
    String y = request.getParameter("y");
    String w = request.getParameter("w");
    String h= request.getParameter("h");
    try{
         CutImgTool.cutImg(srcPath, targetPath, Integer.parseInt(x),  Integer.parseInt(y),  Integer.parseInt(w), Integer.parseInt(h));
         out.println("<img src='img/"+fileName+"'/>");
    }catch(Exception e){
         out.println("图片裁剪失败");
    }
 %>
