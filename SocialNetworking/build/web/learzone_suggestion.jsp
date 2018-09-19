<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="social.DbConnection"%>

<%
       String elem=request.getParameter("elem");
       Connection con1=DbConnection.getConnect();
       Statement st1 = con1.createStatement();
       ResultSet rs1=st1.executeQuery("select * from learningzone where category like '"+elem+"%' or title like '"+elem+"%'");
       if(rs1.next())
       {
          %>
               <table width="619" border="1" cellpadding="7" cellspacing="0">
              <tr>
                <th width="43">Title</th>
                <th width="53">Category</th>
                <th>Description</th>
                <th width="33">Uploaded By</th>
                <th width="43">File</th>
              </tr>
          <%
       }
       else
       {
            out.println("<font color='blue' style='font-size:14px;'><b>&nbsp;No Results Found.</b></font>");
       }
%>

<%
    if(elem==null || elem.trim().equals(""))
    {
        out.print("");
     }
    else
    {
            Connection con=DbConnection.getConnect();
            Statement st = con.createStatement();
            ResultSet rs=st.executeQuery("select * from learningzone where category like '"+elem+"%' or title like '"+elem+"%'");
            while(rs.next())
            {
                %>
                  
              <tr>
                <th><%= rs.getString("title") %></th>
                <th><%= rs.getString("category") %></th>
                <th><%=rs.getString("description") %></th>
                <th><%= rs.getString("email") %></th>
                <th><a href="LearningZone/<%= rs.getString("email") %>/<%= rs.getString("filename") %>"><%= rs.getString("filename") %></a></th>
              </tr>
            
                <%
            }
    }
%>
</table>