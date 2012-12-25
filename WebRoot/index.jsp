<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  <center>
  <img border="0" src="logo.jpg" title="Automatic Personalized Image Annotation">
  <br>
  <font size="-1" color="#888888">Automatic Personalized Image Annotation
  </font>
  <table border="0" cellspacing="10" cellpadding="10">
   <tbody>
   <tr>
  <td align="center" bgcolor="#EEEEEE">
  <form action="doupload.jsp" method="post">
  <font face="ARIAL" size="-1" color="#888888">
  Image Upload
  <input type="file" size="35" name="upfile">
  <input type="submit" value="APIA it!" >
  </font>
  </form>
  </td>
   </tr>  
   </tbody>
   </table>  
  <br>
   
  </center>
  </body>
</html>
