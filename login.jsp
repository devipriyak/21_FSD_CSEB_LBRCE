<%@page import="java.sql.*"%>
<%
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@ntsocietyserver:1521:oralbrce","scott","tiger");
String un=request.getParameter("t1");
String ps=request.getParameter("t2");
PreparedStatement st=con.prepareStatement("select * from login where username=? and password=?");
st.setString(1,un);
st.setString(2,ps);
ResultSet rs=st.executeQuery();
int x=0;
while(rs.next())
{
x++;
%>
<jsp:forward page="Success.jsp"/>
<%
}
if(x==0)
{
out.println("Invalid User Details");
%>
<jsp:include page="login.html"/>
<%
}
}
catch(Exception e)



{
System.out.println(e);
}
%>