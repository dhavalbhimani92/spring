<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
#LoginPage{
    position: fixed;
    width: 500px;
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
    font-size: x-large;
}

.button {
    text-align: center;
    display: block;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="Contact.js"></script>
    <script>
    $(document).ready(function(){
        $("#Main form").css({
        	"width" : $(window).width() + "px",
        	"height" : $(window).height() + "px",
        })     
        	ValidateForm();
         });


    // Function definition : <Enter a brief note of what this function does>
    function ValidateForm(){
    		// main code goes here
            $("#Submit_Btn").on("click", function(){
        		$(".Contact_Validation").remove();
               console.log("fname")
                // Validation for Username
                if ($("#UserName_Txb").val().trim() == "") {
                    $("#Error_Div").append("<div class='Contact_Validation' style='color: red;'><b>UserName Invalid:</b>Please enter a valid UserName.</div>")
                    $("#UserName_Txb").focus()
                    return
                }
               //validation for Password
                if ($("#Password_Txb").val().trim() == "") {
                    $("#Error_Div").append("<div class='Contact_Validation' style='color: red;'><b></b>Please enter a valid Password.</div>")
                    $("#Password_Txb").focus()
                    return
                }
            });
    }
    </script>
</head>
<body>
<form:form modelAttribute="newLogin" action="authenticationPage">
	<div id="LoginPage">
		<div style="colour: #FF0000;">${error }</div>
		<div id="Title_Div"><spring:message code="login.title"/></div>
		<div class="Float">
			<Label id="UserName_Lbl" ><spring:message code="login.username"/></Label>
			<form:input id="UserName_Txb" type="text" name="userName" path="userName"/>
			<form:errors path="userName"/>		
		</div>
		<div class="Float">
			<Label id="Password_Lbl"><spring:message code="login.password"/></Label>
			<form:input id="Password_Txb" type="password" name="password" path="password"/>	
			<form:errors path="password"/>	
		</div>	
		<div class="Float button">
			<input id="Login_Btn" type="submit" value="Login"/>
		</div>
	</div>
	
</form:form>
</body>
</html>

