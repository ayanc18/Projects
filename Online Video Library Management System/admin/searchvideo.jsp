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
<font color="white">SEARCH FORM</font></h2>
</td>
</tr>
<% 

String u=request.getParameter("vname");
ResultSet rs=stmt.executeQuery("select * from VideoTable where video='"+u+"'"); 
boolean chk=false;
while(rs.next())
{
chk=true;
break;
}
if(chk==false)
{

out.print("<tr><td><b><center>Video Does Not Exit</center></b></td></tr>");
}
else
{ 
out.print("<tr><td><b><center>video exist</center></b></td></tr>");
}
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