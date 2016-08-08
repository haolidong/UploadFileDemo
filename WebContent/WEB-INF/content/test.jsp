<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/jquery.mousewheel.min.js"></script>
<script src="js/jquery.mCustomScrollbar.min.js"></script>
</head>
<body>
	<!-- 访问不到WEB-INF下的图片 -->
	<img src="img/loc.png"/>
	<!-- 但是可以访问WEB-INF外面的 -->
	<img src="images/loc.png"/>

  <div>
    <p>some text</p>
    <p>some text</p>
    <p>some text</p>
    <p>some text</p>
    <p>some text</p>
    <p>some text</p>
    <p>some text</p>
    <p>some text</p>
    <p>some text</p>
    <p>some text</p>
    <p>some text</p>
    <p>some text</p>
    <p>some text</p>

  </div>


<style>
  div {
    width: 100px;
    height: 100px;
    overflow: auto;
    background: #ccc;
  }
</style>


<script>

  $('div').mCustomScrollbar({
		scrollInertia: 300,
		mouseWheel:{ scrollAmount: 100 }
	});

</script>

</body>
</html>
