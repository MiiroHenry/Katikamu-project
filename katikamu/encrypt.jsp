<%@page import="java.sql.*"%>
<%@page import=" java.security.MessageDigest"%>
<%

String firstname=request.getParameter("firstname");
String lastname=request.getParameter("lastname");
String username=request.getParameter("username");
String address=request.getParameter("address");
String phone=request.getParameter("phone");
String email=request.getParameter("email");
String password=request.getParameter("password");
String algorithm="";
byte[] unencodedPassword = password.getBytes();
MessageDigest md = null;
try {
md = MessageDigest.getInstance("MD5");
} catch (Exception e) {}
md.reset();
md.update(unencodedPassword);
byte[] encodedPassword = md.digest();
StringBuffer buf = new StringBuffer();
for (int i = 0; i < encodedPassword.length; i++) {
if (((int) encodedPassword[i] & 0xff) < 0x10) {
buf.append("0");
}
buf.append(Long.toString((int) encodedPassword[i] & 0xff, 16));
}
String passw=buf.toString(); 
String connectionURL = "jdbc:mysql://localhost:3306/dbuser";;
Connection con=null;
try{
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection(connectionURL, "root", "root");
PreparedStatement ps = con.prepareStatement("insert into login(firstname,lastname,username,address,phone,email,password) VALUES(?,?,?,?,?,?,?)");
ps.setString(1,firstname);
ps.setString(2,lastname);
ps.setString(3,username);
ps.setString(4,address);
ps.setString(5,phone);
ps.setString(6,email);
ps.setString(7,password);
int i = ps.executeUpdate();
ps.close(); 
con.close();
}
catch(Exception ex){}

%>