package br.feevale.smartpark.persistencia.dao;

import java.util.List;

import org.hibernate.criterion.Restrictions;

import br.feevale.smartpark.persistencia.tabelas.Tabela;

public class Localizador {
	
	public static Tabela buscaTabela( Class<?> classes, String campo, Object condicao ){
		
		Conexao cnx = Conexao.getConexao( classes );
		try{
			List<?> lista = cnx.getSession().createCriteria( classes ).add( Restrictions.eq( campo, condicao ) ).list();
			
			if( lista != null ) {
				if( lista.size() > 0 ) {
					return (Tabela) lista.get( 0 );
				}
			}
		} finally {
			cnx.close();
		}
		
		return null;
	}
	
	
}