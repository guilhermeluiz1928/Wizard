package br.com.wizard.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.wizard.dao.NoticiasDao;
import br.com.wizard.model.Noticias;

@WebServlet("/DelNoticias")
public class DelNoticias extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DelNoticias() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		Noticias noticias = new Noticias();
		NoticiasDao noticiasDao = new NoticiasDao();
		
		noticias.setId(id);
		
		String retorno = noticiasDao.excluir(noticias);
		
		if(retorno.equals("sucesso")){
			response.sendRedirect("./consnoticias");
		}else{
			request.setAttribute("erro", "Não foi possível excluir a noticia! Erro: " + noticias.getMsgErro());
			RequestDispatcher dis = request.getRequestDispatcher("./ConsNoticias.jsp");
			dis.forward(request, response);
		}
				
	}

}
