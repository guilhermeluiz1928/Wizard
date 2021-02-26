package br.com.wizard.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import br.com.wizard.dao.NoticiasDao;
import br.com.wizard.model.Noticias;

@WebServlet("/AltNoticias")
public class AltNoticias extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AltNoticias() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DiskFileItemFactory dfif = new DiskFileItemFactory();
		ServletFileUpload sfu = new ServletFileUpload(dfif);

		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				List itens = sfu.parseRequest(request);

				// PEGA OS CAMPOS NO FORM NA ORDEM QUE SÃO APRESENTADOS
				FileItem id = (FileItem) itens.get(0);
				FileItem titulo = (FileItem) itens.get(1);
				FileItem link = (FileItem) itens.get(2);
				FileItem noticia = (FileItem) itens.get(3);

				Noticias noticias = new Noticias();
				NoticiasDao noticiasDao = new NoticiasDao();

				noticias.setId(Integer.valueOf(id.getString()));
				noticias.setTitulo(titulo.getString());
				noticias.setLink(link.getString());
				noticias.setNoticia(noticia.getString());

				String retorno = noticiasDao.alterar(noticias);

				if (retorno.equals("sucesso")) {
					response.sendRedirect("./consnoticias");
				} else {
					if (!noticias.getMsgErro().equals(null)) {
						request.setAttribute("erro",
								"Não foi possível alterar o Elogio! Erro: " + noticias.getMsgErro());
					}
				}
				RequestDispatcher dis = request
						.getRequestDispatcher("./AltNoticias.jsp?id=" + id.getString() + "&titulo=" + titulo.getString()
								+ "&link=" + link.getString() + "&noticia=" + noticia.getString());
				dis.forward(request, response);

			} catch (FileUploadException e) {
				System.out.println("Erro ao pegar os campos do form: " + e);
			}
		} else {
			System.out.println("Erro: O form não é do tipo MULTPART!");
		}
	}

}
