<html>
<table width="100%">
<tr>
<td>
<%@ include file="top.jsp" %>
</td>
</tr>
<tr>
<td>
<table>
<tr>
<td align="left" width="15%">
<%@ include file="menu.jsp" %>
</td>
<td width="85%" align="center">
<table align="center" border="1">
<tr bgcolor="blue"><td colspan="2">
<h2>
<font color="white">Save Video Form</font></h2>
</td>
</tr>
<% 

String u1=request.getParameter("video");
String p1=request.getParameter("videotype");
String qno=request.getParameter("qno");



String sql="insert into VideoTable values('"+u1+"','"+p1+"','"+qno+"')";
stmt.executeUpdate(sql);
out.print("<tr><td><b><center>Video added successfully</center></b></td></tr>");


%>

</table>
</td>
</tr>
</table>
</td>
</tr>
<table width =100%>
<tr>
<td align="center">
<%@ include file="bottom.jsp" %>
</td>
</table>
</tr>
</html>