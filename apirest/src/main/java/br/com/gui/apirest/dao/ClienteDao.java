package br.com.gui.apirest.dao;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import br.com.gui.apirest.model.ClienteModel;

@Stateless
public class ClienteDao {

	@PersistenceContext
	private EntityManager entity;

	public List<ClienteModel> listaCliente() {
		return entity.createQuery("SELECT C FROM ClienteModel C", ClienteModel.class).getResultList();
	}

	public ClienteModel listaClienteById(Integer id) {
		return entity.find(ClienteModel.class, id);
	}

	public void insereCliente(ClienteModel cm) {
		entity.persist(cm);
	}

	public ClienteModel alteraCliente(ClienteModel cm) {
		return entity.merge(cm);
	}

	public void removeCliente(ClienteModel cm) {
		entity.remove(entity.find(ClienteModel.class, cm.getId()));
	}

}
