<%@page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>教学系统-教师-个人信息</title>
    <link rel="stylesheet" type="text/css" href="../css/iandg.css">
    <link rel="stylesheet" type="text/css" href="../css/main.css">
    <link rel="stylesheet" type="text/css" href="../css/index.css">
    <link rel="stylesheet" type="text/css" href="../css/com_header.css">
</head>
<body style="background-color: #353C47">
    <% 
    String tname=null;
    String tpass=null;
    String tmail=null;
    Statement stat=null;
    Connection con=null;
    Statement stat1=null;
    Connection con1=null;
    ResultSet rs=null;
    int result;

    tname=(String)request.getParameter("tname");
    tpass=(String)request.getParameter("password");
    tmail=(String)request.getParameter("mail");
    //TODO
    //把下面的12345到时候换成user_id
    
    int tid =Integer.valueOf((String)session.getAttribute("tid"));
    String user_id =(String)session.getAttribute("user_id");
    String user_id2=null;
    user_id2=(String)session.getAttribute("user_id2");
    if(user_id2!=null){
      user_id=user_id2; 
    }
   
    try {
        //1.注册驱动
         Class.forName("com.mysql.jdbc.Driver");
        //2.定义sql
    //String sql="select user_name from user where user_id='"+user_id+"'";
       //String sql="select * from student where student_id='"+sid+"'";
       if(tname!=null){
            String sql="update user set user_name='"+tname+"' , password='"+tpass+"',mail='"+tmail+"' where user_id='"+user_id+"'"; 

        //3.获取Connection对象
        con= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/education?useSSL=false","root","1812636QQQAAZ");
        //4.获取sql的对象
        stat=con.createStatement();
        //5.执行sql
        result=stat.executeUpdate(sql);

         if(result!=0){
       String script = "<script>alert('修改成功');location.href='teacher.jsp'</script>";
        response.getWriter().println(script);
          }else{
              String script = "<script>alert('修改失败，请稍后重试');location.href='teacherself.jsp'</script>";
        response.getWriter().println(script);
          }
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
<div class="com-header" style="z-index:1">
        <div class="header-bar">
            <div class="header-content clearfix">
                <div class="header-bar-position" style="display: block;position: relative">
                    
                       <a ><img src="../pic/position.png" ></a>
                        <span class="current-city">吉林大学</span>
                    <div class="user-entry" style="display: inline-block;">
                        <%
                            
                            if(null !=user_id){%>
                                <a class="growth-entry user-up" ><%=user_id %></a>
                                <a class="extra-entry" href="http://localhost/shujuku/logout.jsp">退出</a><%
                            }else {%>
                              <a class="growth-entry user-up" href="http://localhost/WEB4/login/login1.jsp" >立即登录</a>
                            <a class="extra-entry" href="">教师</a><%
                            }
                        %>
                        <a class="extra-entry" href="teacher.jsp">返回首页</a>
                    </div>
                </div>  
                <div class="header-bar-nav">
                  <ul class="header-nav-first">
                        <li ><a href="https://www.jlu.edu.cn/" target="_blank">吉林大学</a></li>
                        <li>
                            <a href="teach.jsp" >授课信息</a>
                        </li>
                        <li>
                            <a href="grade.jsp" >课程打分</a>
                        </li>
                        <li><a href="teacherself.jsp">个人信息</a></li>
                    </ul>
                </div>  
            </div>
        </div>
        
</div>
<div class="shop2" style="background-color: #6A6D74;height:500px;width:600px;padding-top:100px;margin-left:300px;margin-top:0;">
  <div class="name1" ><a style="color:black">个人信息</a></div>
    <div class="name2"> 
      <!-- <div class="output1">用户id：</div>
      <div class="output">12345678</div> -->

      <div class="output1" >
      <form action="../manager/updateuser.jsp" method="POST">
        <a >修改用户名</a>
        <input type="text" name="username" value="">
        <a >修改密码</a>
        <input type="text" name="password" value="">
        <a >修改邮箱</a>
        <input type="text" name="mail" value="">
        <input type="submit" value="提交" >
        </form>
      </div>
      <!-- <div class="output1">
      <form action="">
        <br><br>
        修改密码：
        <input type="text" name="password" value="">
        <input type="submit" value="提交">
        </form> 
      </div> -->
    </div>
</div>

		
<div id="c7" class="bottom" style="background-color: #002147">
            <div style="height:355px; margin:0 auto">
                <div style="float:left; margin-left:200px; margin-top:50px; width:880px;">
                    <div style="border-bottom:solid 1px #8E8F92; height:185px">
                        <div style="margin-top:32px; float:left; width:200px">
                            <div style="color:#FFFFFF; font-size:16px" class="b">校园文化</div>
                            <div style="margin-top:30px;" class="hs">吉大校友</div>
                            <div style="margin-top:10px;" class="hs">招才纳贤</div>
                            <div style="margin-top:10px;" class="hs">图书馆</div>
                        </div>
                        <div style="margin-top:32px; float:left; width:200px">
                            <div style="color:#FFFFFF; font-size:16px" class="b">服务指南</div>
                            <div style="margin-top:10px;" class="hs">校长信箱</div>
                            <div style="margin-top:10px;" class="hs">新闻钟信</div>
                        </div>
                        <div style="margin-top:32px; float:left; width:200px">
                                <a  style="color:#FFFFFF; font-size:16px" class="b" href="mainpage.html">返回顶端</a>
                            
                        </div>
                        
                        <div style="float:right; width:226px; height:158px;position: relative">
                            <img src="../pic/jlu1.jpg" style="width: 200px; height:200px;padding-left:50px;padding-bottom:40px;margin-top:-20px">
                        </div>
                    </div>
                    <div style="margin-top:16px">
                        <div style="float:left; width:92px; height:28px;"><span class="jh b">吉林大学</span> </div>
                        <div style="float:left; margin-left:24px">
                            <span class="b bzb">吉大热线：</span>
                             <span class="jh1 b">666-666-6666 </span> 
                             <span class="b bzb">吉大地址：</span>
                             <span class="jh1 b">吉林省长春市前进大街2699号</span>
                             
                        </div>
                    </div>
                </div>
                
            </div>
</div>
    



</body>
</html>