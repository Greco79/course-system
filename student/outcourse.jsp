<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<%@ page import="java.io.Serializable"%>
<html>
<head>
    <title>退课</title>
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
    int course_id= Integer.valueOf((String)request.getParameter("course_id"));
     int sid =Integer.valueOf((String)session.getAttribute("sid"));
   
   try{
      Class.forName(DBDRIVER);
      conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
      String sql_delete="delete from student_course where course_id="+course_id+" and student_id="+sid+"";
      //获取要删除的此id的数据库信息
      pst=conn.prepareStatement(sql_delete);
      rs=pst.executeUpdate();
      if(rs!=0){
       String script = "<script>alert('退课成功');location.href='course.jsp'</script>";
      response.getWriter().println(script);
        }else{
            String script = "<script>alert('退课失败，请稍后重试');location.href='course.jsp'</script>";
      response.getWriter().println(script);
        }
        
    }
    catch(Exception e){
        out.println(e);
    }

%>
</body>
</html>

