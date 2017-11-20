<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="kr">
	<head>
	<meta charset="UTF-8">
	<title>http://www.blueb.co.kr</title>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>

<script type="text/javascript">

$(function(){
	
	$("menu_state").click(function(){
		  // action goes here!!
	});
	
	  $("ul.sub").hide();
	
		 $("ul.menu li").hover(function(){
			$("ul:not(:animated)",this).slideDown("fast");
			},
			function(){
			   $("ul",this).slideUp("fast");
			}
      	 ); 
 });	
</script>


	
<style type="text/css">

input[type="checkbox"]#menu_state {
  display: none;
}
input[type="checkbox"]:checked ~ nav {
  width: 250px;
}
input[type="checkbox"]:checked ~ nav label[for="menu_state"] i::before {
  content: "\f053";
}
input[type="checkbox"]:checked ~ nav ul {
  width: 100%;
}
input[type="checkbox"]:checked ~ nav ul li a i {
  border-right: 1px solid #2f343e;
}
input[type="checkbox"]:checked ~ nav ul li a span {
  opacity: 1;
  transition: opacity 0.25s ease-in-out;
}
input[type="checkbox"]:checked ~ main {
  left: 250px;
}
nav {
  position: fixed;
  z-index: 9;
  top: 0;
  left: 0;
  bottom: 0;
  background: #383e49;
  color: #9aa3a8;
  width: 50px;
  font-family: 'Montserrat', sans-serif;
  font-weight: lighter;
  transition: all 0.15s ease-in-out;
}
nav label[for="menu_state"] i {
  cursor: pointer;
  position: absolute;
  top: 50%;
  right: -8px;
  box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
  background: #fff;
  font-size: 0px;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 15px;
  width: 15px;
  border-radius: 50%;
  border: 1px solid #ddd;
  transition: width 0.15s ease-in-out;
  z-index: 1;
}
nav label[for="menu_state"] i::before {
  margin-top: 2px;
  content: "\f054";
}
nav label[for="menu_state"] i:hover {
  box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
}
nav ul {
  overflow: hidden;
  display: block;
  width: 50px;
  list-style-type: none;
  padding: 0;
  margin: 0;
}
nav ul li {
  border: 1px solid #2f343e;
  position: relative;

}

nav ul li:not(:last-child) {
  border-bottom: none;
}
nav ul li.active a {
  background: #4c515d;
  color: #fff;
}
nav ul li a {
  position: relative;
  display: block;
  white-space: nowrap;
  text-decoration: none;
  color: #9aa3a8;
  height: 50px;
  width: 100%;
  transition: all 0.15s ease-in-out;
}
nav ul li a:hover {
  background: #4c515d;
  
}
nav ul li a * {
  height: 100%;
  display: inline-block;
}
nav ul li a i {
  text-align: center;
  width: 50px;
  z-index: 999999;
}
nav ul li a i.fa {
  line-height: 50px;
}
nav ul li a span {
  padding-left: 25px;
  opacity: 0;
  line-height: 50px;
  transition: opacity 0.1s ease-in-out;
}
main {
  position: absolute;
  transition: all 0.15s ease-in-out;
  top: 0;
  left: 50px;
}


main header {
  position: absolute;
  z-index: -1;
  top: 0;
  left: 0;
  right: 0;
  height: 400px;
  background-size: cover;
  background-position: 50% 50%;
  background-repeat: no-repeat;
}




</style>
</head>
<body>
<input type="checkbox" id="menu_state" checked>
<nav>
	<label for="menu_state">
	<i class="fa"></i>
	</label>
	<ul class="menu">
		<li data-content="5" class="active ">
			<a href="javascript:void(0)">
				<i class="fa fa-inbox">1</i>
				<span>test1</span>
			</a>
			  <ul class="sub">
		    <li><a href="#">서브메뉴A</a></li>
			<li><a href="#">서브메뉴A</a></li>
			<li><a href="#">서브메뉴A</a></li>
		 </ul>
			
		</li>
		<li class="active ">
			<a href="javascript:void(0)">
				<i class="fa fa-heart">2</i>
				<span>test2</span>
			</a>
			
			 <ul class="sub">
		    <li><a href="#">서브메뉴B</a></li>
			<li><a href="#">서브메뉴B</a></li>
			<li><a href="#">서브메뉴B</a></li>
		</ul>
			
		</li>
		<li class="active ">
			<a href="javascript:void(0)">
				<i class="fa fa-paper-plane">3</i>
				<span>test3</span>
			</a>
		 <ul class="sub">
		    <li><a href="#">서브메뉴B</a></li>
			<li><a href="#">서브메뉴B</a></li>
			<li><a href="#">서브메뉴B</a></li>
		</ul>
		
		</li>
		<li class="active ">
			<a href="javascript:void(0)">
				<i class="fa fa-pencil">4</i>
				<span>test4</span>
			</a>
			 <ul class="sub">
		    <li><a href="#">서브메뉴B</a></li>
			<li><a href="#">서브메뉴B</a></li>
			<li><a href="#">서브메뉴B</a></li>
		</ul>
			
		</li>
		<li data-content="2" class="active ">
			<a href="javascript:void(0)">
				<i class="fa fa-trash">5</i>
				<span>test5</span>
			</a>
			 <ul class="sub">
		    <li><a href="#">서브메뉴B</a></li>
			<li><a href="#">서브메뉴B</a></li>
			<li><a href="#">서브메뉴B</a></li>
		</ul>
			
		</li>
	</ul>
</nav>
<main>
	<header>test</header>

</main>
</body>
</html>

