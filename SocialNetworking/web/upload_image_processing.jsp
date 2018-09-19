<%@page import="social.DbConnection"%>
<%@page import="java.sql.*"%>
<%@page import="org.apache.commons.fileupload.*,java.util.*,java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
          String email = (String)session.getAttribute("email");
          String filename="";
          ServletContext context = session.getServletContext();
          String wpath= context.getRealPath("/").replace("\\","/");
          String filepath =wpath+"profilepic/";

          DiskFileUpload upload = new DiskFileUpload();
          List items =  upload.parseRequest(request);
          FileItem name = (FileItem)items.get(0);
          filename = name.getName();

          long size = name.getSize();
          if(size < 8000000)
           {
              filename = email+filename;
              File ob = new File(filepath+filename);
              name.write(ob);

              Connection con = DbConnection.getConnect();
              Statement st = con.createStatement();
              st.execute("update userreg set profilepic='"+filename+"' where email='"+email+"'");

              //String msg = "File Uploaded Successfully";
              response.sendRedirect("userhome.jsp");

            }
          else
           {
                out.println("Size exceed.....");
           }

    %>
