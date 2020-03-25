<!-- pagina per la gestione di errori -->
<%@ page errorPage="../errors/failure.jsp"%>

<!-- accesso alla sessione -->
<%@ page session="true"%>

<!-- import di classi Java -->
<%@ page import="beans.*"%>
<%@ page import="java.util.*" %>


<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Compra articoli</title>
</head>
<body>
	<h1>Compra articoli</h1>
	<fieldset>
	<script src="scripts/login.js" type="text/javascript"></script>
		<form name="griglia" action="finalizza.jsp" onsubmit="return isAllCompiled(this)" method="post">	
		<%
			ServletContext app = getServletContext();
			ListaProdotti lista= (ListaProdotti)app.getAttribute("lista");
			for(Prodotto p: lista.getLista()){
		%>
				<label for="<%=p.getId()%>"><%=p.toString()%> </label>
				<input type="number" name="<%=p.getId()%>" placeholder="0" required>
		<%} %>
		<input type="submit" value="Finalizza">
		</form>		
	</fieldset>	
</body>
</html>