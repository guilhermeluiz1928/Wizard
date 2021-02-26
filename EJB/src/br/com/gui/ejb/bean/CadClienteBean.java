package br.com.gui.ejb.bean;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.inject.Inject;

import br.com.gui.ejb.model.ClienteModel;
import br.com.gui.ejbDAO.ClienteDAO;

@ManagedBean
@ViewScoped
public class CadClienteBean {

	private ClienteModel clienteModel = new ClienteModel();

	@Inject
	private ClienteDAO dao;

	public ClienteModel getClienteModel() {
		return clienteModel;
	}

	@PostConstruct
	public void carregaForm() {
		ClienteModel cliente = (ClienteModel) FacesContext.getCurrentInstance().getExternalContext().getSessionMap()
				.get("cliente");
		if (!(cliente == null)) {
			this.clienteModel = (ClienteModel) FacesContext.getCurrentInstance().getExternalContext().getSessionMap()
					.get("cliente");
		}
	}

	public String voltaCliente() {
		FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("cliente");
		return "home?faces-redirect=true";
	}

	public String salvaCliente() {
		if (clienteModel.getId() == null) {
			this.dao.insereCliente(clienteModel);
		} else {
			this.dao.alteraCliente(clienteModel);
		}
		this.clienteModel = new ClienteModel();

		FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("cliente");

		return "home?faces-redirect=true";
	}

}
