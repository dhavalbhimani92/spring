<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Contact</title>
 <link href="Contact.css" rel="stylesheet" type="text/css" />
 <style>
 .Float {
    float: left;
    width: 100%;
    display: flex;
    padding: 5px;
}
#Main{
	width: 100%;
	    height: 100%;
        display: inline-block;
    background-color: bisque;
        border: 1px solid gray;
}
Label{
	    width: 50%;    
}
select{
	width: 175px;
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
#Error_Div{
	Word-wrap: break-word;
	padding-top: 10px;
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
                // Validation for empty First Name field
                if ($("#FName_Txb").val().trim() == "") {
                    $("#Error_Div").append("<div class='Contact_Validation' style='color: red;'><b>First Name Invalid:</b> First Name cannot be empty. Please enter a valid First Name.</div>")
                    $("#FName_Txb").focus()
                    return
                }

                // Validation for empty mobile field
                if ($("#MobileNo_Txb").val().trim() == "") {
                    $("#Error_Div").append("<div class='Contact_Validation' style='color: red;'><b>MobileNumber Invalid:</b>Mobile Number cannot be empty. Please enter a valid Mobile Number</div>")
                    $("#MobileNo_Txb").focus()
                    return
                }

                // validation for First Name length 
                var xMaxLength = $("#FName_Txb").attr("maxlength")
                if ($("#FName_Txb").val().length > xMaxLength) {
                    $("#Error_Div").append("<div class='Contact_Validation' style='color: red;'><b>First Name Invalid:</b> First Name maximum length (" + xMaxLength + ")</div>")
                    $("#FName_Txb").focus()
                    return
                }

                // Validation for empty Email field
                if ($("#Email_Txb").val().trim() == "") {
                    $("#Error_Div").append("<div class='Contact_Validation' style='color: red;'><b>Email Address Invalid:</b> Email Address cannot be empty. Please enter a valid email address.</div>")
                    $("#Email_Txb").focus()
                    return
                }

                // Validation for Email-id
                var xInputVal = $("#Email_Txb").val().trim()
                var ssnPattern = /[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}$/
                if (!ssnPattern.test(xInputVal)) {
                    $("#Error_Div").append("<div class='Contact_Validation' style='color: red;'><b>Email Address Invalid:</b> Please enter a valid email address (e.g. username@gmail.com)</div>")
                    $("#Email_Txb").focus()
                    return
                }
                
                // Validation for Mobile Number
                var xInputVal = $("#MobileNo_Txb").val().trim()
                var ssnPattern = /^[7-9]{1}[0-9]{9}$/;
                if (!ssnPattern.test(xInputVal)) {
                    $("#Error_Div").append("<div class='Contact_Validation' style='color: red;'><b>Mobile Number Invalid:</b> Please enter a valid Mobile Number (e.g. 9876543210)</div>")
                    $("#MobileNo_Txb").focus()
                    return
                }

            });
    }
    </script>
</head>
<body>
<form:form  modelAttribute="newContactBean" action="insertNew">
	<div id="Main">
		<div id="Title_Div">Contact</div>
		<div id="Error_Div"></div>
		<div class="Float">
			<Label id="FName_Lbl" ><spring:message code="form.fname.label"/></Label>
			<form:input id="FName_Txb" type="text" name="firstName" maxlength="20" path="firstName"/>
			<form:errors path="firstName"/>		
		</div>
		
		<div class="Float">
			<Label id="LName_Lbl"><spring:message code="form.lname.label"/></Label>
			<form:input id="LName_Txb" type="text" name="lastName" maxlength="20" path="lastName"/>		
		</div>	
		
		<div class="Float">
			<Label id="MiddleName_Lbl"><spring:message code="form.mname.label"/></Label>
			<form:input id="Middle_Txb" type="text" name="middleName" path="middleName"/>	
		</div>
		
		<div class="Float">
			<Label id="Gender_Lbl"><spring:message code="form.gender.label"/></Label>
			<form:radiobutton  value="male" path="gender"/><spring:message code="form.gender.value.male.label"/>
  			<form:radiobutton  value="female" path="gender"/><spring:message code="form.gender.value.female.label"/>
		    <form:errors path="gender"/>
		</div>
		
		<div class="Float">
			<Label id="MobileNo_Lbl"><spring:message code="form.mobilenumber.label"/></Label>
			<form:input id="MobileNo_Txb" type="text" name="mobileNumber" maxlength="20" path="mobileNumber"/>
			<form:errors path="mobileNumber"/>	
		</div>
		
		<div class="Float">
			<Label id="Email_Lbl"><spring:message code="form.email.label"/></Label>
			<form:input id="Email_Txb" type="text" name="email" path="email"/>	
			<form:errors path="email"/>
		</div>		
		
		<div class="Float">
			<Label id="Country_Lbl"><spring:message code="form.country.label"/></Label>
			<form:input id="Country_Txb" type="text" name="country" path="country"/>	
		</div>
		
		<div class="Float">
			<Label id="Address_Lbl"><spring:message code="form.address.label"/></Label>
			<form:textarea id="Address_Txb" rows="3" cols="22" name="address" path="address"/>
		</div>
		
		
		<div class="Float">
			<Label id="PinCode_Lbl"><spring:message code="form.pin.label"/></Label>
			<form:input id="PinCode_Txb" type="text" name="pinCode" path="pinCode"/>	
		</div>
		
		<div class="Float button">
			<input id="Submit_Btn" type="submit" value="Submit"></input>
			<input id="Cancel_Btn" type="button" value="Cancel"></input>	
		</div>
	</div>
	
</form:form>

</body>
</html>