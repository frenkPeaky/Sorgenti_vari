package servlets;
import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import beans.ListaProdotti;
import beans.Prodotto;

public class AcquistiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = getServletContext();
		HttpSession ses= request.getSession();
		boolean quantita=true;
		ListaProdotti lista= (ListaProdotti)application.getAttribute("lista");
		for(Prodotto p: lista.getLista()) {
			int presi =(int)ses.getAttribute(p.getId());
			if(p.getQuantita()<presi) {
				application.setAttribute("aqError", "Errore nelle quantità");
				quantita=false;
			}
		}
		
		if(quantita == true) {
			application.removeAttribute("aqError");
			response.sendRedirect(request.getContextPath() + "/Login.jsp");
			aggiornaProdotti(lista);
		}else {
			response.sendRedirect(request.getContextPath() + "/elenco.jsp");
		}
	}

	private void aggiornaProdotti(ListaProdotti lista) {
		// TODO Auto-generated method stub
		//cavare quantita comprate e ricalibrare prezzo
		//aggiungere un campo Prezzo iniziale a Prodotto che serve per la ricalibrazione del prezzo
	}
}
