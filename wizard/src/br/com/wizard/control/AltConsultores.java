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
import org.omg.CORBA.PRIVATE_MEMBER;

import br.com.wizard.dao.ConsultoresDao;
import br.com.wizard.model.Consultores;
import br.com.wizard.utils.Utils;

@WebServlet("/AltConsultores")
public class AltConsultores extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AltConsultores() {
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
				FileItem nome = (FileItem) itens.get(1);
				FileItem cargo = (FileItem) itens.get(2);
				FileItem especialidade = (FileItem) itens.get(3);
				FileItem ramal = (FileItem) itens.get(4);
				FileItem executante = (FileItem) itens.get(5);
				FileItem hentrada = (FileItem) itens.get(6);
				FileItem hsaialmoco = (FileItem) itens.get(7);
				FileItem hretalmoco = (FileItem) itens.get(8);
				FileItem hsaida = (FileItem) itens.get(9);
				FileItem nascimento = (FileItem) itens.get(10);
				FileItem contratacao = (FileItem) itens.get(11);
				FileItem lider = (FileItem) itens.get(12);
				FileItem imagem = (FileItem) itens.get(13);

				Consultores consultores = new Consultores();
				ConsultoresDao consultoresDao = new ConsultoresDao();
				Utils utils = new Utils();

				consultores.setId(Integer.valueOf(id.getString()));
				consultores.setNome(nome.getString());
				consultores.setCargo(cargo.getString());
				if (!lider.getString().equals("")) {
					consultores.setLider(lider.getString());
				} else {
					consultores.setLider("N");
				}
				if (!especialidade.getString().equals("")) {
					consultores.setEspecialidade(especialidade.getString());
				} else {
					consultores.setEspecialidade("N");
				}
				consultores.setRamal(Integer.valueOf(ramal.getString()));
				consultores.setExecutante(Integer.valueOf(executante.getString()));
				consultores.setHentrada(utils.convHora(hentrada.getString()));
				consultores.setHsaialmoco(utils.convHora(hsaialmoco.getString()));
				consultores.setHretalmoco(utils.convHora(hretalmoco.getString()));
				consultores.setHsaida(utils.convHora(hsaida.getString()));
				consultores.setNascimento(utils.convData(nascimento.getString()));
				consultores.setContratacao(utils.convData(contratacao.getString()));

				String retorno = null;

				if (!imagem.getName().equals("")) {

					// EXCLUI IMAGEM DO SERVIDOR AO ALTERA-LA INICIO
					consultoresDao.buscarFotoConsultor(consultores);
					String foto = request.getServletContext().getRealPath("fotos") + File.separator
							+ consultores.getFoto().replace("fotos/", "");
					String fotoerro = request.getServletContext().getRealPath("fotos") + File.separator
							+ consultores.getFoto();
					File fl = new File(foto);
					if (fl.exists()) {
						fl.delete();
					}
					// EXCLUI IMAGEM DO SERVIDOR AO ALTERA-LA FIM

					String arquivo = request.getServletContext().getRealPath("fotos") + File.separator
							+ imagem.getName();

					String ext = arquivo.substring(arquivo.lastIndexOf("."), arquivo.length());

					consultoresDao.buscarCodFoto(consultores);

					String novonome = consultores.getCodfoto() + ext;

					consultores.setFoto("fotos/" + novonome);

					retorno = consultoresDao.alterar(consultores);

					if (retorno.equals("sucesso")) {
						try {
							imagem.write(new File(
									request.getServletContext().getRealPath("fotos") + File.separator + novonome));
							consultoresDao.atualCodFoto(consultores);
						} catch (Exception e) {
							System.out.println("Erro ao gravar imagem no diretório! Erro: " + e);
						}
						response.sendRedirect("./consultores");
					} else {
						request.setAttribute("erro",
								"Não foi possível alterar o Consultor! Erro: " + consultores.getMsgErro());
					}
					RequestDispatcher dis = request.getRequestDispatcher(
							"./AltConsultores.jsp?id=" + id.getString() + "&nome=" + nome.getString() + "&cargo="
									+ cargo.getString() + "&especialidade=" + especialidade.getString() + "&ramal="
									+ ramal.getString() + "&executante=" + executante.getString() + "&hentrada="
									+ hentrada.getString() + "&hsaialmoco=" + hsaialmoco.getString() + "&hretalmoco="
									+ hretalmoco.getString() + "&hsaida=" + hsaida.getString() + "&dtnascimento="
									+ nascimento.getString() + "&dtcontratacao=" + contratacao.getString() + "&lider="
									+ consultores.getLider() + "&foto=" + consultores.getFoto());
					dis.forward(request, response);
				} else {
					consultoresDao.buscarFotoConsultor(consultores);
					consultores.setFoto(consultores.getFoto());
					retorno = consultoresDao.alterar(consultores);

					if (retorno.equals("sucesso")) {
						response.sendRedirect("./consultores");
					} else {
						if (!consultores.getMsgErro().equals(null)) {
							request.setAttribute("erro",
									"Não foi possível alterar o Consultor! Erro: " + consultores.getMsgErro());
						}
					}
					RequestDispatcher dis = request.getRequestDispatcher(
							"./AltConsultores.jsp?id=" + id.getString() + "&nome=" + nome.getString() + "&cargo="
									+ cargo.getString() + "&especialidade=" + especialidade.getString() + "&ramal="
									+ ramal.getString() + "&executante=" + executante.getString() + "&hentrada="
									+ hentrada.getString() + "&hsaialmoco=" + hsaialmoco.getString() + "&hretalmoco="
									+ hretalmoco.getString() + "&hsaida=" + hsaida.getString() + "&dtnascimento="
									+ nascimento.getString() + "&dtcontratacao=" + contratacao.getString() + "&lider="
									+ consultores.getLider() + "&foto=" + consultores.getFoto());
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
