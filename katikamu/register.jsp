
<%@ page import="java.sql.*" %>  
<%@ page import="enc.Encrypt" %>

<%
if(session.getAttribute("login")!=null) //check login session user not access or back to register.jsp page
{
    response.sendRedirect("welcome.jsp");//sendRedirect not clear
}
%>


<%
try
{
    Class.forName("com.mysql.jdbc.Driver"); //load driver
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser","root",""); //create connection
    
    if(request.getParameter("btn_register")!=null) //check register button click event not null
    {
		String firstname,lastname,email,password,username,phone,address,cpassword;
		
		firstname=request.getParameter("txt_firstname"); //txt_firstname
		lastname=request.getParameter("txt_lastname"); //txt_lastname
		username=request.getParameter("txt_username");//txt_lastname
		address=request.getParameter("txt_address");//txt_lastname txt_address
		phone=request.getParameter("txt_phone");//txt_lastname
		email=request.getParameter("txt_email"); //txt_email
		password=request.getParameter("txt_password"); //txt_password
        cpassword=request.getParameter("txt_cpassword"); //txt_cpassword
		
		
		PreparedStatement pstmt=null; //create statement
		
		pstmt=con.prepareStatement("insert into login(firstname,lastname,username,address,phone,email,password) values(?,?,?,?,?,?,?)"); //sql insert query
		pstmt.setString(1,firstname);
		pstmt.setString(2,lastname);
		pstmt.setString(3,username);
		pstmt.setString(4,address);
		pstmt.setString(5,phone);
		pstmt.setString(6,email);
		pstmt.setString(7,Encrypt.encrypt(password));

		pstmt.executeUpdate(); //execute query
		
		request.setAttribute("successMsg","Register Successfully...! Please login"); //register success messeage

		con.close(); //close connection
	}
}
catch(Exception e)
{
	out.println(e);
}
%>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
		
	<title>Register:</title>

	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/login-register.css">
	<style type="text/css">
       .btn{
  padding: 10px;
  font-size: 15px;
  background: #5F9EA0;
  border: none;
  border-radius:5px;
}
   
    </style>
	<!-- javascript for registeration form validation-->
	<script>	
	
		function validate()
		{
			var first_name= /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
			var last_name= /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z
			var user_name= /^[a-z A-Z]+$/; 
			var add_ress= /^[a-z A-Z]+$/; 
			var p_number=/^[0-9]+$/; 
			var email_valid= /^[\w\d\.]+\@[a-zA-Z\.]+\.[A-Za-z]{1,4}$/; //pattern valid email validation
			var password_valid=/^[A-Z a-z 0-9 !@#$%&*()<>]{6,12}$/; //pattern password allowed A to Z, a to z, 0-9, !@#$%&*()<> charecter
			var c_password= /^[A-Z a-z 0-9 !@#$%&*()<>]{6,12}$/; 
			
			var fname = document.getElementById("fname"); //textbox id fname
            var lname = document.getElementById("lname"); //textbox id lname
            var uname=document.getElementById("uname");
            var a_ddress=document.getElementById("a_ddress");
            var pnumber=document.getElementById("pnumber");
            var email = document.getElementById("email"); //textbox id email
            var password = document.getElementById("password"); //textbox id password
            var cpassword=document.getElementById("cpassword");
			
			if(!first_name.test(fname.value) || fname.value=='') 
            {
				alert(" Firstname must be Alphabet Only....!");
                fname.focus();
                fname.style.background = '#f08080';
                return false;                    
            }
			if(!last_name.test(lname.value) || lname.value=='') 
            {
				alert(" Lastname must be Alphabet Only....!");
                lname.focus();
                lname.style.background = '#f08080';
                return false;                    
            }
            if(!user_name.test(uname.value) || uname.value=='') 
            {
				alert("username must Alphabet Only....!");
                uname.focus();
                uname.style.background = '#f08080';
                return false;                    
            }
            if(!add_ress.test(a_ddress.value) || a_ddress.value=='') 
            {
				alert("Address must be Alphabet Only....!");
                a_ddress.focus();
                a_ddress.style.background = '#f08080';
                return false;                    
            }
            if(!p_number.test(pnumber.value) || pnumber.value=='') 
            {
				alert("Phonenumber must be numbers Only....!");
                pnumber.focus();
               pnumber.style.background = '#f08080';
                return false;                    
            }
			if(!email_valid.test(email.value) || email.value=='') 
            {
				alert("Enter Valid Email....!");
                email.focus();
                email.style.background = '#f08080';
                return false;                    
            }
			if(!password_valid.test(password.value) || password.value=='') 
            {
				alert("Password Must Be 6 to 12 and allowed !@#$%&*()<> character");
                password.focus();
                password.style.background = '#f08080';
                return false;                    
            }

			if(!c_password.test(password.value) || cpassword.value=='') 
            {
				alert("Password Must Be 6 to 12 and allowed !@#$%&*()<> character");
                cpassword.focus();
                cpassword.style.background = '#f08080';
                return false;                    
            }
		}
		
	</script>
	

</head>

<body>


    <div class="main-content">

        <form class="form-register" method="post" onsubmit="return validate();" >

            <div class="form-register-with-email">

                <div class="form-white-background">

                    <div class="form-title-row">
                        <h1>Register</h1>
                    </div>
				   
					<p style="color:green">				   		
					<%
					if(request.getAttribute("successMsg")!=null)
					{
						out.println(request.getAttribute("successMsg")); //register success message
					}
					%>
					</p>
				   
				   </br>
				   
                    <div class="form-row">
                        <label>
                            <span>Firstname</span>
                            <input type="text" name="txt_firstname" id="fname" placeholder="enter firstname">
                        </label>
                    </div>
					<div class="form-row">
                        <label>
                            <span>Lastname</span>
                            <input type="text" name="txt_lastname" id="lname" placeholder="enter lastname">
                        </label>
                    </div>
                    <div class="form-row">
                        <label>
                            <span>Username</span>
                            <input type="text" name="txt_username" id="uname" placeholder="enter username">
                        </label>
                    </div>
                    <div class="form-row">
                        <label>
                            <span>Address</span>
                            <input type="text" name="txt_address" id="a_ddress" placeholder="enter pysical adderess">
                        </label>
                    </div>
                    <div class="form-row">
                        <label>
                            <span>Phonenumber</span>
                            <input type="text" name="txt_phone" id="pnumber" placeholder="enter Phonenumber">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Email</span>
                            <input type="text" name="txt_email" id="email" placeholder="enter email">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Password</span>
                            <input type="password" name="txt_password" id="password" placeholder="enter password">
                        </label>
                    </div>
                    <div class="form-row">
                        <label>
                            <span>ConfirmPassword</span>
                            <input type="password" name="txt_cpassword" id="cpassword" placeholder="confirm password">
                        </label>
                    </div>

					<input type="submit" name="btn_register" value="Register"class="form-log-in-with-existing">
					
                </div>
				
                <a href="index.jsp" class="form-log-in-with-existing">Already have an account? <b> Login here </b></a>

            </div>

        </form>

    </div>

</body>

</html>
