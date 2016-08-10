<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 5px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="viewAllForm.title"/></title>
</head>
<body>
<h3><spring:message code="viewAllForm.heading"/></h3> &ensp;&emsp; <h5><a href="sucess">Click Here for HOME Page</a></h5>

	<table style="width:100%">
 <tr>
 	<th><spring:message code="viewAllForm.id"/></th>
    <th><spring:message code="viewAllForm.firstName"/></th>
    <th><spring:message code="viewAllForm.lastName"/></th>
    <th><spring:message code="viewAllForm.middleName"/></th>
    <th><spring:message code="viewAllForm.gender"/></th>
    <th><spring:message code="viewAllForm.mobileNumber"/></th>
    <th><spring:message code="viewAllForm.email"/></th>
    <th><spring:message code="viewAllForm.country"/></th>
    <th><spring:message code="viewAllForm.address"/></th>
    <th><spring:message code="viewAllForm.pinCode"/></th>
    <th><spring:message code="viewAllForm.linkdelete"/></th>
    <th><spring:message code="viewAllForm.linkupdate"/></th>
  </tr>
  
  <c:forEach var="contactList" items="${contactList}">
<tr>
<td>${contactList.id}</td>

<td>${contactList.firstName}</td>

<td>${contactList.lastName}</td>

<td>${contactList.middleName}</td>

<td>${contactList.gender}</td>

<td>${contactList.mobileNumber}</td>

<td>${contactList.email}</td>

<td>${contactList.country}</td>

<td>${contactList.address}</td>

<td>${contactList.pinCode}</td>  

<td><a href="<spring:url value="delete?id=${contactList.id}"/>">DELETE</a></td>
<td><a href="<spring:url value="edit?id=${contactList.id}"/>">Update</a></td>
</tr>
</c:forEach>  
</table>
</body>
</html>