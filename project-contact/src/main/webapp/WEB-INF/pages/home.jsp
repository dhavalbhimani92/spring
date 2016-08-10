<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<!DOCTYPE html>
<html>
<head>
 <style>
 #HomePage{
 	width: 100%;
 	height: 100%;
 }
 .Icon{
	width:150px;
	height:150px;
}
#Div1,#Div2{
	display: flex;
}

#Title_Div{
	background-color: antiquewhite;
	text-align: center;
    height: 20px;
    text-decoration: underline;
    font-size: larger;
    font-weight: bold;
}

.padding {
	padding: 33px ;
	width: 30%;
}

.button{
	background-color: bisque;
    font-weight: bold;
    border-radius: 10px;
    width: 72px;
}
 </style>
 </head>

<body>
	<div id="HomePage">
		<div id="Title_Div">Home</div>
		<form:form  modelAttribute="newContactBean" action="insert">
		<div id="Div1">
			<div id="Add_Div" class="padding">
				<div style="text-align: center"><img src="F:\java-installations\java-workspace\project-contact\src\main\webapp\images\AddIcon.png" class="Icon" alt="Add Icon" align="center"></div>
				<div style="text-align: center; padding:20px">
				<input id="Add_Btn" class="button" type="submit" value="Add"></input>
				</div>
			</div>
			</form:form>
			
			<form:form action="view">
			<div id="Edit_Div" class="padding">
				<div style="text-align: center"><img src="F:\java-installations\java-workspace\project-contact\src\main\webapp\images\EditIcon.png" class="Icon" alt="Edit Icon"></div>
				<div style="text-align: center; padding:20px">
				<input id="Edit_Btn" class="button" type="submit" value="Edit"></input>
				</div>
			</div>
			</form:form>
			
			<form:form action="view">
			<div id="Delete_Div" class="padding">
				<div style="text-align: center"><img src="F:\java-installations\java-workspace\project-contact\src\main\webapp\images\DeleteIcon.png" class="Icon" alt="Delete Icon"></div>
				<div style="text-align: center; padding:20px">
				<input id="Delete_Btn" class="button" type="submit" value="Delete"></input>
				</div>
			</div>
			</form:form>
		</div>
		<form:form action="view">
		<div id="Div2">

			<div id="List_Div" class="padding" style="padding-left:165px">
				<div style="text-align: center"><img src="F:\java-installations\java-workspace\project-contact\src\main\webapp\images\ListIcon.png" class="Icon" alt="List Icon"></div>
				<div style="text-align: center; padding:20px">
				<input id="List_Btn" class="button" type="submit" value="List"></input>
				</div>
			</div>
		</form:form>
		
		<form:form  modelAttribute="  " action="search">
			<div id="Search_Div" class="padding">
				<div style="text-align: center"><img src="F:\java-installations\java-workspace\project-contact\src\main\webapp\images\SearchIcon.png" class="Icon" alt="Search Icon"></div>
				<div style="text-align: center; padding:20px">
				<input id="Search_Btn" class="button" type="submit" value="Search"></input>
				</div>
			</div>
			</form:form>
		</div>
	</div>
</body>
</html>

