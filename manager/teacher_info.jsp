<%@page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>教学系统-管理员-教师信息</title>
   <link rel="stylesheet" type="text/css" href="../css/main.css">
    <link rel="stylesheet" type="text/css" href="../css/index.css">
    <link rel="stylesheet" type="text/css" href="../css/com_header.css">
     <link rel="stylesheet" type="text/css" href="../css/table.css">
</head>

<body style="background-color: #353C47">
    <%
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
                              <a class="growth-entry user-up" href="http://localhost/shujuku/mainpage.jsp" >立即登录</a>
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
                </div>  
            </div>
        </div>
        
</div>
<div id="main" class="col-main" style="margin-top:30px">
        <div class="skin-box-hd bzb">
            <h3>
                <span>教师信息</span>
            </h3>
        </div>
        <div class="skin-box-up">
            <div class="skin-box-act" >
             <table class="buy-table">
                 <tr>
         <th class="buy-table-top b w">
            ID
          </th>
          <th class="buy-table-top b w">
            姓名
          </th>
          <th class="buy-table-top b w">
           性别
          </th>
          <th class="buy-table-top b w">
           民族
          </th>
          <th class="buy-table-top b w">
           职称
          </th>
          <th class="buy-table-top b w">
           学院
          </th>
          <th class="buy-table-top b w">
           修改
          </th>
          <th class="buy-table-top b w">
           删除
          </th>
           <th class="buy-table-top b">
           登录
          </th>
        </tr>

		<%!
	// 定义数据库驱动程序
  String basePath="http://localhost/shujuku/manager/";
	String DBDRIVER = "com.mysql.jdbc.Driver" ;
	// 定义数据库连接地址
	String DBURL = "jdbc:mysql://127.0.0.1:3306/education?useSSL=false" ;
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


  // 定义Statement对象，用于操作数据库
  Statement stmt1= null ;

  // 定义一字符串变量，用于保存SQL语句
  String sql1 = null ;

  PreparedStatement pst=null;
  int id;
  int user_id1=-1;
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
		sql = "select * from teacher";
		rs = stmt.executeQuery(sql);
		while(rs.next()){
        id=rs.getInt(1);
        user_id1=rs.getInt(7);
        %>
        <tr>
            <td class="buy-table-top"><%=rs.getInt(1) %></td>
            <td class="buy-table-top"><%=rs.getString(2)%></td>
            <td class="buy-table-top"><%
                if(rs.getInt(3)==0){%>
                女
                <%}
                else{%>男<%}
                %></td>
            <td class="buy-table-top"><%=rs.getString(4) %></td>
            <td class="buy-table-top"><%=rs.getString(5) %></td>
            <td class="buy-table-top"><%=rs.getString(6) %></td>
            <th class="buy-table-top">
               <form action="changeteacher.jsp">
                  <input type="hidden" name="id2" value="<%=id%>">
                  <input type="submit" value="修改" name="submit">
                </form>
            </th>
            <th class="buy-table-top" >
                <form action="deleteteacher.jsp">
                  <input type="hidden" name="id" value="<%=id%>">
                  <input type="submit" value="删除" name="submit">
                </form>
             
            </th>
            <th class="buy-table-top" >
                <form action="../teacher/teacher.jsp">
                  <input type="hidden" name="user_id2" value="<%=user_id1%>">
                  <input type="submit" value="登录" name="submit">
                </form>
             
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
		// 关闭连接
		conn.close() ;
	}
	catch(Exception e)
	{
		out.println("数据库关闭失败！！！"+e) ;
	}
%>
<div class="skin-box-hd bzb">
            <h3>
               <form action="addteacher.jsp">
                <input type="hidden" name="id1" value="<%=id%>">
                  <input type="submit" value="添加教师" name="submit">
                </form>
            </h3>
        </div>
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