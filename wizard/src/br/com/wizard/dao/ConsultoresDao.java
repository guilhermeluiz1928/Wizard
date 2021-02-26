package br.com.wizard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.wizard.database.Database;
import br.com.wizard.database.DatabaseFactory;
import br.com.wizard.model.Consultores;

public class ConsultoresDao {

	public List<Consultores> listar() {
		List<Consultores> c = new ArrayList<Consultores>();
		Database database = DatabaseFactory.getDatabase("postgresql");
		Connection conn = database.conectar();
		String sql = "SELECT ID, NOME, CARGO, ESPECIALIDADE, RAMAL, EXECUTANTE, TO_CHAR(HENTRADA, 'hh24:mi') ||' às '|| TO_CHAR(HSAIALMOCO, 'hh24:mi') || ' ' || TO_CHAR(HRETALMOCO, 'hh24:mi') || ' às ' || TO_CHAR(HSAIDA, 'hh24:mi') AS EXPEDIENTE, HENTRADA, HSAIALMOCO, HRETALMOCO, HSAIDA, NASCIMENTO, DTCONTRATACAO, LIDER, FOTO FROM CONSULTORES ORDER BY NOME";		
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Consultores consultores = new Consultores();
				consultores.setId(rs.getInt("ID"));
				consultores.setNome(rs.getString("NOME"));
				consultores.setCargo(rs.getString("CARGO"));
				consultores.setEspecialidade(rs.getString("ESPECIALIDADE"));
				consultores.setRamal(rs.getInt("RAMAL"));
				consultores.setExecutante(rs.getInt("EXECUTANTE"));
				consultores.setExpediente(rs.getString("EXPEDIENTE"));
				consultores.setHentrada(rs.getTime("HENTRADA"));
				consultores.setHsaialmoco(rs.getTime("HSAIALMOCO"));
				consultores.setHretalmoco(rs.getTime("HRETALMOCO"));
				consultores.setHsaida(rs.getTime("HSAIDA"));
				consultores.setNascimento(rs.getDate("NASCIMENTO"));
				consultores.setContratacao(rs.getDate("DTCONTRATACAO"));
				if (rs.getString("LIDER") == null) {
					consultores.setLider("N");
				} else {
					consultores.setLider(rs.getString("LIDER"));
				}
				consultores.setFoto(rs.getString("FOTO"));
				c.add(consultores);
			}
			database.desconectar(conn);
		} catch (SQLException ex) {
			System.out.println("Erro ao listar os consultores! Erro: " + ex);
			database.desconectar(conn);
		} finally {
			database.desconectar(conn);
		}
		return c;
	}

	public List<Consultores> listarLider() {
		List<Consultores> c = new ArrayList<Consultores>();
		Database database = DatabaseFactory.getDatabase("postgresql");
		String sql = "SELECT NOME FROM CONSULTORES WHERE CARGO='Líder de Equipe' ORDER BY NOME";
		Connection conn = database.conectar();
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Consultores consultores = new Consultores();
				consultores.setNome(rs.getString("NOME"));
				c.add(consultores);
			}
			database.desconectar(conn);
		} catch (SQLException ex) {
			System.out.println("Erro ao listar os líderes! Erro: " + ex);
			database.desconectar(conn);
		} finally {
			database.desconectar(conn);
		}
		return c;
	}

	public List<Consultores> listarLiderAlt(Consultores cons) {
		List<Consultores> c = new ArrayList<Consultores>();
		Database database = DatabaseFactory.getDatabase("postgresql");
		String sql = "SELECT NOME FROM CONSULTORES WHERE CARGO='Líder de Equipe' AND NOME<>? AND NOME<>'N' ORDER BY NOME";
		Connection conn = database.conectar();
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, cons.getNome());
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Consultores consultores = new Consultores();
				consultores.setNome(rs.getString("NOME"));
				c.add(consultores);
			}
			database.desconectar(conn);
		} catch (SQLException ex) {
			System.out.println("Erro ao listar os líderes! Erro: " + ex);
			database.desconectar(conn);
		} finally {
			database.desconectar(conn);
		}
		return c;
	}

	public List<Consultores> listarEquipes() {
		List<Consultores> c = new ArrayList<Consultores>();
		Database database = DatabaseFactory.getDatabase("postgresql");
		String sql = "SELECT 'Líder '||LIDER AS LIDER ,STRING_AGG( NOME ::text, ', ' ) AS CONSULTORES FROM CONSULTORES WHERE LIDER<>'N' GROUP BY LIDER ORDER BY LIDER";
		Connection conn = database.conectar();
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Consultores consultores = new Consultores();
				consultores.setLider(rs.getString("LIDER"));
				consultores.setNome(rs.getString("CONSULTORES"));
				c.add(consultores);
			}
			database.desconectar(conn);
		} catch (SQLException ex) {
			System.out.println("Erro ao listar os líderes! Erro: " + ex);
			database.desconectar(conn);
		} finally {
			database.desconectar(conn);
		}
		return c;
	}

	public Consultores buscarFotoConsultor(Consultores consultores) {
		Database database = DatabaseFactory.getDatabase("postgresql");
		String sql = "SELECT FOTO FROM CONSULTORES WHERE ID=?";
		Connection conn = database.conectar();
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, consultores.getId());
			ResultSet rs = stmt.executeQuery();
			rs.next();
			consultores.setFoto(rs.getString("FOTO"));
		} catch (SQLException ex) {
			System.out.println("Erro ao buscar a foto do consultor! Erro: " + ex);
			database.desconectar(conn);
		} finally {
			database.desconectar(conn);
		}
		return consultores;
	}

	public Consultores buscarCodFoto(Consultores consultores) {
		Database database = DatabaseFactory.getDatabase("postgresql");
		String sql = "SELECT ULTCOD+1 AS ULTCOD FROM NUMERACAO WHERE TABELA='CONSULTORES'";
		Connection conn = database.conectar();
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			consultores.setCodfoto((rs.getInt("ULTCOD")));
		} catch (SQLException ex) {
			System.out.println("Erro ao buscar codigo da foto! Erro: " + ex);
			database.desconectar(conn);
		} finally {
			database.desconectar(conn);
		}
		return consultores;
	}

	public Consultores atualCodFoto(Consultores consultores) {
		Database database = DatabaseFactory.getDatabase("postgresql");
		String sql = "UPDATE NUMERACAO SET ULTCOD=ULTCOD+1 WHERE TABELA='CONSULTORES'";
		Connection conn = database.conectar();
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.execute();
		} catch (SQLException ex) {
			System.out.println("Erro ao atualizar o código da foto! Erro: " + ex);
			consultores.setMsgErro(ex.toString());
			database.desconectar(conn);
		} finally {
			database.desconectar(conn);
		}
		return consultores;
	}

	public String inserir(Consultores consultores) {
		String retorno = "falha";
		Database database = DatabaseFactory.getDatabase("postgresql");
		String sql = "INSERT INTO CONSULTORES (NOME, CARGO, ESPECIALIDADE, RAMAL, EXECUTANTE, HENTRADA, HSAIALMOCO, HRETALMOCO, HSAIDA, NASCIMENTO, DTCONTRATACAO, LIDER, FOTO) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Connection conn = database.conectar();
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, consultores.getNome());
			stmt.setString(2, consultores.getCargo());
			stmt.setString(3, consultores.getEspecialidade());
			stmt.setInt(4, consultores.getRamal());
			stmt.setInt(5, consultores.getExecutante());
			stmt.setTime(6, consultores.getHentrada());
			stmt.setTime(7, consultores.getHsaialmoco());
			stmt.setTime(8, consultores.getHretalmoco());
			stmt.setTime(9, consultores.getHsaida());
			stmt.setDate(10, consultores.getNascimento());
			stmt.setDate(11, consultores.getContratacao());
			stmt.setString(12, consultores.getLider());
			stmt.setString(13, consultores.getFoto());
			stmt.execute();
			retorno = "sucesso";
		} catch (SQLException ex) {
			System.out.println("Erro ao inserir consultor! Erro: " + ex);
			consultores.setMsgErro(ex.toString());
			database.desconectar(conn);
		} finally {
			database.desconectar(conn);
		}
		return retorno;
	}

	public String alterar(Consultores consultores) {
		String retorno = "falha";
		Database database = DatabaseFactory.getDatabase("postgresql");
		String sql = "UPDATE CONSULTORES SET NOME=?, CARGO=?, ESPECIALIDADE=?, RAMAL=?, EXECUTANTE=?, HENTRADA=?, HSAIALMOCO=?, HRETALMOCO=?, HSAIDA=?, NASCIMENTO=?, DTCONTRATACAO=?, LIDER=?, FOTO=? WHERE ID=?";
		Connection conn = database.conectar();
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, consultores.getNome());
			stmt.setString(2, consultores.getCargo());
			stmt.setString(3, consultores.getEspecialidade());
			stmt.setInt(4, consultores.getRamal());
			stmt.setInt(5, consultores.getExecutante());
			stmt.setTime(6, consultores.getHentrada());
			stmt.setTime(7, consultores.getHsaialmoco());
			stmt.setTime(8, consultores.getHretalmoco());
			stmt.setTime(9, consultores.getHsaida());
			stmt.setDate(10, consultores.getNascimento());
			stmt.setDate(11, consultores.getContratacao());
			stmt.setString(12, consultores.getLider());
			stmt.setString(13, consultores.getFoto());
			stmt.setInt(14, consultores.getId());
			stmt.execute();
			retorno = "sucesso";
		} catch (SQLException ex) {
			System.out.println("Erro ao alterar consultor! Erro: " + ex);
			consultores.setMsgErro(ex.toString());
			database.desconectar(conn);
		} finally {
			database.desconectar(conn);
		}
		return retorno;
	}

	public String excluir(Consultores consultores) {
		String retorno = "falha";
		Database database = DatabaseFactory.getDatabase("postgresql");
		String sql = "DELETE FROM CONSULTORES WHERE ID=?";
		Connection conn = database.conectar();
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, consultores.getId());
			stmt.execute();
			retorno = "sucesso";
		} catch (SQLException ex) {
			System.out.println("Erro ao deletar consultor! Erro: " + ex);
			consultores.setMsgErro(ex.toString());
			database.desconectar(conn);
		} finally {
			database.desconectar(conn);
		}
		return retorno;
	}

}
