<%@page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>教学系统-课程信息</title>
   <link rel="stylesheet" type="text/css" href="../css/main.css">
    <link rel="stylesheet" type="text/css" href="../css/index.css">
    <link rel="stylesheet" type="text/css" href="../css/com_header.css">
     <link rel="stylesheet" type="text/css" href="../css/table.css">
</head>
<body style="background-color: #353C47">
      <%
    String user_id =String.valueOf((String)session.getAttribute("user_id"));
    String user_id1=null;
    user_id1=(String)session.getAttribute("user_id1");
    if(user_id1!=null){
      user_id=user_id1; 
    }
     int sid =Integer.valueOf((String)session.getAttribute("sid"));
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
                            <%
                            }
                        %>
                        <a class="extra-entry" href="student.jsp">返回首页</a>
                    </div>
                </div>  
                <div class="header-bar-nav">
                    <ul class="header-nav-first">
            <li ><a href="https://www.jlu.edu.cn/" target="_blank">吉林大学</a></li>
            <li><a  href="http://localhost/shujuku/student/take.jsp">选课信息</a></li>
            <li><a href="http://localhost/shujuku/student/course.jsp" >课程信息</a></li>
            <li><a href="http://localhost/shujuku/student/studentself.jsp" >个人信息</a></li>
          </ul>
                </div>  
            </div>
        </div>
        
</div>
<div id="main" class="col-main" style="margin-top:30px">
        <div class="skin-box-hd bzb">
            <h3>
                <span>课程信息</span>
            </h3>
        </div>
        <div class="skin-box-up">
            <div class="skin-box-act" >
             <table class="buy-table">
                 <tr>
         <th class="buy-table-top b">
            课程ID
          </th>
          <th class="buy-table-top b">
            课程名
          </th>
          <th class="buy-table-top b">
           学分
          </th>
          <th class="buy-table-top b">
           考试方式
          </th>
          <th class="buy-table-top b">
           学院
          </th>
          <th class="buy-table-top b">
           选课
          </th>
        </tr>
		<%!
	// 定义数据库驱动程序
	String DBDRIVER = "com.mysql.jdbc.Driver" ;
	// 定义数据库连接地址
	String DBURL = "jdbc:mysql://127.0.0.1:3306/education" ;
	//定义用户名和口令
	String user="root";
	String pwd="1812636QQQAAZ";
    ResultSet rs = null ;
	ResultSet rs1 = null ;
	// 定义数据库连接对象，属于java.sql包中的接口
	Connection conn = null ;

	// 定义Statement对象，用于操作数据库
	Statement stmt = null ;

  Statement stmt1 = null ;

	// 定义一字符串变量，用于保存SQL语句
	String sql = null ;

  ResultSet is=null;
  int id;
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
        stmt = conn.createStatement() ;
		//String name ="521";
		String name =(String)session.getAttribute("user");
		String sql1="use education";
		boolean t=stmt.execute(sql1);
		// 为sql变量赋值INSERT INTO person (name,password) VALUES ('hwj','123456');
		sql = "select * from course ";
		rs = stmt.executeQuery(sql);
		while(rs.next()){
     id=rs.getInt(1);
        %>
        <tr>
            <td class="buy-table-top" style="width:200px"><%=rs.getInt(1) %></td>
            <td class="buy-table-top" style="width:200px"><%=rs.getString(2) %></td>
            <td class="buy-table-top" style="width:200px"><%=rs.getInt(3)%></td>
            <td class="buy-table-top" style="width:200px"><%=rs.getString(4) %></td>
            <td class="buy-table-top" style="width:200px"><%=rs.getString(5) %></td>
            <th class="buy-table-top" ><%
              String sql2="select * from student_course where course_id='"+id+"' and student_id='"+sid+"'";
              stmt1 = conn.createStatement() ;

              is = stmt1.executeQuery(sql2);
              if(is.next()){
                  if(is.getInt("grade")>0){%>
                  <a class="buy-table-top" >已打分</a><%
                  }
                  else{%>
                    <form action="outcourse.jsp">
                    <input type="hidden" name="course_id" value="<%=id%>">
                    <input type="submit" value="退课" name="submit">
                  </form><%
                }
                 
                
              }
              else{%>
                  <form action="takecourse.jsp">
                  <input type="hidden" name="course_id" value="<%=id%>">
                  <input type="submit" value="选课" name="submit">
                </form>
                <%
              }
              %>
            </th>
        </tr>
		
		<%	
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
    stmt1.close();
		// 关闭连接
		conn.close() ;
	}
	catch(Exception e)
	{
		out.println("数据库关闭失败！！！"+e) ;
	}
%>
             </table>
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
    
</div>


</body>
</html>