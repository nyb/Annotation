<%@ page language="java" import="java.util.*,java.io.*" pageEncoding="gb2312"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'result.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html charset=gb2312">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <%@include file="header.jsp" %>
  <jsp:useBean id="fea" scope="page" class="AnnotationMatlab.Annotation" />
		<%
			//String s=new String(request.getParameter("check1").getBytes(
			//"ISO-8859-1"), "gb2312");
			//out.println(s);
			String im=new String(request.getParameter("image").getBytes(
					"ISO-8859-1"), "gb2312");
			//		out.println(im);
			String[] res = new String[20];
			int k = 0;
			for (int i = 1; i <= 10; i++) {
				String temp = "check" + i;
				String[] checkbox = request.getParameterValues(temp);
				if (checkbox != null) {
					res[k] = checkbox[0];
					k++;
				}
			}
			String ut = new String(request.getParameter("utag").getBytes(
					"ISO-8859-1"), "gb2312");
			if (ut != null) {
				String temp = "";
				for (int i = 0; i < ut.length(); i++) {
					if (ut.charAt(i) == ',') {
						res[k] = temp;
						k++;
						temp = "";
					} else {
						temp = temp + ut.charAt(i);
					}
				}
				res[k] = temp;
				k++;
			}
			int[] rt = new int[k];
			int nt = 0;
			
			List<String> h = new ArrayList();
			File file = new File("Final_Tag_List.txt");
			FileWriter writer = null;
			BufferedWriter bw = null;
			BufferedReader reader = null;
			try {
				reader = new BufferedReader(new FileReader(file));
				writer = new FileWriter("Final_Tag_List.txt", true);
				bw = new BufferedWriter(writer);
				String tempString = null;
				while ((tempString = reader.readLine()) != null) {
					h.add(tempString);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			for (int i = 0; i < k; i++) {
				if (h.contains(res[i])) {
					rt[i] = h.indexOf(res[i])+1;
				} else {
					bw.write(res[i]);
					bw.newLine();
					bw.flush();
					rt[i] = h.size() + 1;
					nt++;
				}
			}
			Object[] pa = new Object[2];
			pa[0] = nt;
			pa[1] = rt;
			fea.update(0, pa);
			try {
				bw.close();
				writer.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		%>
		<table>
		<tbody>
		<tr>
		<td>
		
		<img border="1" src=<%=im%>>
	
		</td>
		<td>
		<table align="left">
		<tbody>
		<tr>
		<font face="verdana">
			Annotation Results: 
		</font>
		</tr>
		<%
		for (int i = 0; i < k; i++) {
		%>
		<tr>
		
			<font face="verdana">
			<% out.print(res[i]+" ");%>
			</font>
	
		</tr>
		<%	} %>
		 </tbody>
		 
		 </table>
		
		
		</td>
		</tr>
		</tbody>
		</table>
		<a href="index.jsp" ><img border="0" src="back.png" height="30" width="80"></a>
	</body>
</html>
