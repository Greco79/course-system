<%@page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
	<meta charset="UTF-8" />
	<title>退出用户</title>
	<style type="text/css">
	body{
		margin: 0px;
		padding: 0px;
		background: url(pic/2.jpg) no-repeat;
		background-size: cover;
	}
	.two1{
		width: 360px; 
		height: 260px;
		position:absolute;
		top:150px; 
		left:500px; 
		border:1px solid grey;
		border-radius: 5px;
		-moz-opacity:0.85;
		filter:alpha(Opacity=85);
		opacity: 0.85;
		background-color:dimgrey;
		/*background-color:FF3330;*/
		z-index:0;
	}
	.two2{
		width: 100px; 
		height: 30px;
		position:relative;
		margin-top:20px;
		margin-left:130px;
		background-color: white;
		line-height: 
		
	}
	.two3{
		width: 360px; 
		height: 80px;
		position:relative;
		margin-top:20px;
		margin-left:50px;

	}

	.bzb{
		color:black; 
		font-size:24px;
		
   		
   		text-align: center;
   		text-decoration: none;
   		vertical-align: middle;
	}
	.b{
		font-weight:bold;
		font-size:38px;
	
		color: #000000;
		
		text-decoration: none;

	}


	</style>
</head>
<body>
	
	<script>

		function yes(){
			<%    
 session.invalidate(); 
 
%>
			window.location.href= "javascript:history.go(-1)";
		}
	</script>
	
   <div id="bgimg"></div>
	<div class="one1">
		<div class="two1" method="post" action="logout.jsp">
				<div class="two3">
					<a class="b" type="text" style=""/>是否确定退出？</a>
					
				</div>
				<div class="two2" align="center" vertical-align="middle">
					<a class="bzb"  href="mainpage.jsp"/>确定</a>
					
				</div>
				<div class="two2"align="center" vertical-align="middle">
					
					<a class="bzb" href="javascript:history.go(-1)"/>返回</a>	
				</div>
				
		</div>
	</div>
	
	


</body>
</html>