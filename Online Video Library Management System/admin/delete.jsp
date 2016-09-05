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
<font color="white">DELETE VIDEO</font></h2>
</td>
</tr>
<% 

String module=request.getParameter("module");
ResultSet rs=stmt.executeQuery("select * from VideoTable where  Video='"+module+"'");
String s="delete from VideoTable  where Video='"+module+"'"; 
stmt.executeUpdate(s);
out.print("<tr><td><b><center>Video deleted successfully</center></b></td></tr>");

%>

</table>
</td>
</tr>
</table>
<table width =100%>
<tr>
<td align="center">
<%@ include file="bottom.jsp" %>
</table>
</tr>
</html>