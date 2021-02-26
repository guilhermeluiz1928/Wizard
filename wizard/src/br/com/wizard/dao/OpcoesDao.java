package br.com.wizard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.wizard.database.Database;
import br.com.wizard.database.DatabaseFactory;
import br.com.wizard.model.Opcoes;

public class OpcoesDao {

	public List<Opcoes> listar(Opcoes opc) {
		List<Opcoes> c = new ArrayList<Opcoes>();
		Database database = DatabaseFactory.getDatabase("postgresql");
		String sql = "SELECT TABELA, CAMPO, OPCAO FROM OPCOES WHERE TABELA=? AND CAMPO=? ORDER BY OPCAO";
		Connection conn = database.conectar();
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, opc.getTabela());
			stmt.setString(2, opc.getCampo());
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Opcoes opcoes = new Opcoes();
				opcoes.setOpcao(rs.getString("OPCAO"));
				c.add(opcoes);
			}
			database.desconectar(conn);
		} catch (SQLException ex) {
			System.out.println("Erro ao listar as Opcões! Erro: " + ex);
			database.desconectar(conn);
		} finally {
			database.desconectar(conn);
		}
		return c;
	}

	public List<Opcoes> listarComOpcao(Opcoes opc) {
		List<Opcoes> c = new ArrayList<Opcoes>();
		Database database = DatabaseFactory.getDatabase("postgresql");
		String sql = "SELECT TABELA, CAMPO, OPCAO FROM OPCOES WHERE TABELA=? AND CAMPO=? AND OPCAO<>? ORDER BY OPCAO";
		Connection conn = database.conectar();
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, opc.getTabela());
			stmt.setString(2, opc.getCampo());
			stmt.setString(3, opc.getOpcao());
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Opcoes opcoes = new Opcoes();
				opcoes.setOpcao(rs.getString("OPCAO"));
				c.add(opcoes);
			}
			database.desconectar(conn);
		} catch (SQLException ex) {
			System.out.println("Erro ao listar as Opcões! Erro: " + ex);
			database.desconectar(conn);
		} finally {
			database.desconectar(conn);
		}
		return c;
	}

}
