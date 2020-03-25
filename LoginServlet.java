package servlets;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import beans.ListaProdotti;


public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		
		//INIZIALIZZAZIONE dei parametri della nostra servlet		
		ServletContext application = getServletContext();
		synchronized (application) {
			ListaProdotti lista = (ListaProdotti) application.getAttribute("lista");
			if ( lista == null) {
				lista = new ListaProdotti();
				application.setAttribute("lista", lista);
			}
		}
	}

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// AUTENTIFICAZIONE		
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		if (ceckCredenziali(nome,cognome)) {
				request.removeAttribute("loginerror");
				request.getSession().setAttribute("nome", nome);
				request.getSession().setAttribute("nome", cognome);
				getServletContext().getRequestDispatcher("/elenco.jsp").forward(request, response);
		}
		else {
			request.setAttribute("loginerror", "Utente non valido");
			getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
		}		
	}

	private boolean ceckCredenziali(String nome, String cognome) {
		// TODO Auto-generated method stub
		return true;
	}

}
