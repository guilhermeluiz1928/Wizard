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

import br.com.wizard.dao.ServidoresDao;
import br.com.wizard.model.Servidores;
import br.com.wizard.utils.Utils;

@WebServlet("/AltServidores")
public class AltServidores extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AltServidores() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

		DiskFileItemFactory dfif = new DiskFileItemFactory();
		ServletFileUpload sfu = new ServletFileUpload(dfif);

		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				List itens = sfu.parseRequest(request);

				// PEGA OS CAMPOS NO FORM NA ORDEM QUE SÃO APRESENTADOS
				FileItem servidor = (FileItem) itens.get(0);
				FileItem porta = (FileItem) itens.get(1);
				FileItem base = (FileItem) itens.get(2);
				FileItem versao = (FileItem) itens.get(3);
				FileItem solicitante = (FileItem) itens.get(4);
				FileItem executante = (FileItem) itens.get(5);
				FileItem os = (FileItem) itens.get(6);

				Servidores servidores = new Servidores();
				ServidoresDao servidoresDao = new ServidoresDao();
				Utils utils = new Utils();

				servidores.setServidor(servidor.getString());
				servidores.setPorta(Integer.valueOf(porta.getString()));
				servidores.setBase(base.getString());
				servidores.setVersao(versao.getString());
				servidores.setSolicitante(solicitante.getString());
				servidores.setExecutante(executante.getString());
				servidores.setOs(Integer.valueOf(os.getString()));

				String retorno = null;

				retorno = servidoresDao.alterar(servidores);

				if (retorno.equals("sucesso")) {
					response.sendRedirect("./cadservidores");
				} else {
					request.setAttribute("erro",
							"Não foi possível alterar o Servidor! Erro: " + servidores.getMsgErro());
					RequestDispatcher dis = request.getRequestDispatcher("./AltServidores.jsp?servidor="+servidor.getString()+"&porta="+porta.getString()+"&base="+base.getString()+"&versao="+versao.getString()+"&solicitante="+solicitante.getString()+"&executante="+solicitante.getString()+"&os="+os.getString());
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
