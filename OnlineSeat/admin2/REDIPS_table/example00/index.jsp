<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.io.*,java.text.*,java.util.*,javax.swing.*,java.awt.event.*,org.w3c.dom.Document,org.w3c.dom.*,javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.DocumentBuilder,org.xml.sax.SAXException,org.xml.sax.SAXParseException" errorPage="" %>
<!DOCTYPE html PUBLIC >
<html>
	<head>
		<meta name="author" content="Ayan Chandra"/>
		<meta name="description" content="Seat Layout using JavaScript"/>
		<meta name="viewport" content="width=device-width, user-scalable=no"/><!-- "position: fixed" fix for Android 2.2+ -->
		<link rel="stylesheet" href="style.css" type="text/css" media="screen" />
		<script type="text/javascript" src="../header.js"></script>
		<script type="text/javascript" src="../redips-table-min.js"></script>
		<script type="text/javascript" src="script.js"></script>
		<title>Seat Layout</title>
	</head>
	<body>
		<%if(request.getParameter("submit")==null)
	{%>

		<!-- container -->
		<div id="myContainer">
			<!-- toolbox -->
			<table id="toolbox" width="98%" align=center>
				<tbody>
					<tr>
						<td>
							<input type="button" value="Merge" class="button" onclick="redips.merge()" title="Merge marked table cells horizontally and verically"/>
						</td>
						<td>
							<input type="button" value="Split Vertically" class="button" onclick="redips.split('h')" title="Split marked table cell horizontally"/>
							<input type="button" value="Split Horizontally" class="button" onclick="redips.split('v')" title="Split marked table cell vertically"/>
						</td>
						<td>
							<input type="button" value="Add Row" class="button" onclick="redips.row('insert')" title="Add table row"/>
							<input type="button" value="Delete Row" class="button" onclick="redips.row('delete')" title="Delete table row"/>
						</td>
						<td>
							<input type="button" value="Add Column" class="button" onclick="redips.column('insert')" title="Add table column"/>
							<input type="button" value="Delete Column" class="button" onclick="redips.column('delete')" title="Delete table column"/>
						</td>
					</tr>
				</tbody>
			</table>
			
			<!-- main table -->
						<form method="post" action="">
				<table id="mainTable">
				<tbody>
				<%
				for(int rows=0;rows<5;rows++)
				{
					out.println("<tr>");
					for(int cols=0;cols<10;cols++)
					{
						out.println("<td></td>");
					}
					out.println("</tr>");
				}
				%>
				</tbody>
			</table>

			<center><input type="submit" name=submit></center>
			</form>

		</div>
		<%}%>
					
<%
			

			if(request.getParameter("submit")!=null)
			{
				%>
				<table border=1 cellpadding=5 cellspacing=0 width="80%">
				<%
			int rowspan=1,colspan=1,seatnumber=0;;
			String rowspanStr="",colspanStr="";
			int Xpos=0,Ypos=0;
			ArrayList seatNames=new ArrayList();
			ArrayList seatLayout=new ArrayList();
String psTr="";
				for(int j=0;j<10;j++)
				{
					out.println("<tr>");
					for(int k=0;k<10;k++)
					{
						Xpos=j;
						Ypos=k;
						if(request.getParameter("sptype"+j+k)!=null)
						{
							String sptype=request.getParameter("sptype"+j+k);
							colspan=1;
							rowspan=1;
							rowspanStr="";
							colspanStr="";
							seatnumber++;
							if(sptype.equals("H"))
							{
								for(int c=(k+1);c<10;c++)
								{
									if(request.getParameter("seatname"+j+c)==null)
									{
											colspan++;
									}
										else
											break;
									
								}
								colspanStr="colspan="+colspan;
							}
							if(sptype.equals("V"))
							{
								for(int c=(j+1);c<10;c++)
								{
									//psTr+="  "+c+(k+1);
									if(request.getParameter("seatname"+c+k)==null)
									{
											rowspan++;
									}
										else
											break;
									
								}
								rowspanStr="rowspan="+rowspan;
							}


							out.println("<td "+rowspanStr+" "+colspanStr+" align=center><input type=\"text\" name=\"stype\" value=\"{"+sptype+request.getParameter("seatname"+j+k)+"}\">");
							//out.println("{"+seatnumber+","+Xpos+","+Ypos+","+colspan+","+rowspan+"}");
							out.println("</td>");
							seatLayout.add("{"+seatnumber+","+Xpos+","+Ypos+","+colspan+","+rowspan+"}");
				
						}
						

					}
					out.println("</tr>");
				}



String SeatNameArray="";
if(seatNames.size()>0)
{
	SeatNameArray="{"+seatNames.get(0);
		for(int jk=0;jk<seatNames.size();jk++)
		{
			SeatNameArray=SeatNameArray+","+seatNames.get(jk);
		}
	SeatNameArray=SeatNameArray+"}";
}
//out.println(SeatNameArray);


String SeatLayoutArray="";
if(seatLayout.size()>0)
{
	SeatLayoutArray="{"+seatLayout.get(0);
		for(int jk=0;jk<seatLayout.size();jk++)
		{
			SeatLayoutArray=SeatLayoutArray+","+seatLayout.get(jk);
		}
	SeatLayoutArray=SeatLayoutArray+"}";
}
//out.println(SeatLayoutArray);



			}
			%>
			</table><br><br><br><br>
	</body>
</html>