<%@ page import="java.sql.*" %>  
<%@ page import="enc.Encrypt" %>
<%
try
{
    Class.forName("com.mysql.jdbc.Driver"); //load driver
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser","root",""); //create connection
    
    if(request.getParameter("btn_register")!=null) //check register button click event not null
    {
		String carnumber,bossname,bossphonenumber,amount,bosslocation,pricesold,balance,date,storenumber;
		
		carnumber=request.getParameter("car_number"); //car_number
		bossname=request.getParameter("boss_name"); //boss_name
		bossphonenumber=request.getParameter("boss_phonenumber");//boss_phonenumber
		amount=request.getParameter("a_amount");//a_amount
		bosslocation=request.getParameter("boss_location");//boss_location
		pricesold=request.getParameter("price_sold"); //price_sold
		balance=request.getParameter("b_balance"); //b_balance
        date=request.getParameter("d_date"); //d_date 
        storenumber=request.getParameter("store_number"); //store_number
		
		PreparedStatement pstmt=null; //create statement
		
		pstmt=con.prepareStatement("insert into login(carnumber,bossname,bossphonenumber,amount,bosslocation,pricesold,balance,date,storenumber) values(?,?,?,?,?,?,?,?,?)"); //sql insert query
		pstmt.setString(1,carnumber);
		pstmt.setString(2,bossname);
		pstmt.setString(3,bossphonenumber);
		pstmt.setString(4,amount);
		pstmt.setString(5,bosslocation);
		pstmt.setString(6,pricesold);
		pstmt.setString(7,balance);
		pstmt.setString(8,date);
		pstmt.setString(7,storenumber);

		pstmt.executeUpdate(); //execute query
		
		request.setAttribute("successMsg","Sales added Successfully...! Please login to view details"); //sales added success messeage

		con.close(); //close connection
	}
}
catch(Exception e)
{
	out.println(e);
}
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>New Employee</title>

<style type="text/css">
body{
	background: skyblue;
}
.form-style-9{
	max-width: 450px;
	background: #FAFAFA;
	padding: 30px;
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

</style>
</head>
<body>
<table border="1" style="border-radius:50px; width: 70%" align="center" height="50">
	<th style="border-radius:50px;"> Add New Employee</th>
</table>
<form class="form-style-9">
<ul>
<li>
    <input type="text" name="car_number" class="field-style field-split align-left" placeholder="EmployeeName" />
    <input type="text" name="boss_name" class="field-style field-split align-right" placeholder="Birth Area" />
    <input type="text" name="boss_phonenumber" class="field-style field-split align-left" placeholder="Next Of Kin" />
    <input type="text" name="a_amount" class="field-style field-split align-right" placeholder="Salary Amount" />
    <input type="text" name="boss_location" class="field-style field-split align-left" placeholder="Job Offered" />
    <input type="text" name="price_sold" class="field-style field-split align-right" placeholder="NIN" />
     <input type="text" name="b_balance" class="field-style field-split align-left" placeholder="Working Hours" />
     <input type="text" name="d_date" class="field-style field-split align-right" placeholder="Allowances"/>
</li>
<li>
<input type="text" name="storenumber" class="field-style field-full align-none" placeholder="Others" />
</li>
<li align="right">
<input type="submit" value="Save" />
</li>
</ul>
</form>

</body>
</html>
