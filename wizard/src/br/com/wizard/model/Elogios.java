package br.com.wizard.model;

public class Elogios {

	private int id;
	private String elogio;
	private String autor;
	private String elogiado;
	private int seq;
	private String cabCar;
	private String itemCar;
	private String msgErro;

	public String getElogio() {
		return elogio;
	}

	public void setElogio(String elogio) {
		this.elogio = elogio;
	}	

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getCabCar() {
		return cabCar;
	}

	public void setCabCar(String cabCar) {
		this.cabCar = cabCar;
	}

	public String getItemCar() {
		return itemCar;
	}

	public void setItemCar(String itemCar) {
		this.itemCar = itemCar;
	}

	public String getElogiado() {
		return elogiado;
	}

	public void setElogiado(String elogiado) {
		this.elogiado = elogiado;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAutor() {
		return autor;
	}

	public void setAutor(String autor) {
		this.autor = autor;
	}

	public String getMsgErro() {
		return msgErro;
	}

	public void setMsgErro(String msgErro) {
		this.msgErro = msgErro;
	}

}
