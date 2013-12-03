package br.feevale.smartpark.apresentacao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import br.feevale.smartpark.persistencia.dao.Conexao;
import br.feevale.smartpark.persistencia.dao.Localizador;
import br.feevale.smartpark.persistencia.regras.AreaRegra;
import br.feevale.smartpark.persistencia.regras.VagaRegra;
import br.feevale.smartpark.persistencia.tabelas.Area;
import br.feevale.smartpark.persistencia.tabelas.Vaga;

public class MntVagas {
	
	
	
	public List<Vaga> getLista( HttpServletRequest request ){
		
		int idArea = 0;
		
		try{
			idArea = Integer.parseInt( request.getParameter("area") );
			
		} catch(Exception e ){
			idArea = 0;
		}
		
		
		if( idArea != 0 ){
			Conexao cnx = Conexao.getConexao( Vaga.class );
			try{
				
				List<?> lista = cnx.getSession().createCriteria( Vaga.class ).add( Restrictions.eq( "idArea", idArea ) ).list();
				
				if( lista != null ) {
					return (List<Vaga>) lista;
				}
			} finally {
				cnx.close();
			}
		}
		
		return new ArrayList<Vaga>();
	}
	
	
	public List<Area> getListaAreas(){
		Conexao cnx = Conexao.getConexao( Area.class );
		try{
			List<?> lista = cnx.getSession().createCriteria( Area.class ).list();
			
			if( lista != null ) {
				return  (List<Area>) lista;
			}
		} finally {
			cnx.close();
		}
		
		return null;
		
	}
	
	public String executaAcao( HttpServletRequest request ){
		
		String acao = request.getParameter( "acao" ); 
		
		System.out.println( acao );
		if( acao != null ){
		 	if( acao.equals( "incluir") ){
		 		try{
		 			gravaVaga( request );
		 		} catch( Exception e ){
		 			e.printStackTrace();
		 			return "ERRO:" + e.getMessage();
		 		}
		 		
		 		return  "Vaga Gravada!";
		 	} else if( acao.equals("excluir") ){
		 		
		 		excluirVaga( request );
		 		
		 	}
		}
		
		return null;
	}

	private void excluirVaga(HttpServletRequest request) {
		
		String idArea = request.getParameter("idVaga");
		System.out.println( idArea );
		Vaga a = (Vaga) Localizador.buscaTabela(Vaga.class, "idVaga", Integer.parseInt(idArea) );
		
		if( a != null ){
			VagaRegra ar = new VagaRegra(a);
			ar.excluir();
		}
	}


	private void gravaVaga(HttpServletRequest request) {
		
		Vaga vaga = new Vaga();
		
		String desativar = request.getParameter("desativar");
		
		if( desativar == null ){
			desativar = "";
		}
		
		
		vaga.setDsVaga( request.getParameter("descricao"));
		vaga.setIdArea( Integer.parseInt(request.getParameter("idArea")));
		vaga.setSnDesativado(desativar.equals("on") ? "S": "N" );


		
		
		if( Localizador.buscaTabela(Vaga.class, "dsArea", vaga.getDsVaga() ) != null ) {
			throw new RuntimeException( "Area (" + vaga.getDsVaga() + ") já consta na base");
		}
		
		
		
		VagaRegra vagaRegra = new VagaRegra(vaga);
		vagaRegra.inserir();
		
		
	}
	
}