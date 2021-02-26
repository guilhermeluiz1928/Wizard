package br.com.wizard.control;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.wizard.dao.LoginDao;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("./Login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String usuario = request.getParameter("usuario");
		String senha = request.getParameter("senha");

		br.com.wizard.model.Login login = new br.com.wizard.model.Login();
		login.setUsuario(usuario);
		login.setSenha(senha);

		LoginDao dao = new LoginDao();

		String retorno = dao.logar(login);

		if (retorno.equals("sucesso")) {
			HttpSession session = request.getSession();
			session.setAttribute("usuLogado", usuario);
			
			response.sendRedirect("./admin");
			
		} else {
			request.setAttribute("erro", "Nome de usuário e/ou senha inválidos!");

		}
		RequestDispatcher dis = request.getRequestDispatcher("./Login.jsp");
		dis.forward(request, response);

	}

}
