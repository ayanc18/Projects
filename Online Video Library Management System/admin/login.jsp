<html>
<script language="javascript">
function check()
{
if(document.f.uname.value=="")
{
alert("User Name Text should not be empty");
document.f.action="index.jsp";

}
if(document.f.upwd.value=="")
{
alert("Password Text should not be empty");
document.f.action="index.jsp";
}
}
</script>
 
<form name="f" action="home.jsp" method="post">
<table border="1">
<tr>
<td> 
User Name 
</td>
<td>
<input type="text" size="40" name="uname" />
</td>
</tr>
<tr>
<td> 
Password
</td>
<td>
<input type="password" size="40" name="upwd" />
</td>
</tr>
<tr>
<td colspan="2" align="center"> 
<input type="submit" value="Login" onclick="check();" />
<input type="reset" value="Clear" />
</td>
</tr>
</table>



</html>