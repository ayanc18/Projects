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
<td valign="top">

<%@ include file="menu.jsp" %>

</td>
<td valign="top">
<center>
<table width="100%" border="1">
<tr bgcolor="blue">
<td colspan="2" align="center">
<h2>
<font color="white">Question Creation Form </font></h2>
</td>
</tr>
<tr>
<td>
<form action="../servlet/saveQues" method="post">
Question No.
</td>
<td>

<%

/*
<select name="qno">
for(int x=1;x<=25;x++)
{
out.print("<option value=\""+x+"\">"+ x+"</option>");
}
</select>
*/

ResultSet rs=stmt.executeQuery("select * from VideoTable order by qno");
int qno=0;
while(rs.next())
{
qno=rs.getInt("qno");
}
qno++;
out.print(qno);

%>
<input type="hidden" name="qno" value=<%=qno%> ></input>

</td>
</tr>
<tr>
<td>
Question 
</td>
<td>
<textarea cols="80" rows="5" name="que"> </textarea>
</td>
</tr>
<tr>
<td>
Option A
</td>
<td>
<input type="text" name="a" size="105"> </input>
</td>
</tr>
<tr>
<td>
Option B
</td>
<td>
<input type="text" name="b" size="105"> </input>
</td>
</tr>
<tr>
<td>
Option C
</td>
<td>
<input type="text" name="c" size="105"> </input>
</td>
</tr>
<tr>
<td>
Option D
</td>
<td>
<input type="text" name="d" size="105"> </input>
</td>
</tr>
<tr>
<td>
Answer
</td>
<td>
<select name="ans">
<option value="A"> A </option>
<option value="B"> B </option>
<option value="C"> C </option>
<option value="D"> D </option>
</select>
</td>
</tr>
<tr>
<td colspan="2">
<center>
<input type="submit" name="b1" value="Save" onclick='alert("Question is added successfully into database")'> </input>
<input type="reset" name="b1" value="Clear"> </input>
</center>
</td>
</tr>
</table>
</td>
</tr>

</table>
</td>
</tr>
</form>
</table>
</center>
</td>
</tr>
<tr>
<td>
<%@ include file="bottom.jsp" %>
</td>
</tr>
</table>

</html>