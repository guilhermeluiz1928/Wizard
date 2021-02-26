package br.com.gui.ejb.bean;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.inject.Inject;

import br.com.gui.ejb.model.ClienteModel;
import br.com.gui.ejbDAO.ClienteDAO;

@ManagedBean
@ViewScoped
public class ClienteBean {

	private ClienteModel clienteModel = new ClienteModel();

	@Inject
	private ClienteDAO dao;

	// o get serve para buscar os dados do formulario
	public ClienteModel getClienteModel() {
		return clienteModel;
	}

	public List<ClienteModel> listaClientes() {
		return this.dao.listaCliente();
	}

	public String novoCliente() {
		FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("cliente");
		return "cliente?faces-redirect=true";
	}

	public String alteraCliente(ClienteModel cm) {
		FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("cliente", cm);
		return "cliente?faces-redirect=true";
	}

	public void removeCliente(ClienteModel cm) {
		this.dao.removeCliente(cm);
	}

}
