package br.feevale.smartpark.persistencia.dao;

import br.feevale.smartpark.persistencia.tabelas.Tabela;

public class Regras <T extends Tabela>{
	
	private Conexao cnx;
	private Persistencia persistencia;
	
	public Regras( T t ){
		cnx = Conexao.getConexao( t.getClass() );
		persistencia = new Persistencia(cnx, t );
	}
	
	public void excluir() {
		persistencia.excluir();
	}
	
	public void alterar() {
		persistencia.alterar();
	}
	
	public void inserir() {
		persistencia.inserir();
	}
	
}