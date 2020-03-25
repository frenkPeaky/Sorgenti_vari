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
	<title>Riassunto acquisti</title>
</head>
<body>
	<h1>Riassunto acquisti</h1>
	<fieldset>	
		<ul>
		<%
			ServletContext app = getServletContext();
			ListaProdotti lista= (ListaProdotti)app.getAttribute("lista");
			for(Prodotto p: lista.getLista()){
				int presi=Integer.parseInt(request.getParameter(p.getId()));
				if(presi>0)
		%>
				<li> <%=p.getId() %> = <%=presi%></li>
		<%
				HttpSession ses=request.getSession();
				ses.setAttribute(p.getId(), presi);
			} %>		
		</ul>
		<a href="AcquistiServlet" type="button">Finalizza</a>	
	</fieldset>	
</body>
</html>