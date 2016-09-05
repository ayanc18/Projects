<html>
<table width="100%">
<tr>
<td>
<%@ include file="top.jsp" %>
</td>
</tr>
<table>
<tr>
<td align="left" width="15%">

<%@ include file="menu.jsp" %>
</td>
<td width="85%" align="center">
<form name="delete" method="post" action="delete.jsp">
<table align="center">
<tr bgcolor="blue"><td colspan="2" align="center">
<h2>
<font color="white" >DELETE VIDEO</font></h2>
</td>
</tr>
<tr>
<td>
Choose Video to delete
</td>
<td>
<select name="module">
<%
ResultSet rs=stmt.executeQuery("select * from VideoTable");
while(rs.next())
{
out.print("<option value='"+rs.getString("Video")+"'>"+rs.getString("Video")+"</option>");
} 
%>
</select>
</td>
</tr>
<tr bgcolor="cyan"><td colspan="2" align="center">
<input type="submit" name="b1" value="Delete"> </input>
<input type="reset" name="b2" value="Clear"> </input>
</td>
</tr>
</table>
</form>
<table width =100%>
<tr>
<td align="center">
<%@ include file="bottom.jsp" %>
</td>
</table>
</tr>
</html>
