package br.com.wizard.control;

import java.io.File;
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

import br.com.wizard.dao.ElogiosDao;
import br.com.wizard.model.Elogios;

@WebServlet("/CadElogios")
public class CadElogios extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CadElogios() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("./CadElogios.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		DiskFileItemFactory dfif = new DiskFileItemFactory();
		ServletFileUpload sfu = new ServletFileUpload(dfif);

		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				List itens = sfu.parseRequest(request);

				// PEGA OS CAMPOS NO FORM NA ORDEM QUE SÃO APRESENTADOS
				FileItem elogiado = (FileItem) itens.get(0);
				FileItem autor = (FileItem) itens.get(1);
				FileItem elogio = (FileItem) itens.get(2);

				Elogios elogios = new Elogios();
				ElogiosDao elogiosDao = new ElogiosDao();

				elogios.setElogiado(elogiado.getString());
				elogios.setAutor(autor.getString());
				elogios.setElogio(elogio.getString());

				String retorno = elogiosDao.inserir(elogios);

				if (retorno.equals("sucesso")) {
					response.sendRedirect("./elogios");
				} else {
					if (!elogios.getMsgErro().equals(null)) {
						request.setAttribute("erro",
								"Não foi possível inserir o Elogio! Erro: " + elogios.getMsgErro());
					}
					RequestDispatcher dis = request.getRequestDispatcher("./AltElogios.jsp?elogiado="+elogiado.getString()+"&autor="+autor.getString()+"&elogio="+elogio.getString());
					dis.forward(request, response);
				}

			} catch (FileUploadException e) {
				System.out.println("Erro ao pegar os campos do form: " + e);
			}

		} else {
			System.out.println("Erro: O form não é do tipo MULTPART!");
		}
	}

}
