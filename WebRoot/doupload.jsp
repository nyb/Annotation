<%@ page language="java"
	import="java.util.*,java.io.*,com.mathworks.toolbox.javabuilder.*,AnnotationMatlab.*"
	contentType="text/html; charset=gb2312" pageEncoding="gb2312"%>
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

		<title>My JSP 'doupload.jsp' starting page</title>

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
			String photo = new String(request.getParameter("upfile").getBytes(
					"ISO-8859-1"), "gb2312");//获取file控件里的路径（绝对路径）
			/*得到图片名称*/
			String filename = photo.substring(photo.lastIndexOf("\\") + 1,
					photo.length());
			//	out.print(photo + "<br>");//输出验证

			Object[] res = fea.Pannotation(10, photo);
			String[] t = new String[10];
			for (int i = 0; i < 10; i++) {
				String temp = res[i].toString();
				int l = temp.length();
				t[i] = temp.substring(1, l - 1);
			}
			// out.print(t[1]);
			//out.print("end");
		%>
		<table cellpadding="15">
			<tbody>
				<tr>
					<td>
						<img border="1" src=<%=photo%> height="200" width="200">
					</td>
					<td>
						<table cellpadding="5" width="600">
							<tbody>
								<tr>
									<td align="left" bgcolor="#AACC55">
										<form action="result.jsp" method="post">
											<font color="#CE0000">Top 10 Computer-Predicted Tags</font>
											<br>
											<font size="-1" color="#555555"> APIR is like a child trying to learn about the world. Please help us to
												teach APIA. Check those correctly annotated words.</font>
											<br>
											<table border="0" cellpadding="5">
												<tbody>
													<tr align="left">
														<td align="left" rowspan="1">
															<label for="e1">
																<font color="#0000CE"> <input type="checkbox"
																		name="check1" id="e1" value=<%=t[0]%>> <%=t[0]%> </font>
															</label>
														</td>
														<td align="left" rowspan="1">
															<label for="e2">
																<font color="#0000CE"> <input type="checkbox"
																		name="check2" id="e2" value=<%=t[1]%>> <%=t[1]%> </font>
															</label>
														</td>
														<td align="left" rowspan="1">
															<label for="e3">
																<font color="#0000CE"> <input type="checkbox"
																		name="check3" id="e3" value=<%=t[2]%>> <%=t[2]%> </font>
															</label>
														</td>
														<td align="left" rowspan="1">
															<label for="e4">
																<font color="#0000CE"> <input type="checkbox"
																		name="check4" id="e4" value=<%=t[3]%>> <%=t[3]%> </font>
															</label>
														</td>
														<td align="left" rowspan="1">
															<label for="e5">
																<font color="#0000CE"> <input type="checkbox"
																		name="check5" id="e5" value=<%=t[4]%>> <%=t[4]%> </font>
															</label>
														</td>
													</tr>
													<tr align="left" >
														<td align="left" rowspan="1">
															<label for="e6">
																<font color="#0000CE"> <input type="checkbox"
																		name="check6" id="e6" value=<%=t[5]%>> <%=t[5]%> </font>
															</label>
														</td>
														<td align="left" rowspan="1">
															<label for="e7">
																<font color="#0000CE"> <input type="checkbox"
																		name="check7" id="e7" value=<%=t[6]%>> <%=t[6]%> </font>
															</label>
														</td>
														<td align="left" rowspan="1">
															<label for="e8">
																<font color="#0000CE"> <input type="checkbox"
																		name="check8" id="e8" value=<%=t[7]%>> <%=t[7]%> </font>
															</label>
														</td>
														<td align="left" rowspan="1">
															<label for="e9">
																<font color="#0000CE"> <input type="checkbox"
																		name="check9" id="e9" value=<%=t[8]%>> <%=t[8]%> </font>
															</label>
														</td>
														<td align="left" rowspan="1">
															<label for="e10">
																<font color="#0000CE"> <input type="checkbox"
																		name="check10" id="e10" value=<%=t[9]%>> <%=t[9]%> </font>
															</label>
														</td>
													</tr>
												</tbody>
											</table>
											<font size="-1">
											Thought of other terms missed by APIR? Please add here, separated by commas ','
											</font>
											<br>
											<input type="text" name="utag" size="30" maxlength="50">
											<input type="submit" value="submit">
											<input type="hidden" name="image" value=<%=photo %>>
										</form>
				                 </td>       
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>

	</body>
</html>
