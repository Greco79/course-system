<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>更改学生信息</title>
</head>
<body>
    <% 
     String tname=""; 
    int tid=-1;
    int tsex=0;
    String tnation="";
    String tdep="";
    String tjob="";

    
    int toid=Integer.parseInt((String)request.getParameter("toid"));  
    tid=Integer.parseInt((String)request.getParameter("tid"));               
    tname=request.getParameter("tname");
    tsex=Integer.parseInt((String)request.getParameter("tsex"));               
    //String sdate=request.getParameter("sdate");
    tnation=request.getParameter("tnation");                  
    tdep=request.getParameter("tdep");
    tjob=request.getParameter("tjob");               

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
        if(tid!=-1 ){
            sql="update teacher set teacher_id='"+tid+"',teacher_name='"+tname+"',sex='"+tsex+"',nationality='"+tnation+"',department='"+tdep+"',jobtitle='"+tjob+"'" + " where teacher_id='"+toid+"'";
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
            String script = "<script>alert('修改成功');location.href='teacher_info.jsp'</script>";
			response.getWriter().println(script);
        }else{
            String script = "<script>alert('修改失败，请稍后重试');location.href='changeteacher.jsp'</script>";
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
