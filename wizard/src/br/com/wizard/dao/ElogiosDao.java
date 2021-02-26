package br.com.wizard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.wizard.database.Database;
import br.com.wizard.database.DatabaseFactory;
import br.com.wizard.model.Elogios;

public class ElogiosDao {

	public List<Elogios> listar() {
		List<Elogios> c = new ArrayList<Elogios>();
		Database database = DatabaseFactory.getDatabase("postgresql");
		String sql = "SELECT ID, AUTOR, ELOGIO, ELOGIADO, ROW_NUMBER() OVER (ORDER BY ID DESC)-1 AS SEQUENCIA, CASE WHEN ROW_NUMBER() OVER (ORDER BY ID DESC)-1=0 THEN 'class=\"active\"' ELSE '' END AS CABCAR, CASE WHEN ROW_NUMBER() OVER (ORDER BY ID DESC)-1=0 THEN 'carousel-item active' ELSE 'carousel-item' END AS ITEMCAR FROM ELOGIOS ORDER BY ID DESC LIMIT 10";
		Connection conn = database.conectar();
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Elogios elogios = new Elogios();
				elogios.setId(Integer.valueOf(rs.getString("ID")));
				elogios.setAutor(rs.getString("AUTOR"));
				elogios.setElogio(rs.getString("ELOGIO"));
				elogios.setElogiado(rs.getString("ELOGIADO"));
				elogios.setSeq(Integer.valueOf(rs.getString("SEQUENCIA")));
				elogios.setCabCar(rs.getString("CABCAR"));
				elogios.setItemCar(rs.getString("ITEMCAR"));
				c.add(elogios);
			}
			database.desconectar(conn);
		} catch (SQLException ex) {
			System.out.println("Erro ao listar os Elogios! Erro: " + ex);
			database.desconectar(conn);
		} finally {
			database.desconectar(conn);
		}
		return c;
	}
	
	public String excluir(Elogios elogios) {
		String retorno = "falha";
		Database database = DatabaseFactory.getDatabase("postgresql");
		String sql = "DELETE FROM ELOGIOS WHERE ID=?";
		Connection conn = database.conectar();
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, elogios.getId());
			stmt.execute();
			retorno = "sucesso";
		} catch (SQLException ex) {
			System.out.println("Erro ao deletar consultor! Erro: " + ex);
			elogios.setMsgErro(ex.toString());
			database.desconectar(conn);
		} finally {
			database.desconectar(conn);
		}
		return retorno;
	}

	public String inserir(Elogios elogios) {
		String retorno = "falha";
		Database database = DatabaseFactory.getDatabase("postgresql");
		String sql = "INSERT INTO ELOGIOS (ELOGIADO, AUTOR, ELOGIO) VALUES (?,?,?)";
		Connection conn = database.conectar();
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, elogios.getElogiado());
			stmt.setString(2, elogios.getAutor());
			stmt.setString(3, elogios.getElogio());
			stmt.execute();
			retorno = "sucesso";
		} catch (SQLException ex) {
			System.out.println("Erro ao inserir consultor! Erro: " + ex);
			elogios.setMsgErro(ex.toString());
			database.desconectar(conn);
		} finally {
			database.desconectar(conn);
		}
		return retorno;
	}
	
	public String alterar(Elogios elogios) {
		String retorno = "falha";
		Database database = DatabaseFactory.getDatabase("postgresql");
		String sql = "UPDATE ELOGIOS SET ELOGIADO=?, AUTOR=?, ELOGIO=? WHERE ID=?";
		Connection conn = database.conectar();
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);			
			stmt.setString(1, elogios.getElogiado());
			stmt.setString(2, elogios.getAutor());
			stmt.setString(3, elogios.getElogio());
			stmt.setInt(4, elogios.getId());
			stmt.execute();
			retorno = "sucesso";
		} catch (SQLException ex) {
			System.out.println("Erro ao alterar consultor! Erro: " + ex);
			elogios.setMsgErro(ex.toString());
			database.desconectar(conn);
		} finally {
			database.desconectar(conn);
		}
		return retorno;
	}
	
	

}
