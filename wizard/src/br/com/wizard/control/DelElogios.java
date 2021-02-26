package br.com.wizard.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.wizard.dao.ElogiosDao;
import br.com.wizard.model.Elogios;

@WebServlet("/DelElogios")
public class DelElogios extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DelElogios() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));

		Elogios elogios = new Elogios();
		ElogiosDao elogiosDao = new ElogiosDao();
		elogios.setId(id);

		String retorno = elogiosDao.excluir(elogios);

		if (retorno.equals("sucesso")) {
			response.sendRedirect("./elogios");
		} else {
			request.setAttribute("erro", "Não foi possível excluir o elogio! Erro: " + elogios.getMsgErro());
			RequestDispatcher dis = request.getRequestDispatcher("./Elogios.jsp");
			dis.forward(request, response);
		}

	}

}
