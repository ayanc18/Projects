<html>
<table width="100%">
<tr>
<td>
<%@ include file="top.jsp" %>
</td>
</tr>
<tr>
<td>
<%
String u=request.getParameter("uname");
String p=request.getParameter("upwd");
ResultSet rs=stmt.executeQuery("select * from logintable where username='"+u+"' and userpwd='"+p+"' ");
boolean found=false;
if(rs.next())
{
found=true;
session.setAttribute("suname",u);
session.setAttribute("supwd",p);

}
if(found==true)
{
%>
<table>
<tr>
<td width="200">
<%@ include file="menu.jsp" %>
</td>
<td>
<%@ include file="welcome.jsp" %>
</td>
</tr>
</table>
</td>
</tr>
<%
}
else
{
out.print("<h1 align='center'><font color='red'> Invalid User name and Password, Unautherised user</font></h1>");

}
%>
<tr>
<td align="center">
<%@ include file="bottom.jsp" %>
</td>
</tr>
</html>