<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<%@ page import="java.io.Serializable"%>
<html>
<head>
    <title>学生选课</title>
</head>
<body>
  <%
    int studentid =Integer.valueOf((String)session.getAttribute("sid"));
    int course_id= Integer.valueOf((String)request.getParameter("course_id"));
  %>
<%!
    String DBDRIVER="com.mysql.cj.jdbc.Driver";
   String DBURL="jdbc:mysql://127.0.0.1:3306/education?useSSL=false";
    String DBUSER="root";
    String DBPASS="1812636QQQAAZ";
%>
    <%
    Connection conn=null;
    PreparedStatement pst=null;
    Statement stat=null;
    ResultSet rs1=null;
    int rs=0;
    
    int secid;
      String year=null;
      String semester=null;
      int grade=0;

   
   try{
      Class.forName(DBDRIVER);
      conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
      
      

       String sql="select * from course NATURAL JOIN section where course.course_id='"+course_id+"'";

       stat=conn.createStatement();
        //5.执行sql
        rs1=stat.executeQuery(sql);
        if(rs1.next()){
          secid=rs1.getInt("sec_id");
        year=rs1.getString("year");
        semester=rs1.getString("semester");

        String sql_delete="insert into student_course values('"+course_id+"','"+studentid+"','"+secid+"','"+year+"','"+semester+"','"+grade+"')";
      //获取要删除的此id的数据库信息
        pst=conn.prepareStatement(sql_delete);
        rs=pst.executeUpdate();
        if(rs!=0){
         String script = "<script>alert('选课成功');location.href='course.jsp'</script>";
        response.getWriter().println(script);
          }else{
              String script = "<script>alert('选课失败，请稍后重试');location.href='course.jsp'</script>";
        response.getWriter().println(script);
          }
        }
        else{
         String script = "<script>alert('该课程没有上课时间段，请稍后重试');location.href='course.jsp'</script>";
          response.getWriter().println(script);
        }
      }

    catch(Exception e){
        out.println(e);
    }finally {
        //为了避免空指针异常
        if(rs1!=null) {
            try {
                rs1.close();
            } catch (SQLException e) {
                out.println(e);
            }
        }
        if(stat!=null) {
            try {
                stat.close();
            } catch (SQLException e) {
                out.println(e);
            }
        }
        if(conn!=null) {
            try {
                conn.close();
            } catch (SQLException e) {
                out.println(e);
            }
        }
    }

%>
</body>
</html>

