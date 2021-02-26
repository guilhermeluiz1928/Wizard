package br.com.wizard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.wizard.database.Database;
import br.com.wizard.database.DatabaseFactory;
import br.com.wizard.model.Servidores;

public class ServidoresDao {

	public Servidores listarServidores(Servidores servidores) {
		Database database = DatabaseFactory.getDatabase("postgresql");
		String sql = "SELECT SERVIDOR, PORTA, BASE, VERSAO, SOLICITANTE, EXECUTANTE, TO_CHAR(DT_ATUAL, 'DD/MM/YYYY') AS DT_ATUAL, OS FROM SERVIDORES WHERE SERVIDOR=? AND PORTA=?";
		Connection conn = database.conectar();

		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, servidores.getServidor());
			stmt.setInt(2, servidores.getPorta());
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				servidores.setServidor(rs.getString("SERVIDOR"));
				servidores.setPorta(rs.getInt("PORTA"));
				servidores.setBase(rs.getString("BASE"));
				servidores.setVersao(rs.getString("VERSAO"));
				servidores.setSolicitante(rs.getString("SOLICITANTE"));
				servidores.setExecutante(rs.getString("EXECUTANTE"));
				servidores.setData(rs.getDate("DT_ATUAL"));
				servidores.setOs(rs.getInt("OS"));
			}
		} catch (SQLException ex) {
			System.out.println("Erro ao buscar servidores. Erro: " + ex);
			database.desconectar(conn);
		} finally {
			database.desconectar(conn);
		}
		return servidores;
	}

	public List<Servidores> listar208() {
		List<Servidores> s = new ArrayList<Servidores>();
		Database database = DatabaseFactory.getDatabase("postgresql");
		String sql = "SELECT PORTA, BASE, VERSAO, SOLICITANTE, EXECUTANTE, DT_ATUAL, OS FROM SERVIDORES WHERE SERVIDOR='192.168.1.208' ORDER BY PORTA";
		Connection conn = database.conectar();
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Servidores servidores = new Servidores();
				servidores.setPorta(rs.getInt("PORTA"));
				servidores.setBase(rs.getString("BASE"));
				servidores.setVersao(rs.getString("VERSAO"));
				servidores.setSolicitante(rs.getString("SOLICITANTE"));
				servidores.setExecutante(rs.getString("EXECUTANTE"));
				servidores.setData(rs.getDate("DT_ATUAL"));
				servidores.setOs(rs.getInt("OS"));
				s.add(servidores);
			}
			database.desconectar(conn);
		} catch (SQLException ex) {
			System.out.println("Erro ao listar os servidores! Erro: " + ex);
			database.desconectar(conn);
		} finally {
			database.desconectar(conn);
		}
		return s;
	}

	public List<Servidores> listar209() {
		List<Servidores> s = new ArrayList<Servidores>();
		Database database = DatabaseFactory.getDatabase("postgresql");
		String sql = "SELECT PORTA, BASE, VERSAO, SOLICITANTE, EXECUTANTE, DT_ATUAL, OS FROM SERVIDORES WHERE SERVIDOR='192.168.1.209' ORDER BY PORTA";
		Connection conn = database.conectar();
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Servidores servidores = new Servidores();
				servidores.setPorta(rs.getInt("PORTA"));
				servidores.setBase(rs.getString("BASE"));
				servidores.setVersao(rs.getString("VERSAO"));
				servidores.setSolicitante(rs.getString("SOLICITANTE"));
				servidores.setExecutante(rs.getString("EXECUTANTE"));
				servidores.setData(rs.getDate("DT_ATUAL"));
				servidores.setOs(rs.getInt("OS"));
				s.add(servidores);
			}
			database.desconectar(conn);
		} catch (SQLException ex) {
			System.out.println("Erro ao listar os servidores! Erro: " + ex);
			database.desconectar(conn);
		} finally {
			database.desconectar(conn);
		}
		return s;
	}
	
	public String alterar(Servidores servidores) {
		String retorno = "falha";
		Database database = DatabaseFactory.getDatabase("postgresql");
		String sql = "UPDATE SERVIDORES SET BASE=?, VERSAO=?, SOLICITANTE=?, EXECUTANTE=?, OS=? WHERE SERVIDOR=? AND PORTA=?";
		Connection conn = database.conectar();
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, servidores.getBase());
			stmt.setString(2, servidores.getVersao());
			stmt.setString(3, servidores.getSolicitante());
			stmt.setString(4, servidores.getExecutante());
			stmt.setInt(5, servidores.getOs());
			stmt.setString(6, servidores.getServidor());
			stmt.setInt(7, servidores.getPorta());
			stmt.execute();
			retorno = "sucesso";
		} catch (SQLException ex) {
			System.out.println("Erro ao inserir consultor! Erro: " + ex);
			servidores.setMsgErro(ex.toString());
			database.desconectar(conn);
		} finally {
			database.desconectar(conn);
		}
		return retorno;
	}

}
