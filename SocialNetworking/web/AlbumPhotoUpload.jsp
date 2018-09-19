<%@page import="social.DateTime"%>
<%@page import="java.sql.Statement"%>
<%@page import="social.DbConnection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" import="javazoom.upload.*,java.util.*,java.io.*"%>

<%
    String email = (String)session.getAttribute("email");
    String systemPath = session.getServletContext().getRealPath("/").replace("\\","/");
    String filePath=systemPath+"albums/"+email+"/";
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
        UploadFile file = (UploadFile) files.get("albumPhoto");
        upBean.store(mrequest, "albumPhoto");
        fileName=file.getFileName();
     }

    if(fileName!=null && !"".equals(fileName.trim()))
    {
        File tempFile=new File(filePath+fileName);
        if(tempFile.exists())
        {
            long time=System.currentTimeMillis();
            String ext=fileName.substring(fileName.lastIndexOf("."));
            fileName=email+time+ext;
            tempFile.renameTo(new File(filePath+fileName));
        }
    }

    String title = mrequest.getParameter("title");
    String album_slno = mrequest.getParameter("album_slno");
    String restriction = request.getParameter("accesstype");
    String image_caption = mrequest.getParameter("image_caption");
    String album_cover= mrequest.getParameter("album_cover");
    if(album_cover==null)
        album_cover="N";

    Connection con = DbConnection.getConnect();
    Statement st1 =con.createStatement();
    Statement st2 =con.createStatement();
    st1.execute("insert into album_details(album_slno,image,image_caption,date_uploaded,album_cover) values('"+album_slno+"','"+fileName+"','"+image_caption+"','"+DateTime.getCurrentDateTime()+"','"+album_cover+"')");
    st2.execute("update privacy_settings set rest_on_photos='"+restriction+"' where email='"+email+"'");
    %>
<jsp:forward page="/AlbumDetails.jsp">
    <jsp:param name="title" value="<%= title %>" />
    <jsp:param name="album_slno" value="<%= album_slno %>" />
</jsp:forward>
