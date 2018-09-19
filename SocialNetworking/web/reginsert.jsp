<%@page import="social.SendEmail"%>
<%@page import="java.util.Random"%>
<%@page import="social.DateTime"%>
<%@page import="java.sql.Statement"%>
<%@page import="social.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    String pwd = request.getParameter("pwd");
    String tel = request.getParameter("tel");
    String gender = request.getParameter("gender");
    String month = request.getParameter("month");
    String day = request.getParameter("day");
    String year = request.getParameter("year");
    String dob = month+"/"+day+"/"+year;

    String pic="";
    if(gender.equals("Male"))
    {
        pic = "male1.jpg";
    }
    else
    {
        pic = "female1.png";
    }

    String rdate = DateTime.getCurrentDateTime();
    Connection con = DbConnection.getConnect();
    Statement st1 = con.createStatement();
    Statement st2 = con.createStatement();
    st1.execute("insert into userreg values('"+fname+"','"+lname+"','"+email+"','"+pwd+"','"+tel+"','"+gender+"','"+dob+"','"+rdate+"','Active','"+pic+"')");
    st2.execute("insert into user_status_info values('"+email+"','"+rdate+"','"+rdate+"','offline')");
    /*................................Redirect To Code Verification........................*/
    Random ob = new Random();
    int code=ob.nextInt(10000);
    SendEmail semail = new SendEmail();
    semail.setEmail(email);
    String ncode = code+"";
    semail.setCode(ncode);
    String status = semail.sendEmail();
    if(status.equals("Success"))
    {
        Statement st3 = con.createStatement();
        st3.execute("insert into codeinfo value('"+email+"','"+code+"','Not Verified')");
        session.setAttribute("fname",fname);
        session.setAttribute("lname",lname);
        session.setAttribute("email",email);
        response.sendRedirect("verifycode.jsp");

    }
    else
    {
        out.println("Failed to Register.<a href='index.jsp'>Try Again</a>");
    }
%>