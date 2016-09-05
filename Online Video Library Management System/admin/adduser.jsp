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
<form name="addnewuser" method="post" action="addnewuser.jsp">
<table align="center">
<tr bgcolor="blue"><td colspan="2" align="center">
<h2>
<font color="white" >VIDEO Name</font></h2>
</td>
</tr>
<tr bgcolor="cyan">
<td> Video Name </td>
<td> <input type="text" name="video" > </input> </td>
</tr>
<tr bgcolor="cyan">
<td>  Video Type </td>
<td> <input type="text" name="videotype" > </input> </td>
</tr>
<tr bgcolor="cyan">
<td>  Video NO </td>
<td> <input type="text" name="qno" > </input> </td>
</tr>

<tr bgcolor="cyan"><td colspan="2" align="center">
<input type="submit" name="b1" value="Add"> </input>
<input type="reset" name="b2" value="Clear"> </input>
</td>
</tr>
</table>
</form>


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