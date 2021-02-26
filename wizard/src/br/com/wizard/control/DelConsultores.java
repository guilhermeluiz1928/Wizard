package br.com.wizard.control;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.wizard.dao.ConsultoresDao;
import br.com.wizard.model.Consultores;

@WebServlet("/DelConsultores")
public class DelConsultores extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DelConsultores() {
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
		String foto = request.getParameter("foto");

		Consultores consultores = new Consultores();
		consultores.setId(id);

		ConsultoresDao consultoresDao = new ConsultoresDao();
		String retorno = consultoresDao.excluir(consultores);

		if (retorno.equals("sucesso")) {
			// DELETE FOTO DO SERVIDOR INICIO
			if (!foto.equals("./resources/imagens/sem_foto.png")) {
				String arquivo = request.getServletContext().getRealPath("fotos") + File.separator
						+ foto.replace("fotos/", "");
				File fl = new File(arquivo);
				if (fl.exists()) {
					fl.delete();
				}
			}
			// DELETE FOTO DO SERVIDOR FIM
			response.sendRedirect("./consultores");			
		} else {
			request.setAttribute("erro", "Não foi possível excluir o Consultor! Erro: " + consultores.getMsgErro());
			RequestDispatcher dis = request.getRequestDispatcher("./Consultores.jsp");
			dis.forward(request, response);
		}

	}

}
