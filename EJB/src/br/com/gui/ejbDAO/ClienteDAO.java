package br.com.gui.ejbDAO;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import br.com.gui.ejb.model.ClienteModel;

@Stateless
public class ClienteDAO {

	@PersistenceContext
	private EntityManager mananger;

	public List<ClienteModel> listaCliente() {
		return mananger.createQuery("SELECT P FROM ClienteModel P", ClienteModel.class).getResultList();
	}

	public ClienteModel listaClienteId(Integer id) {
		return mananger.find(ClienteModel.class, id);
	}

	public void insereCliente(ClienteModel cm) {
		mananger.persist(cm);
	}

	public void alteraCliente(ClienteModel cm) {
		mananger.merge(cm);
	}

	public void removeCliente(ClienteModel cm) {
		mananger.remove(mananger.find(ClienteModel.class, cm.getId()));

	}

}