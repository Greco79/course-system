<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<%@ page import="java.io.Serializable"%>
<html>
<head>
    <title>删除学生学籍</title>
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
    PreparedStatement pst=null,pst1=null;
    Statement stmt = null ;
    int rs=0,rs2=0;
    int id= Integer.valueOf((String)request.getParameter("id"));
    ResultSet rs1 = null ;

   
   try{
      Class.forName(DBDRIVER);
      conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
      stmt = conn.createStatement() ;
      String sql="select * from student where student_id='"+id+"'";
      rs1=stmt.executeQuery(sql);
      if(rs1.next()){
        String sql_delete="delete from student where student_id="+id+"";
        String sql_delete1="delete from user where user_id="+rs1.getString(10)+"";
        //获取要删除的此id的数据库信息
        pst=conn.prepareStatement(sql_delete);
        rs=pst.executeUpdate();

        pst1=conn.prepareStatement(sql_delete1);
        rs2=pst1.executeUpdate();


        if(rs!=0&&rs2!=0){
       String script = "<script>alert('删除成功');location.href='student_info.jsp'</script>";
        response.getWriter().println(script);
          }else{
              String script = "<script>alert('删除失败，请稍后重试');location.href='changestudent.jsp'</script>";
        response.getWriter().println(script);
          }
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
        if(stmt!=null) {
            try {
                stmt.close();
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

