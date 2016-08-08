<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="succPage" /></title>
</head>
<body>




	<s:text name="succTip">
		<s:param>${sessionScope.user}</s:param>
	</s:text>
	
	<br>
	<s:property value="#userName"/>
	<p>#session.user</p>
	<p>#session['user']</p>
	<p>#session["user"]</p>
	<p>${userName}</p>
	
</body>
</html>