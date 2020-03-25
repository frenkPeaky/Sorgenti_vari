<%-- uso della sessione --%>
<%@ page session="true"%>

<%-- import java --%>
<%@ page import="java.util.List, java.util.ArrayList"%>
<%@ page import="beans.*"%>

<%-- pagina per la gestione di errori --%>
<%@ page errorPage="errors/failure.jsp"%>


<html>

<head>
	<title>Start JSP</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/styles/default.css" type="text/css"/>
</head>


<body>

	
	<%
	String loginerror = (String) request.getAttribute("loginerror");
	if (loginerror != null && loginerror.length() > 0) {
		%>
		<h4><%=loginerror %></h4>
		<%
	}
	%>
				
		<script src="scripts/login.js" type="text/javascript"></script>
		<fieldset><legend>Login</legend>
			<form name="login" action="LoginServlet" onsubmit="return isAllCompiled(this)" method="post">
				<label for="username">Nome: </label>
				<input type="text" name="nome" placeholder="nome" required>
				<br />
				<label for="password">Cognome: </label>
				<input type="text" name="cognome" placeholder="cognome" required>
				<br />
				<input type="submit" value="Login">
			</form>
		</fieldset>	

</body>
</html>