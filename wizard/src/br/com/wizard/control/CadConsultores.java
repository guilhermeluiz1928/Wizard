package br.com.wizard.control;

import java.io.File;
import java.io.IOException;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.annotation.adapters.NormalizedStringAdapter;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.sun.glass.ui.Size;

import br.com.wizard.dao.ConsultoresDao;
import br.com.wizard.model.Consultores;
import br.com.wizard.utils.Utils;

@WebServlet("/CadConsultores")
public class CadConsultores extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CadConsultores() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("./CadConsultores.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		DiskFileItemFactory dfif = new DiskFileItemFactory();
		ServletFileUpload sfu = new ServletFileUpload(dfif);

		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				List itens = sfu.parseRequest(request);

				// PEGA OS CAMPOS NO FORM NA ORDEM QUE SÃO APRESENTADOS
				FileItem nome = (FileItem) itens.get(0);
				FileItem cargo = (FileItem) itens.get(1);
				FileItem especialidade = (FileItem) itens.get(2);
				FileItem ramal = (FileItem) itens.get(3);
				FileItem executante = (FileItem) itens.get(4);
				FileItem hentrada = (FileItem) itens.get(5);
				FileItem hsaialmoco = (FileItem) itens.get(6);
				FileItem hretalmoco = (FileItem) itens.get(7);
				FileItem hsaida = (FileItem) itens.get(8);
				FileItem nascimento = (FileItem) itens.get(9);
				FileItem contratacao = (FileItem) itens.get(10);
				FileItem lider = (FileItem) itens.get(11);
				FileItem imagem = (FileItem) itens.get(12);

				Consultores consultores = new Consultores();
				ConsultoresDao consultoresDao = new ConsultoresDao();
				Utils utils = new Utils();

				consultores.setNome(nome.getString());
				consultores.setCargo(cargo.getString());
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
				if (!lider.getString().equals("")) {
					consultores.setLider(lider.getString());
				} else {
					consultores.setLider("N");
				}

				String retorno = null;

				// VALIDA SE ESTA SENDO INSERIDA ALGUMA IMAGEM
				if (!imagem.getName().equals("")) {

					String arquivo = request.getServletContext().getRealPath("fotos") + File.separator
							+ imagem.getName();

					String ext = arquivo.substring(arquivo.lastIndexOf("."), arquivo.length());

					consultoresDao.buscarCodFoto(consultores);

					String novonome = consultores.getCodfoto() + ext;

					consultores.setFoto("fotos/" + novonome);

					retorno = consultoresDao.inserir(consultores);

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
								"Não foi possível inserir o Consultor! Erro: " + consultores.getMsgErro());
						RequestDispatcher dis = request.getRequestDispatcher("./CadConsultores.jsp");
						dis.forward(request, response);
					}

				} else {
					consultores.setFoto("./resources/imagens/sem_foto.png");
					retorno = consultoresDao.inserir(consultores);

					if (retorno.equals("sucesso")) {
						response.sendRedirect("./consultores");
					} else {
						if (!consultores.getMsgErro().equals(null)) {
							request.setAttribute("erro",
									"Não foi possível inserir o Consultor! Erro: " + consultores.getMsgErro());
							RequestDispatcher dis = request.getRequestDispatcher("./CadConsultores.jsp");
							dis.forward(request, response);
						}
					}

				}

			} catch (FileUploadException e) {
				System.out.println("Erro ao pegar os campos do form: " + e);
			}

		} else {
			System.out.println("Erro: O form não é do tipo MULTPART!");
		}
	}

}
