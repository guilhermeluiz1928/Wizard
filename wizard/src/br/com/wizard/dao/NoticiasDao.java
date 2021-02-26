package br.com.wizard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.wizard.database.Database;
import br.com.wizard.database.DatabaseFactory;
import br.com.wizard.model.Noticias;

public class NoticiasDao {

	public List<Noticias> listar() {
		List<Noticias> c = new ArrayList<Noticias>();
		Database database = DatabaseFactory.getDatabase("postgresql");
		String sql = "SELECT ID, TITULO, URL, NOTICIA FROM NOTICIAS ORDER BY ID DESC LIMIT 10";
		Connection conn = database.conectar();
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Noticias noticias = new Noticias();
				noticias.setId(Integer.valueOf(rs.getString("ID")));
				noticias.setTitulo(rs.getString("TITULO"));
				noticias.setLink(rs.getString("URL"));
				noticias.setNoticia(rs.getString("NOTICIA"));
				c.add(noticias);
			}
			database.desconectar(conn);
		} catch (SQLException ex) {
			System.out.println("Erro ao listar as Noticias! Erro: " + ex);
			database.desconectar(conn);
		} finally {
			database.desconectar(conn);
		}
		return c;
	}
	
	public List<Noticias> listarum() {
		List<Noticias> c = new ArrayList<Noticias>();
		Database database = DatabaseFactory.getDatabase("postgresql");
		String sql = "SELECT ID, SUBSTR(TITULO, 0, 145) AS TITULO, URL, SUBSTR(NOTICIA, 0, 200) AS NOTICIA FROM NOTICIAS ORDER BY ID DESC LIMIT 2";
		Connection conn = database.conectar();
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Noticias noticias = new Noticias();
				noticias.setId(Integer.valueOf(rs.getString("ID")));
				noticias.setTitulo(rs.getString("TITULO"));
				noticias.setLink(rs.getString("URL"));
				noticias.setNoticia(rs.getString("NOTICIA"));
				c.add(noticias);
			}
			database.desconectar(conn);
		} catch (SQLException ex) {
			System.out.println("Erro ao listar as Noticias! Erro: " + ex);
			database.desconectar(conn);
		} finally {
			database.desconectar(conn);
		}
		return c;
	}
	
	public List<Noticias> listardois() {
		List<Noticias> c = new ArrayList<Noticias>();
		Database database = DatabaseFactory.getDatabase("postgresql");
		String sql = "SELECT ID, SUBSTR(TITULO, 0, 145) AS TITULO, URL, SUBSTR(NOTICIA, 0, 200) AS NOTICIA FROM NOTICIAS WHERE ID<(SELECT MAX(ID) FROM NOTICIAS WHERE ID < (SELECT MAX(ID) FROM NOTICIAS)) ORDER BY ID DESC LIMIT 2";
		Connection conn = database.conectar();
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Noticias noticias = new Noticias();
				noticias.setId(Integer.valueOf(rs.getString("ID")));
				noticias.setTitulo(rs.getString("TITULO"));
				noticias.setLink(rs.getString("URL"));
				noticias.setNoticia(rs.getString("NOTICIA"));
				c.add(noticias);
			}
			database.desconectar(conn);
		} catch (SQLException ex) {
			System.out.println("Erro ao listar as Noticias! Erro: " + ex);
			database.desconectar(conn);
		} finally {
			database.desconectar(conn);
		}
		return c;
	}

	public String excluir(Noticias noticias) {
		String retorno = "falha";
		Database database = DatabaseFactory.getDatabase("postgresql");
		String sql = "DELETE FROM NOTICIAS WHERE ID=?";
		Connection conn = database.conectar();
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, noticias.getId());
			stmt.execute();
			retorno = "sucesso";
		} catch (SQLException ex) {
			System.out.println("Erro ao deletar a notícia! Erro: " + ex);
			noticias.setMsgErro(ex.toString());
			database.desconectar(conn);
		} finally {
			database.desconectar(conn);
		}
		return retorno;
	}

	public String inserir(Noticias noticias) {
		String retorno = "falha";
		Database database = DatabaseFactory.getDatabase("postgresql");
		String sql = "INSERT INTO NOTICIAS (TITULO, URL, NOTICIA) VALUES (?,?,?)";
		Connection conn = database.conectar();
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, noticias.getTitulo());
			stmt.setString(2, noticias.getLink());
			stmt.setString(3, noticias.getNoticia());
			stmt.execute();
			retorno = "sucesso";
		} catch (SQLException ex) {
			System.out.println("Erro ao inserir consultor! Erro: " + ex);
			noticias.setMsgErro(ex.toString());
			database.desconectar(conn);
		} finally {
			database.desconectar(conn);
		}
		return retorno;
	}

	public String alterar(Noticias noticias) {
		String retorno = "falha";
		Database database = DatabaseFactory.getDatabase("postgresql");
		String sql = "UPDATE NOTICIAS SET TITULO=?, URL=?, NOTICIA=? WHERE ID=?";
		Connection conn = database.conectar();
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, noticias.getTitulo());
			stmt.setString(2, noticias.getLink());
			stmt.setString(3, noticias.getNoticia());
			stmt.setInt(4, noticias.getId());
			stmt.execute();
			retorno = "sucesso";
		} catch (SQLException ex) {
			System.out.println("Erro ao alterar a notícia! Erro: " + ex);
			noticias.setMsgErro(ex.toString());
			database.desconectar(conn);
		} finally {
			database.desconectar(conn);
		}
		return retorno;
	}

}
