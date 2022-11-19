<%@page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html class="svg fp-enabled" style="overflow:visible; height:initial;" lang="zh-cn">
<head>	
	<meta charset="UTF-8">
	<title>教育系统-教师</title>
	<link rel="stylesheet" type="text/css" href="../css/main.css">
	<link rel="stylesheet" type="text/css" href="../css/index.css">
	<link rel="stylesheet" type="text/css" href="../css/animate.min.css">
	
</head>
<body id="main" class="fp-enabled"Onload="swapPic()"style='padding: 0px; overflow: hidden auto; background: rgba(0, 0, 0, 0) url("./firstpage/bg6.png") repeat fixed 0% 0%; '>
	<% 
    String user_id =(String)session.getAttribute("user_id");
    String user_id2=(String)request.getParameter("user_id2");
    if(user_id2!=null)
    	user_id=user_id2; 

    %>
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

	String sql = null ;

	Connection conn1 = null ;

	PreparedStatement pst=null;

	// 定义Statement对象，用于操作数据库
	Statement stmt1 = null ;

	// 定义一字符串变量，用于保存SQL语句
	String sql1 = null ;
  	String name=null;
  	String tid=null;

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
        //stmt = conn.createStatement() ;
		//String name ="521";
		// 为sql变量赋值INSERT INTO person (name,password) VALUES ('hwj','123456');
		sql = "select * from teacher where user_id="+user_id+"";
		stmt=conn.prepareStatement(sql);
		rs = stmt.executeQuery(sql);
		if(rs.next()){
			tid=rs.getString(1);
			System.out.println(tid);
			session.setAttribute("tid",tid) ;
			if(user_id2!=null){
				session.setAttribute("user_id2",user_id2);
			}
		}
		else{

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
	<link rel="stylesheet" type="text/css" href="../css/com_header.css">
	<script language="javascript" type="text/javascript">
	    var ranl = 0;
	    var useRand = 0;
	    images = new Array;
		images[1] = new Image();
		images[1].src = "../pic/5.jpeg";
		images[2] = new Image();
		images[2].src = "../pic/6.jpeg";
		
		function swapPic(){
		   var imgnum = images.length-1;
	       do{
		    var randnum = Math.random();
			randl = Math.round((imgnum-1)*randnum)+1;
		   }while(randl==useRand);
	        useRand = randl;
	        document.randimg.src = images[useRand].src		
			setTimeout('swapPic()',3000);
		}
	
 	</script>
  <div id="cb5" class="bg" style="background-image:url(http://imgs.3songshu.com/www/cb5.png); width:100%; height:1289px; position:absolute; position:fixed; left:0px; top:400px; "></div>
    <div id="cb4" class="bg" style="background-image:url(http://imgs.3songshu.com/www/cb4.png); width:100%; height:806px; position:absolute; position:fixed; left:0px; top:1000px; "></div>
    <div id="cb3" class="bg" style="background-image:url(http://imgs.3songshu.com/www/cb3.png); width:100%; height:823px; position:absolute; position:fixed; left:0px; top: 1700px;"></div>
    <div id="cb2" class="bg" style="background-image:url(http://imgs.3songshu.com/www/cb2.png); width:100%; height:1368px; position:absolute; position:fixed; left:0px; top: 2200px; "></div>
    <div id="cb1" class="bg" style="background-image:url(http://imgs.3songshu.com/www/cb1.png); width:100%; height:1902px; position:absolute; position:fixed; left:0px; top: 3000px;"></div>
    <div id="bg" class="bg" style="background-image:url(http://imgs.3songshu.com/www/yz.png); width:100%; height:4209px; position:absolute; position:fixed; left:0px; top:6500px; background-size: 100%;  "></div>

    <div id="scd" class="bg" style="background-image:url(http://imgs.3songshu.com/www/scd.png); width:547px; height:871px; position:absolute; position:fixed; left:100px; top:450px; "></div>
    <div id="xhy" class="bg" style="background-image:url(http://imgs.3songshu.com/www/xhy.png); width:100%; height:909px; position:absolute; position:fixed; left:0px; top:120px; "></div>
    <div id="yun4" class="bg" style="background-image:url(http://imgs.3songshu.com/www/yun4.png); width:972px; height:513px; position:absolute; position:fixed; left:0px; top:2600px; "></div>
    <div id="yun5" class="bg" style="background-image:url(http://imgs.3songshu.com/www/yun5.png); width:613px; height:760px; position:absolute; position:fixed; right:0px; top:2300px;"></div>
    <div id="yun3" class="bg" style="background-image:url(http://imgs.3songshu.com/www/yun3.png); width:100%; height:408px; position:absolute; position:fixed; left:0px; top:3000px; "></div>
     <div style="width: 10px; height: 700px; text-align: center; top:200px; z-index: 1;position: absolute; left: 50%; "></div>
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
								<a class="extra-entry" href="http://localhost/shujuku/logout.jsp">退出</a>
								<a class="extra-entry" href="">教师</a><%
							}else {%>
							  <a class="growth-entry user-up" href="http://localhost/shujuku/mainpage.jsp" >立即登录</a>
							<%
							}
						%>
						
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
		<div class="header-content clearfix">
			<div class="header-title-module">
				<div class="header-title">
					<a href=""><img src="../pic/jlu.jpg" ></a>
				</div>
			</div>
			
		</div>
	</div>
	<div class="page" style="z-index:1">
		<div class="index-container">
			<div class="banner-container" >
				<a ><img name="randimg"></a>
			</div>
			<div class="fullpage-main">
				<div class=" ibrand-wrap">
					<div class="ibrand-item left">
						<a class="ibrand-img img-box enlarge" >
							<img src="../pic/11.jpg" width="440" height="386">
						</a>
						<div class="ibrand-red" style="margin-left:-20px">
							<div class="ibrand-red_txt">
								<span class="ibrand-red_line">
								</span>
								<p>
									"求实创新，励志图强"
									<br>
									"全国重点综合性大学"
								</p>
							</div>
						</div>
						<div class="ibrand-slogan">
							<p>JILIN EDU</p>
							<p>SYSTEM</p>
							<p>WEB</p>
						</div>
						<div class="ibrand-top">
							
						</div>
						<a class="ibrand-link"href="">more＞
						</a>
					</div>
					<div class=" right">
						<a class="right-pic enlarge" style="right:0px">
							<img src="../pic/12.jpg"width="440" height="386">
						</a>
						<div class="ibrand-red" style="right:-20px">
							<div class="ibrand-red_txt">
								<span class="ibrand-red_line"style="margin-right:-20px">
								</span>
								<p>
									"学术立校、人才强校、创新兴校"
									<br>
									"开放活校、文化荣校"
								</p>
							</div>
						</div>
						<div class="ibrand-slogan-right" style="right:0">
							<p align="right">LEARN EDU</p>
							<p align="right">POWER</p>
							<p align="right">JLU</p>
						</div>
						<div class="ibrand-top"style="right:0">
							
						</div>	
					</div>
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
	                            <img src="../pic/jlu1.jpg" style="width: 200px; height:200px;padding-left:150px;padding-bottom:40px;margin-top:-20px">
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
	</div>
</body>
</html>
