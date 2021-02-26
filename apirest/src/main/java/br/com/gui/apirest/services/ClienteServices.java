package br.com.gui.apirest.services;

import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import br.com.gui.apirest.dao.ClienteDao;
import br.com.gui.apirest.model.ClienteModel;

@Path("clientes")
@Produces({ MediaType.APPLICATION_JSON })
public class ClienteServices {

	@Inject
	private ClienteDao dao;

	@GET
	public List<ClienteModel> getClientes() {
		return dao.listaCliente();
	}

	@GET
	@Path("id")
	public Response getClientesById(ClienteModel cliente) {
		ClienteModel cm = dao.listaClienteById(cliente.getId());
		if (cm == null) {
			return Response.status(Response.Status.NOT_FOUND).build();
		} else {
			try {
				dao.listaClienteById(cliente.getId());
				return Response.status(Response.Status.OK).entity(cm).build();
			} catch (Exception ex) {
				return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity(ex.getMessage()).build();
			}
		}
	}

	@POST
	public Response criaCliente(ClienteModel cliente) {
		try {
			dao.insereCliente(cliente);
			return Response.status(Response.Status.CREATED).entity(cliente).build();
		} catch (Exception ex) {
			return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity(ex.getMessage()).build();
		}
	}

	@PUT
	public Response alteraCliente(ClienteModel cliente) {
		ClienteModel cm = dao.listaClienteById(cliente.getId());
		if (cm == null) {
			return Response.status(Response.Status.NOT_FOUND).build();
		} else {
			try {
				dao.alteraCliente(cliente);
				return Response.status(Response.Status.OK).entity(cliente).build();
			} catch (Exception ex) {
				return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity(ex.getMessage()).build();
			}
		}
	}

	@DELETE
	public Response deletaCliente(ClienteModel cliente) {
		ClienteModel cm = dao.listaClienteById(cliente.getId());
		if (cm == null) {
			return Response.status(Response.Status.NOT_FOUND).build();
		} else {
			try {
				dao.removeCliente(cm);
				return Response.status(Response.Status.OK).build();
			} catch (Exception ex) {
				return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity(ex.getMessage()).build();
			}
		}
	}

}
