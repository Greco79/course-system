<%@page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>教学系统-管理员-修改学生</title>
    <link rel="stylesheet" type="text/css" href="../css/iandg.css">
    <link rel="stylesheet" type="text/css" href="../css/main.css">
    <link rel="stylesheet" type="text/css" href="../css/index.css">
    <link rel="stylesheet" type="text/css" href="../css/com_header.css">
</head>
<body style="background-color: #353C47">
    <% 
    //TODO
    //把下面的12345到时候换成user_id
    String user_id =String.valueOf((String)session.getAttribute("user_id"));
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
                        <li ><a href="http://localhost/shujuku/manager/course_info.jsp" target="_blank">课程信息</a></li>
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
      <div class="output1" >
      <form action="addstudent.jsp" method="POST">
        <a >学生ID</a>
        <input type="text" name="sid" value="">

        <a >学生姓名(英文)</a>
        <input type="text" name="sname" value="" >

        <a >学生性别(男性填1，女性填0)</a>
        <input type="text" name="ssex" value="" >
        
       
        <a >出生日期（年-月-日）</a>
        <input type="text" name="sborn" value="" >

        <a >民族(英文）</a>
        <input type="text" name="snation" value="" >
        
        <a >学院(英文)</a>
        <input type="text" name="sdep" value="">
        
        <a >专业(数字)</a>
        <input type="text" name="smajor" value="" >
        
        <a >班级(数字)</a>
        <input type="text" name="sclass" value="">
        
        <a >入学年份(数字)</a>
        <input type="text" name="syear" value="" >
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
<%!
    // 定义数据库驱动程序
    String DBDRIVER = "com.mysql.jdbc.Driver" ;
    // 定义数据库连接地址
    String DBURL = "jdbc:mysql://127.0.0.1:3306/education?useSSL=false" ;
    //定义用户名和口令
    String user="root";
    String pwd="1812636QQQAAZ";

    // 定义数据库连接对象，属于java.sql包中的接口
    Connection conn = null ;

    // 定义Statement对象，用于操作数据库
    Statement stmt = null ;

    // 定义一字符串变量，用于保存SQL语句
    String sql = null ;

    Connection conn1 = null ;

    // 定义Statement对象，用于操作数据库
    Statement stmt1 = null ;

    Statement stmt2 = null ;


    // 定义一字符串变量，用于保存SQL语句
    String sql1 = null ;
    ResultSet rs1 = null ;
    int p;
    int i,j;
%>
<%
    // 1、加载驱动程序
    try
    {
        Class.forName(DBDRIVER) ;
    }
    catch(Exception e)
    {
        out.println("数据库驱动程序加载失败！！！") ;
    }

    // 2、连接数据库
    try
    {
        conn = DriverManager.getConnection(DBURL,user,pwd) ;
    }
    catch(Exception e)
    {
        out.println("数据库连接失败！！！"+e) ;
    }
    
    // 3、操作数据库
    // 通过Connection对象实例化Statement对象
    try
    {
        stmt1 = conn.createStatement() ;
        // 为sql变量赋值
        sql1 = "select * from student" ;
        rs1 = stmt1.executeQuery(sql1) ;
        int sid=-1;
        sid=Integer.parseInt((String)request.getParameter("sid")); 
        String sname = request.getParameter("sname") ;
        String ssex = request.getParameter("ssex") ;
        String sborn=request.getParameter("sborn");
        String snation=request.getParameter("snation");                  
        String sdep=request.getParameter("sdep");
        int smajor=Integer.parseInt((String)request.getParameter("smajor"));    
        int sclass=Integer.parseInt((String)request.getParameter("sclass"));
        String syear=request.getParameter("syear"); 

        String pass="123";
        String identity="student";
        String mail=null;
        //out.println(name) ;
        //out.println(password) ;
        //out.println(repassword) ;
        p=0;
        while(rs1.next()){
            
            if(rs1.getString(1).equals(sid))
            {
                p=1;
            }
            
        } 
        if(p==1){
            %>
            <script>alert("学生已存在，请重新输入：")</script>
            
            <%
        }
        else if(p==0){
            
                
                stmt = conn.createStatement() ;
                ResultSet rs2 = stmt.executeQuery("select * from user");
                rs2.last();
                String rowCount = String.valueOf(rs2.getRow());  //获得ResultSet的总行数
                
                // 为sql变量赋值INSERT INTO person (name,password) VALUES ('hwj','123456');
                sql = "insert into student values('"+sid+"','"+sname+"','"+ssex+"','"+sborn+"','"+snation+"','"+sdep+"','"+smajor+"','"+sclass+"','"+syear+"','"+rowCount+"')";


                
                sql1="insert into user values('"+rowCount+"','"+sname+"','"+pass+"','"+identity+"','"+mail+"')";

                stmt2 = conn.createStatement() ;
                i = stmt2.executeUpdate(sql1) ;

                j=stmt.executeUpdate(sql);
                
                System.out.println(i+"@"+j);
                if(i>=0&&j>=0){
                    String script = "<script>alert('添加成功');location.href='student_info.jsp'</script>";
                    response.getWriter().println(script);
                }
                else{
                   String script = "<script>alert('添加失败');location.href='addstudent.jsp'</script>";
                    response.getWriter().println(script);
                }
               
        }
        
    }
    catch(Exception e)
    {
        
            out.println("操作数据库失败！！！"+e) ;
    }
        
    
    // 4、关闭数据库
    try
    {
        // 关闭操作
        stmt.close() ;

        stmt.close() ;

        stmt1.close() ;

        stmt2.close() ;
        // 关闭连接
        conn.close() ;
    }
    catch(Exception e)
    {
        
            out.println("数据库关闭失败！！！"+e) ;
    }
%>
        
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