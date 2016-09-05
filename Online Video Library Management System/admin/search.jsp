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
<form name="f" action="searchvideo.jsp" method="post">
<table align="center">
<tr bgcolor="blue"><td colspan="2" align="center">
<h2>
<font color="white" >SEARCH VIDEO</font></h2>
</td>
</tr>
<table border="1">
<tr bgcolor="cyan">
<td> 
Video Name
</td>
<td>
<input type="text" size="40" name="vname" />
</td>
</tr>

<tr>
<td colspan="2" align="center"> 
<input type="submit" value="search" />

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