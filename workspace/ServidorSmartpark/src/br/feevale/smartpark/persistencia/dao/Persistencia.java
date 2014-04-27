package br.feevale.smartpark.persistencia.dao;

import org.hibernate.Transaction;
import org.hibernate.classic.Session;

import br.feevale.smartpark.persistencia.tabelas.Tabela;

public class Persistencia {
	
	private Tabela tabela;
	private Conexao cnx;
	private boolean multiConexao = false;
	
	
 	public Persistencia( Tabela tabela ){
		this.tabela = tabela;
	}
 	
 	public Persistencia( Conexao cnx, Tabela tabela ){
		this.tabela = tabela;
		this.cnx = cnx;
		multiConexao = true;
	}
	
	public void excluir( Conexao cnx ) {
		Session session = cnx.getSession();
		Transaction tx = session.beginTransaction(); 
		session.delete( tabela );
        tx.commit();
	}
	
	public void alterar( Conexao cnx ) {
		Session session = cnx.getSession();
		Transaction tx = session.beginTransaction(); 
		session.update( tabela );
		tx.commit();
	}
	
	public void inserir( Conexao cnx ) {
		Session session = cnx.getSession();
		Transaction tx = session.beginTransaction(); 
		session.persist( tabela );
		tx.commit();
	}
	
	public void excluir() {
		
		Conexao cnx = getConexa();
		
		try{
			excluir( cnx );
		} finally {
 			if( !multiConexao ){
				cnx.close();
			}
		}
	}
	
	public void alterar() {
		Conexao cnx = getConexa();
		
		try{
			alterar( cnx );
		} finally {
 			if( !multiConexao ){
				cnx.close();
			}
		}	
	}
	
	public void inserir() {
		Conexao cnx = getConexa();
		
		try{
			inserir( cnx );
		} finally {
 			if( !multiConexao ){
				cnx.close();
			}
		}	
	}
	
	private Conexao getConexa() {
		
		if( cnx != null ) {
			return cnx;
		}
		
		return Conexao.getConexao( tabela.getClass() );
	}
}
