
<%@ page import="java.sql.*" %>  
<%@ page import="enc.Encrypt" %>

<%
if(session.getAttribute("student1")!=null) //check login session user not access or back to register.jsp page
{
    response.sendRedirect("registerstudent.jsp");//sendRedirect not clear
}
%>


<%
try
{
    Class.forName("com.mysql.jdbc.Driver"); //load driver
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser","root",""); //create connection
    
    if(request.getParameter("btn_register")!=null) //check register button click event not null
    {
		String firstname,lastname,regno,gender,age,subject,class_name;
		
		firstname=request.getParameter("txt_firstname"); //txt_firstname
		lastname=request.getParameter("txt_lastname"); //txt_lastname
		regno=request.getParameter("txt_regno");//txt_lastname
		gender=request.getParameter("txt_gender");//txt_lastname txt_address
		if (gender==null)
              gender="";
		age=request.getParameter("txt_age");//txt_lastname
		subject=request.getParameter("txt_subject"); //txt_email
		class_name=request.getParameter("txt_class_name"); //txt_password
		if (class_name==null)
              class_name="";
		
		
		PreparedStatement pstmt=null; //create statement
		
		pstmt=con.prepareStatement("insert into student2(firstname,lastname,regno,gender,age,subject,class_name) values(?,?,?,?,?,?,?)"); //sql insert query
		pstmt.setString(1,firstname);
		pstmt.setString(2,lastname);
		pstmt.setString(3,regno);
		pstmt.setString(4,gender);
		pstmt.setString(5,age);
		pstmt.setString(6,subject);
		pstmt.setString(7,class_name);

		pstmt.executeUpdate(); //execute query
		
		request.setAttribute("successMsg","student registered successfully!"); //register success messeage

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
			var reg_no= /^[0-9]+$/; 
			var gen_der= /^[a-z A-Z]+$/; 
			var ag_e=/^[0-9]+$/; 
			var sub_ject= /^[a-z A-Z]+$/; //pattern valid email validation
			var sco_re=/^[0-9]+$/; //pattern password allowed A to Z, a to z, 0-9, !@#$%&*()<> charecter
			
			var fname = document.getElementById("fname"); //textbox id fname
            var lname = document.getElementById("lname"); //textbox id lname
            var r_egno=document.getElementById("r_egno");
            var g_ender=document.getElementById("g_ender");
            var a_ge=document.getElementById("a_ge");
            var s_ubject = document.getElementById("s_ubject"); //textbox id email
            var s_core = document.getElementById("s_core"); //textbox id password
			
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
            /*if(!reg_no.test(r_egno.value) || r_egno.value=='') 
            {
				alert("username must Alphabet Only....!");
                r_egno.focus();
                r_egno.style.background = '#f08080';
                return false;                    
            }*/
            if(!gen_der.test(g_ender.value) || g_ender.value=='') 
            {
				alert("gender must be Alphabet Only....!");
                g_ender.focus();
                g_ender.style.background = '#f08080';
                return false;                    
            }
            if(!ag_e.test(a_ge.value) || a_ge.value=='') 
            {
				alert("age must be numbers Only....!");
                a_ge.focus();
               a_ge.style.background = '#f08080';
                return false;                    
            }
			if(!sub_ject.test(s_ubject.value) || s_ubject.value=='') 
            {
				alert("Enter text Only....!");
                s_ubject.focus();
                s_ubject.style.background = '#f08080';
                return false;                    
            }
            if(!sco_re.test(s_core.value) || s_core.value=='') 
            {
				alert("Enter numbers Only....!");
                s_core.focus();
                s_core.style.background = '#f08080';
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
                        <h1>Register Student</h1>
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
                            <span>RegNumber.</span>
                            <input type="text" name="txt_regno" id="r_egno" placeholder="enter RegNumber">
                        </label>
                    </div>
                    <div class="form-row">
                        <label>
                            <span>Gender</span>
                            <input type="text" name="txt_address" id="g_ender" placeholder="enter gender">
                        </label>
                    </div>
                    <div class="form-row">
                        <label>
                            <span>Age</span>
                            <input type="text" name="txt_age" id="a_ge" placeholder="enter Age">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Subject</span>
                            <input type="text" name="txt_subject" id="s_ubject" placeholder="enter Subject">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>ClassName</span>
                            <input type="text" name="txt_score" id="s_core" placeholder="enter Student score">
                        </label>
                    </div>
                    <div class="form-row">
                        
                    </div>

					<input type="submit" name="btn_register" value="Register"class="form-log-in-with-existing">
					
                </div>
				
                <a href="index.jsp" class="form-log-in-with-existing">Already have an account? <b> Login here </b></a>

            </div>

        </form>

    </div>

</body>

</html>
