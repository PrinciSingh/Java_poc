<%@page import="java.sql.ResultSet"%>
<%@page import="social.DateTime"%>
<%@page import="java.sql.Statement"%>
<%@page import="social.DbConnection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" import="javazoom.upload.*,java.util.*,java.io.*"%>

<%
    String email = (String)session.getAttribute("email");
    Connection con = DbConnection.getConnect();
    Statement st = con.createStatement();
    ResultSet rst = st.executeQuery("select * from learningzone where email='"+email+"'");
    int count=0;
    while(rst.next())
    {
        count++;
    }
    if(count==0)
    {
        count =1;
    }
    else
    {
        count =count+1;
    }

    String systemPath = session.getServletContext().getRealPath("/").replace("\\","/");
    String filePath=systemPath+"LearningZone/"+email+"/";
    String filePath1=systemPath+"LearningZone/"+email;
    File cob = new File(filePath1);
    if(!cob.exists())
    {
        cob.mkdirs();
    }
%>

<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
    <jsp:setProperty name="upBean" property="folderstore" value="<%=filePath%>" />
    <jsp:setProperty name="upBean" property="parser" value="<%= MultipartFormDataRequest.CFUPARSER %>"/>
</jsp:useBean>

<%
     String fileName=null;
     MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
     Hashtable files = mrequest.getFiles();
     if ( (files != null) && (!files.isEmpty()) )
     {
        UploadFile file = (UploadFile) files.get("uploadfile");
        upBean.store(mrequest, "uploadfile");
        fileName=file.getFileName();
     }

    if(fileName!=null && !"".equals(fileName.trim()))
    {
        File tempFile=new File(filePath+fileName);
        if(tempFile.exists())
        {
            fileName=count+"_"+fileName;
            tempFile.renameTo(new File(filePath+fileName));
        }
    }
    String title = mrequest.getParameter("title");
    String cata = mrequest.getParameter("select");
    String description = mrequest.getParameter("description");
    String uploadfile = mrequest.getParameter("uploadfile");

   
    Statement st1 = con.createStatement();
    st1.execute("insert into learningzone values('"+email+"','"+count+"','"+title+"','"+cata+"','"+description+"','"+fileName+"','"+DateTime.getCurrentDateTime()+"')");
    response.sendRedirect("learnzone.jsp");
    %>

