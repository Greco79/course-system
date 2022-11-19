<%@page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>教学系统-管理员-修改学生信息</title>
    <link rel="stylesheet" type="text/css" href="../css/iandg.css">
    <link rel="stylesheet" type="text/css" href="../css/main.css">
    <link rel="stylesheet" type="text/css" href="../css/index.css">
    <link rel="stylesheet" type="text/css" href="../css/com_header.css">
</head>
<body style="background-color: #353C47">
    <% 
    String sname=""; 
    int sid=-1;
    int ssex=0;
    String born="";
    String snation="";
    String sdep="";
    int smajor=-1;
    int sclass=-1;
    String syear="";

    Statement stat=null;
    Connection con=null;
    ResultSet rs=null;
    int result;

    //TODO
    //把下面的12345到时候换成user_id
    String user_id= String.valueOf((String)request.getParameter("id1"));
    
   
    try {
        //1.注册驱动
        Class.forName("com.mysql.jdbc.Driver");
        //2.定义sql
    //String sql="select user_name from user where user_id='"+user_id+"'";
    String sql="select * from student where student_id='"+user_id+"'";
        //3.获取Connection对象
        con= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/education?useSSL=false","root","1812636QQQAAZ");
        //4.获取sql的对象
        stat=con.createStatement();
        //5.执行sql
        rs=stat.executeQuery(sql);
        //6.处理结果
        //6.1让游标向下移动一行
        while(rs.next()){
            sid=rs.getInt(1);
            sname+=rs.getString(2);
            ssex=rs.getInt(3);
            born=rs.getDate(4).toString();
            snation+=rs.getString(5);
            sdep+=rs.getString(6);
            smajor=rs.getInt(7);
            sclass=rs.getInt(8);
            syear+=rs.getString(9);
        }
            //<!-- Integer userid=rs.getInt("id");
            //Cookie user_id=new Cookie("user_id",userid.toString());
            //user_id.setMaxAge(60*60*24);        //设置cookie的生存时间
            // response.addCookie(user_id);         -->
           
       
        
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
                            <a class="extra-entry" href="">管理员</a><%
                            }
                        %>
                        <a class="extra-entry" href="manager.jsp">返回首页</a>
                    </div>
                </div>  
                <div class="header-bar-nav">
                    <ul class="header-nav-first">
                      <li ><a href="https://www.jlu.edu.cn/" target="_blank">吉林大学</a></li>
                      <li><a  href="http://localhost/shujuku/manager/student_info.jsp"target="_blank">学生信息</a></li>
                      <li><a href="http://localhost/shujuku/manager/teacher_info.jsp" target="_blank">教师信息</a></li>
                      <li><a href="http://localhost/shujuku/manager/managerself.jsp" target="_blank">个人信息</a></li>
                    </ul>
                </div>  
            </div>
        </div>
        
</div>
<div class="shop2" style="background-color: #6A6D74;height:1000px;width:600px;padding-top:100px;margin-left:300px;margin-top:0;">
  <div class="name1" ><a style="color:black">个人信息</a></div>
    <div class="name2"> 
      <!-- <div class="output1">用户id：</div>
      <div class="output">12345678</div> -->
      <div class="output1" >
      <form action="updatestudent.jsp" method="POST">
        <input type="hidden" name="soid" value="<%=user_id%>">
        <a >修改ID</a>
        <input type="text" name="sid" value="" placeholder="<%=sid%>">
        
        <a >修改学生姓名(英文)</a>
        <input type="text" name="sname" value="" placeholder="<%=sname%>">
        
        <a >修改性别(男性填1，女性填0)</a>
        <input type="text" name="ssex" value="" placeholder="<%=ssex%>">
        
        <div class="output1"><a >出生日期</a></div>
        <div class="output4" style="background-color: #fff"><a style="color:black"><%=born%></a></div>
        
        <a >修改民族(英文）</a>
        <input type="text" name="snation" value="" placeholder="<%=snation%>">
        
        <a >修改学院(英文)</a>
        <input type="text" name="sdep" value="" placeholder="<%=sdep%>">
        
        <a >修改专业(数字)</a>
        <input type="text" name="smajor" value="" placeholder="<%=smajor%>">
        
        <a >修改班级(数字)</a>
        <input type="text" name="sclass" value="" placeholder="<%=sclass%>">
        
        <a >修改入学年份(数字)</a>
        <input type="text" name="syear" value="" placeholder="<%=syear%>">
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