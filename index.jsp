<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>数据结构可视化模拟器</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="dist/sidebar-menu.css">


<style type="text/css">
.main-sidebar{
	position: absolute;
	top: 0;
	left: 0;
	height: 100%;
	min-height: 100%;
	width: 230px;
	
	background-color: #222d32;
 }
.centercontent { 
margin-left: 230px;
height:700px;
min-height: 100%;
width:920px;
background-color:#ffffff;
}
</style>
</head>
<body>
<div class="main-sidebar">
<section  class="sidebar">
	<ul class="sidebar-menu">
	  <li class="header">目录</li>
	  <li class="treeview">
		<a href="linearlist.jsp" target="main">
		  <i class="fa fa-dashboard"></i> <span>链表</span> 
		  <i class="fa fa-angle-left pull-right"></i>
		</a>
	  </li>
	  <li class="treeview">
		<a href="CQ.jsp" target="main">
		  <i class="fa fa-files-o"></i> <span>循环队列</span>
		  <i class="fa fa-angle-left pull-right"></i>
		</a>
	  </li>
	  <li>
		<a href="BST.jsp" target="main">
		  <i class="fa fa-th"></i> <span>二叉搜索树</span>
		  <i class="fa fa-angle-left pull-right"></i>
		</a>
	  </li>
	  <li class="treeview">
		<a href="#">
		  <i class="fa fa-pie-chart"></i> <span>图</span>
		  <i class="fa fa-angle-left pull-right"></i>
		</a>
	  </li>
	  <li class="treeview">
		<a href="#">
		  <i class="fa fa-laptop"></i> <span>广义表</span>
		  <i class="fa fa-angle-left pull-right"></i>
		</a>
	</ul>
  </section>
 </div>
<script src="js/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="./dist/sidebar-menu.js"></script>
<script>
$.sidebarMenu($('.sidebar-menu'))
</script>
 <div class="centercontent">
    <iframe name="main"  src="home.jsp" id="contents" height=700 width=1020 marginheight="10" marginwidth="10"
    frameborder=1 scrolling=no ></iframe>
 </div>
	   
</body>
</html>