package br.com.wizard.model;

import java.sql.Time;

public class Consultores {

	private int id;
	private String nome;	
	private String cargo;
	private String especialidade;
	private int ramal;
	private int executante;
	private String expediente;
	private java.sql.Date nascimento;
	private java.sql.Date contratacao;
	private Time hentrada;
	private Time hsaialmoco;
	private Time hretalmoco;
	private Time hsaida;
	private String lider;
	private String msgErro;
	private String msgErro2;
	private String foto;
	private int codfoto;

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getMsgErro() {
		return msgErro;
	}

	public void setMsgErro(String msgErro) {
		this.msgErro = msgErro;
	}

	public String getCargo() {
		return cargo;
	}

	public void setCargo(String cargo) {
		this.cargo = cargo;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getRamal() {
		return ramal;
	}

	public void setRamal(int ramal) {
		this.ramal = ramal;
	}

	public int getExecutante() {
		return executante;
	}

	public void setExecutante(int executante) {
		this.executante = executante;
	}

	public String getExpediente() {
		return expediente;
	}

	public void setExpediente(String expediente) {
		this.expediente = expediente;
	}	

	public Time getHentrada() {
		return hentrada;
	}

	public void setHentrada(Time hentrada) {
		this.hentrada = hentrada;
	}

	public Time getHsaialmoco() {
		return hsaialmoco;
	}

	public void setHsaialmoco(Time hsaialmoco) {
		this.hsaialmoco = hsaialmoco;
	}

	public Time getHretalmoco() {
		return hretalmoco;
	}

	public void setHretalmoco(Time hretalmoco) {
		this.hretalmoco = hretalmoco;
	}

	public Time getHsaida() {
		return hsaida;
	}

	public void setHsaida(Time hsaida) {
		this.hsaida = hsaida;
	}

	public java.sql.Date getNascimento() {
		return nascimento;
	}

	public void setNascimento(java.sql.Date nascimento) {
		this.nascimento = nascimento;
	}

	public java.sql.Date getContratacao() {
		return contratacao;
	}

	public void setContratacao(java.sql.Date contratacao) {
		this.contratacao = contratacao;
	}

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

	public String getMsgErro2() {
		return msgErro2;
	}

	public void setMsgErro2(String msgErro2) {
		this.msgErro2 = msgErro2;
	}

	public int getCodfoto() {
		return codfoto;
	}

	public void setCodfoto(int codfoto) {
		this.codfoto = codfoto;
	}

	public String getEspecialidade() {
		return especialidade;
	}

	public void setEspecialidade(String especialidade) {
		this.especialidade = especialidade;
	}

	public String getLider() {
		return lider;
	}

	public void setLider(String lider) {
		this.lider = lider;
	}


}
