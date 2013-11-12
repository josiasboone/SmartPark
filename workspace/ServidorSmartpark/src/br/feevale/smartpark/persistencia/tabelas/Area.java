package br.feevale.smartpark.persistencia.tabelas;

import static javax.persistence.GenerationType.AUTO;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity(name="area")
public class Area implements Tabela {
	
	@Id @GeneratedValue(strategy=AUTO)	
	private int idArea;
	
	@Column(length=200,unique=true)
	private String dsArea;
	
	@Column(length=1)
	private String snDesativado;
	

	public int getIdArea() {
		return idArea;
	}

	public void setIdArea(int idArea) {
		this.idArea = idArea;
	}

	public String getDsArea() {
		return dsArea;
	}

	public void setDsArea(String dsArea) {
		this.dsArea = dsArea;
	}

	public String getSnDesativado() {
		return snDesativado;
	}

	public void setSnDesativado(String snDesativado) {
		this.snDesativado = snDesativado;
	}
	
}