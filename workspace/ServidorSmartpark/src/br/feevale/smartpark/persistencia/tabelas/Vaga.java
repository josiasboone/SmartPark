package br.feevale.smartpark.persistencia.tabelas;

import static javax.persistence.GenerationType.AUTO;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Vaga implements Tabela {
	
	@Id @GeneratedValue(strategy=AUTO)
	private int idVaga;
	
	private int idArea;
	
	@Column(length=200)
	private String dsVaga;
	
	private int cdChaveSensor;
	
	@Column(length=1)
	private String tpEstado;
	
	@Column(length=1)
	private String tpVaga;
	
	@Column(length=1)
	private String snDesativado;
	
	public int getIdVaga() {
		return idVaga;
	}
	public void setIdVaga(int idVaga) {
		this.idVaga = idVaga;
	}
	public int getIdArea() {
		return idArea;
	}
	public void setIdArea(int idArea) {
		this.idArea = idArea;
	}
	public String getDsVaga() {
		return dsVaga;
	}
	public void setDsVaga(String dsVaga) {
		this.dsVaga = dsVaga;
	}
	public int getCdChaveSensor() {
		return cdChaveSensor;
	}
	public void setCdChaveSensor(int cdChaveSensor) {
		this.cdChaveSensor = cdChaveSensor;
	}
	public String getTpEstado() {
		return tpEstado;
	}
	public void setTpEstado(String tpEstado) {
		this.tpEstado = tpEstado;
	}
	public String getTpVaga() {
		return tpVaga;
	}
	public void setTpVaga(String tpVaga) {
		this.tpVaga = tpVaga;
	}
	public String getSnDesativado() {
		return snDesativado;
	}
	public void setSnDesativado(String snDesativado) {
		this.snDesativado = snDesativado;
	}
	
}
