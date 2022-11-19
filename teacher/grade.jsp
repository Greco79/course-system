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
int tid1=-1;
//tid1= Integer.valueOf((String)request.getParameter("tid"));
tid1=Integer.valueOf((String)session.getAttribute("tid"));
  %>

<div class="com-header" style="z-index:1">
        <div class="header-bar">
            <div class="header-content clearfix">
                <div class="header-bar-position" style="display: block;position: relative">
                    
                       <a ><img src="../pic/position.png" ></a>
                        <span class="current-city">吉林大学</span>
                    <div class="user-entry" style="display: inline-block;">
                        <%
                          
                          if(tid1!=-1){%>
                              <a class="growth-entry user-up" ><%=tid1 %></a>
                            <a class="extra-entry" href="http://localhost/shujuku/logout.jsp">退出</a>
                            <a class="extra-entry" href="">教师</a><%
                          }else {%>
                            <a class="growth-entry user-up" href="http://localhost/WEB4/login/login1.jsp" >立即登录</a>
                          <%
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
<div id="main" class="col-main" style="margin-top:30px">
        <div class="skin-box-hd bzb">
            <h3>
                <span>打分信息</span>
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
            课程段ID
          </th>
          <th class="buy-table-top b">
           学生
          </th>
          <th class="buy-table-top b">
           授课老师
          </th>
          <th class="buy-table-top b">
           学期
          </th>
          <th class="buy-table-top b">
           年份
          </th>
          <th class="buy-table-top b">
           成绩
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

	// 定义一字符串变量，用于保存SQL语句
	String sql = null ;

  String gid=null;

  int ss;
  int cc;
  
%>
<%
	// 1、加载驱动程序
  //int sid1= Integer.valueOf((String)request.getParameter("sid"));
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
		
		
		// 为sql变量赋值INSERT INTO person (name,password) VALUES ('hwj','123456');
		sql = "select * from student_course NATURAL JOIN teaches JOIN course on teaches.course_id=course.course_id JOIN teacher on teaches.teacher_id=teacher.teacher_id where teaches.teacher_id='"+tid1+"'";
		rs = stmt.executeQuery(sql);

		while(rs.next()){
        ss=rs.getInt("student_id");
        cc=rs.getInt("course_id");
        %>
        <tr>
            <td class="buy-table-top" style="width:200px"><%=rs.getInt("course_id") %></td>
            <td class="buy-table-top" style="width:200px"><%=rs.getString("name") %></td>
            <td class="buy-table-top" style="width:200px"><%=rs.getInt("sec_id")%></td>
            <td class="buy-table-top" style="width:200px"><%=rs.getInt("student_id") %></td>
            <td class="buy-table-top" style="width:200px"><%=rs.getString("teacher_name") %></td>
            <td class="buy-table-top" style="width:200px"><%=rs.getString("semester") %></td>
            <td class="buy-table-top" style="width:200px"><%=rs.getString("year") %></td>
             <%
              if(rs.getInt("grade")>0){ %>
              <td class="buy-table-top" style="width:200px">
             <%=rs.getInt("grade")%>
              </td><%
            }
              else{ %>
              <td class="buy-table-top" style="width:200px">
              <form action="tograde.jsp">
                  <input type="hidden" name="ss" value="<%=ss%>">
                   <input type="hidden" name="cc" value="<%=cc%>">
                  <input type="text" name="grade" value="">
                  <input type="submit" value="打分" name="submit">
              </form>
                </td><%
            }
            %>
            
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