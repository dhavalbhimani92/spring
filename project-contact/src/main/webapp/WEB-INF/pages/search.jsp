<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search</title>
<style>
#SearchPage{
    position: fixed;
    width: 650px;
    display: inline-block;
    background-color: bisque;
    border: 1px solid gray;
    left: 30%;
    top: 20%;
}
.Float {
    float: left;
    width: 100%;
    display: flex;
    padding: 5px;
}
Label{
	    width: 50%;
    
}

#Title_Div{
	text-align: center;
    font-style: italic;
    font-size: larger;
    font-weight: bolder;
}

.button {
    text-align: center;
    display: block;
}
</style>
</head>
<body>
<form:form  modelAttribute="contactBean" action="searchContact">
	<div id="SearchPage">
		<div id="Title_Div">Search contact by Name and Email-id</div>
		<div class="Float">
			<Label id="FName_Lbl" >First Name:</Label>
			<form:input id="FName_Txb" type="text" name="firstName" path="firstName"/>		
		</div>
		<div align="center">And</div>
		<div class="Float">
			<Label id="Email_Lbl">E-Mail Id:</Label>
			<form:input id="Email_Txb" type="text" name="email" path="email"/>	
		</div>
		<div class="Float button">
			<input id="Search_Btn" type="submit" value="Search For Contact"></input>
			<input id="Clear_Btn" type="reset" value="Clear Search"></input>
		</div>
	</div>
	
</form:form>
</body>
</html>