<%@page language="java" import="java.sql.*" %>
<html>
<style>
.one
{
font-family:Monotype Corsiva;
font-size:100pt;
color:blue;
}
.two
{
font-family:verdana;
font-size:60pt;
color:maroon;

}

</style>
<table>
<tr>
<td> 
</td>
<td align="center"> 
<span class="one">O</span><span class="two">n</span> <span class="one">L</span> <span class="two">ine</span> <span class="one">V</span><span class="two">ideo</span> <span class="one">S</span><span class="two">ystem</span>
</td>
</tr>
</table>
<% 
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("jdbc:odbc:onlinedb1");
Statement stmt=con.createStatement();
stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);

%>
</html>