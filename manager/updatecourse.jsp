<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>更改课程信息</title>
</head>
<body>
    <% 
    String cname=""; 
    int cid=-1;
    String ccredit="";
    String ctest="";
    String cdep="";
    
    int coid=Integer.parseInt((String)request.getParameter("coid"));  
    cid=Integer.parseInt((String)request.getParameter("cid"));               
    cname=request.getParameter("cname");
    ccredit=request.getParameter("ccredit");
    ctest=request.getParameter("ctest");                
    cdep=request.getParameter("cdep");
         

    Statement stat=null;
    Connection con=null;
    ResultSet rs=null;
    int result;

    //TODO
    //把下面的12345到时候换成user_id

    
    try {
        //1.注册驱动
        Class.forName("com.mysql.jdbc.Driver");
        String sql="";
        String sql1="";
        String sql2="";
        //2.定义sql
         // sql="update t.user set user_name='"+username+"'  and password='"+password+"' where user_id='''"+user_id+"'''; 
        if(cid!=-1 ){
            sql="update course set course_id='"+cid+"',name='"+cname+"',credit='"+ccredit+"',test_style='"+ctest+"',department='"+cdep+"'" + " where course_id='"+coid+"'";
        }
       


        //<!-- String sql="select * from userinfo where (user_name = '"+username+"') and password = '"+password+"' "; -->
        //3.获取Connection对象
        con= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/education?useSSL=false","root","1812636QQQAAZ");
        //4.获取sql的对象
        stat=con.createStatement();
        //5.执行sql
        result=stat.executeUpdate(sql);
        //6.处理结果
        //6.1让游标向下移动一行
        if(result==1){
            //<!-- Integer userid=rs.getInt("id");
            //Cookie user_id=new Cookie("user_id",userid.toString());
            //user_id.setMaxAge(60*60*24);        //设置cookie的生存时间
            // response.addCookie(user_id);         -->
            String script = "<script>alert('修改成功');location.href='course_info.jsp'</script>";
			response.getWriter().println(script);
        }else{
            String script = "<script>alert('修改失败，请稍后重试');location.href='changecourse.jsp'</script>";
			response.getWriter().println(script);
        }
        
    } catch (ClassNotFoundException e) {
        out.println(e);
    } catch (SQLException e) {
        out.println(e);
    }finally {
        //为了避免空指针异常
        if(rs!=null) {
            try {
                rs.close();
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
        if(con!=null) {
            try {
                con.close();
            } catch (SQLException e) {
                out.println(e);
            }
        }
    }

    %>
</body>
</html>
