<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>
</head>

<style>
	.test{
		background-color:#ccc;
	}
</style>

<body>

	<s:form action="login" cssClass="test" tooltip="登录">
		<s:textfield name="userName" key="user" tooltip="Login"/>
		<s:textfield name="password" key="pass"/>
		<s:submit key="login"/>
		<s:token/>
		<!-- <input type="submit" id="registe" value="注册"/> -->
	</s:form>
	
	<form action="login">
		<input type="text" name="userName"/>
		<input type="password" name="password"/>
		<input type="submit" value="Submit"/>
	</form>
	
	<%-- <s:form action="forward">
		<s:textfield name="pageName" key="page"/>
		<s:submit key="forward"/>
	</s:form> --%>
	
	
	<s:property value="@java.lang.String@valueOf(5)"/>
	<br>
	<s:property value="@java.lang.Math@PI"/>
	
	
	<br>
	<br>
	
	
	<s:iterator  value="{'1','2','3','4','5'}" var='number'> 
    	<s:property value='number'/>A 
	</s:iterator> 
	
	<!-- 没有ID属性，用var -->
	<s:iterator begin="1" end="2" value="{'One', 'two', 'three'}" var="list" status="st">
		<p 
		<s:if test="#st.odd">style="color:red;"</s:if> 
		<s:else>style="color:blue; text-shadow:0 0 5px #ccc; font-size:30px;"</s:else>
		>
		<s:property value="list"/>
		</p>
	</s:iterator>
	
	<!-- 拼接 -->
	<h1>s:append</h1>
	<s:append var="list">
		<s:param value="{'lishuai', 'dangerous'}"/>
		<s:param value="{'haolidong'}"/>
	</s:append>
	<s:iterator value="#list" var="element" status="st">
		<a href="javascript:void(0);"><s:property value="#st.count"/></a>
		<span><s:property value="element"/></span>
		<br>
	</s:iterator>
	
	<h1>s:merge</h1>
	<s:merge var="mergeList">
		<s:param value="{'lishuai', 'dangerous'}"/>
		<s:param value="{'haolidong'}"/>
	</s:merge>
	<s:iterator value="#mergeList" var="element" status="st">
		<a href="javascript:void(0);"><s:property value="#st.count"/></a>
		<span><s:property value="element"/></span>
		<br>
	</s:iterator>
	
	<h1>s:generator</h1>
	<s:generator separator="," val="'lishuai,haolidong,dangerous'">
		<s:iterator var="str" status="st">
			<a href="javascript:void(0);"><s:property value="#st.count"/></a>
			<span><s:property value="#str" /></span>
			<br>
		</s:iterator>
	</s:generator>
	
	<h1>s:subset</h1>	
	<s:subset source="{'One', 'two', 'three'}" start="1" count="2">
		<s:iterator>
			<p><s:property /></p>
		</s:iterator>
	</s:subset>
	
	<h1>s:sort</h1>
	<s:bean var="mycomparator" name="me.lishuai.strutsdemo.util.MyComparator" />
	<s:sort source="{'lishuai', 'haolidong', 'dangerous'}" comparator="#mycomparator">
		<s:iterator>
			<p><s:property/></p>
		</s:iterator>
	</s:sort>
	
	<!-- 无法用s:param给action传参数，只能把本页面的参数传给action -->
	<h1>s:action</h1>
	<s:action name="login" executeResult="true">
		<s:param name="userName" value="'haolidong'"/>
		<s:param name="password" value="'haolidong'"/>
	</s:action>
	
	<h1>s:bean</h1>
	<s:bean name="me.lishuai.strutsdemo.beans.Student" var="student">
		<s:param name="name" value="\"dangerous\""/>
		<s:param name="sex" value="'man'"/>
		<s:param name="age" value="23"/>
		student name:<s:property value="name"/><br>
		student sex :<s:property value="sex"/><br>
		student age :<s:property value="age"/><br>
	</s:bean>
	<s:property value="#student.name"/><br>
	<s:textfield name="#student.name"/>
	
	<h1>s:date</h1>
	<s:bean name="java.util.Date" var="now"/>
	<s:date name="#now" format="dd/MM/yyyy"/>
	
	<h1>s:url</h1>
	<s:url action="login" var="login">
		<s:param name="userName" value="'haolidong'"/>
		<s:param name="password" value="'haolidong'"/>
	</s:url>
	<a href="${login}">登录</a>
	
	
	
	<br><br>
	<script>
		var register = document.getElementById("registe");
		register.onclick = function(){
			document.forms[0].action = "RegisteAction";
		}
	</script>
	
	<s:debug/>
	
</body>
</html>