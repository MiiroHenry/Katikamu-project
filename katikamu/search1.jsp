<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "dbuser";
String userid = "root";
String password = "";
String regno=request.getParameter("regno");
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<head>
	<style type="text/css">
body{
	background-color: #FAFAFA;
}
.form-style-9{
	max-width: 950px;
	background: #FAFAFA;
	padding: 80px;
	margin: 50px auto;
	box-shadow: 1px 1px 25px rgba(0, 0, 0, 0.35);
	border-radius: 10px;
	border: 6px solid #305A72;
}
.form-style-9 ul{
	padding:0;
	margin:0;
	list-style:none;
}
.form-style-9 ul li{
	display: block;
	margin-bottom: 10px;
	min-height: 35px;
}
.form-style-9 ul li  .field-style{
	box-sizing: border-box; 
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box; 
	padding: 8px;
	outline: none;
	border: 1px solid #B0CFE0;
	-webkit-transition: all 0.30s ease-in-out;
	-moz-transition: all 0.30s ease-in-out;
	-ms-transition: all 0.30s ease-in-out;
	-o-transition: all 0.30s ease-in-out;

}.form-style-9 ul li  .field-style:focus{
	box-shadow: 0 0 5px #B0CFE0;
	border:1px solid #B0CFE0;
}
.form-style-9 ul li .field-split{
	width: 49%;
}
.form-style-9 ul li .field-full{
	width: 100%;
}
.form-style-9 ul li input.align-left{
	float:left;
}
.form-style-9 ul li input.align-right{
	float:right;
}
.form-style-9 ul li textarea{
	width: 100%;
	height: 100px;
}
.form-style-9 ul li input[type="button"], 
.form-style-9 ul li input[type="submit"] {
	-moz-box-shadow: inset 0px 1px 0px 0px #3985B1;
	-webkit-box-shadow: inset 0px 1px 0px 0px #3985B1;
	box-shadow: inset 0px 1px 0px 0px #3985B1;
	background-color: #216288;
	border: 1px solid #17445E;
	display: inline-block;
	cursor: pointer;
	color: #FFFFFF;
	padding: 8px 18px;
	text-decoration: none;
	font: 12px Arial, Helvetica, sans-serif;
}
.form-style-9 ul li input[type="button"]:hover, 
.form-style-9 ul li input[type="submit"]:hover {
	background: linear-gradient(to bottom, #2D77A2 5%, #337DA8 100%);
	background-color: #28739E;
}
	.design{
 font-family: Georgia, serif;font-size: 18px;font-weight: bold;color: #FFF8DC;letter-spacing: 1.4px;border-bottom: solid 0px #006600;
	}
	.flex-container {
  display: flex;
  flex-wrap: nowrap;
  
  border-radius: 50px
}

.flex-container > div {
  /*background-color: rgb(128,128,128);*/ 
  width: 100px;
  margin: 10px;
  text-align: center;
  line-height: 15px;
  font-size: 30px;
}
</style>
<script>
function myFunction() {
  window.print();
}
</script>
</head>
<body>
<form class="form-style-9" method="post" onsubmit="return validate();" style="border-radius: 50px;" onclick="window.print();">
<h1 style="border-radius: 50px; padding: 5px;font-family: Georgia, serif;font-size: 15px;font-weight: bold;color: #2F4F4F;"align="center"> KATIKAMU <img src="photo1.jpg" alt="Image" height="50" width="150"> PRIMARY SCHOOL <br>Filter data</h1>
<table border="1" style="width: 50%;" align="center">
<tr style="border-radius: 50px">
<td>Firstname</td>
<td>Lastname</td>
<td>RegNumber.</td>
<td>Gender</td>
<td>Age</td>
<td>Subject</td>
<td>ClassName</td>
<!--<td>Action</td>-->
</tr>
</form>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from student2 where regno="+regno+"' ";
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
i++;
%>
<tr>
<td><%=resultSet.getString("firstname") %></td>
<td><%=resultSet.getString("lastname") %></td>
<td><%=resultSet.getString("regno") %></td>
<td><%=resultSet.getString("gender") %></td>
<td><%=resultSet.getString("age") %></td>
<td><%=resultSet.getString("subject") %></td>
<td><%=resultSet.getString("class_name") %></td>
</tr>

<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>

</html>

