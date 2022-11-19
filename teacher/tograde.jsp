<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>更改用户信息</title>
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
    int cc= Integer.valueOf((String)request.getParameter("cc"));
    int ss= Integer.valueOf((String)request.getParameter("ss"));
    int grade= Integer.valueOf((String)request.getParameter("grade"));

   
   try{
      Class.forName(DBDRIVER);
      conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
      String sql_delete="update student_course set grade='"+grade+"' where student_id="+ss+" and course_id="+cc+"";
      //获取要删除的此id的数据库信息
      pst=conn.prepareStatement(sql_delete);
      rs=pst.executeUpdate();
      if(rs!=0){
          String script = "<script>alert('打分成功');location.href='grade.jsp'</script>";
        response.getWriter().println(script);
    }

        
    } catch (ClassNotFoundException e) {
        out.println(e);
    } catch (SQLException e) {
        out.println(e);
    }

    %>
</body>
</html>
