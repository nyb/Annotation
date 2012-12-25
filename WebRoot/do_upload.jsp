<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<%@page import="com.jspsmart.upload.*, com.mathworks.toolbox.javabuilder.*, AnnotationMatlab.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>File Upload</title>
</head>
<body>
<jsp:useBean id="smart" scope="page" class="com.jspsmart.upload.SmartUpload"/>
<%
	
	smart.initialize(pageContext);
	out.println(smart.getCharset());
	smart.upload();
	//smart.save("D:\\实验数据集\\111_31626\\111");
	String photo = smart.getRequest().getParameter("upfile");
	out.println(photo);
/*	String filename = photo.substring(photo.lastIndexOf("\\") + 1,
			photo.length());
	ExtractFeature e = new ExtractFeature(); */
%>

</body>
</html>