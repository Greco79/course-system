<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<%@ page import="java.io.Serializable"%>
<html>
<head>
    <title>删除课程</title>
</head>
<body>
<%!
    String DBDRIVER="com.mysql.cj.jdbc.Driver";
   String DBURL="jdbc:mysql://127.0.0.1:3306/education?useSSL=false";
    String DBUSER="root";
    String DBPASS="1812636QQQAAZ";
%>
    <%
    Connection conn=null;
    PreparedStatement pst=null;
    int rs=0;
    int id= Integer.valueOf((String)request.getParameter("id"));

   
   try{
      Class.forName(DBDRIVER);
      conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
      String sql_delete="delete from course where course_id="+id+"";
      //获取要删除的此id的数据库信息
      pst=conn.prepareStatement(sql_delete);
      rs=pst.executeUpdate();
      if(rs!=0){
       String script = "<script>alert('删除成功');location.href='course_info.jsp'</script>";
      response.getWriter().println(script);
        }else{
            String script = "<script>alert('删除失败，请稍后重试');location.href='changecourse.jsp'</script>";
      response.getWriter().println(script);
        }
        
    }
    catch(Exception e){
        out.println(e);
    }

%>
</body>
</html>

