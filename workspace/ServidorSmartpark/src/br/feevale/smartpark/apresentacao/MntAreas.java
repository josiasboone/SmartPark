package br.feevale.smartpark.apresentacao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import br.feevale.smartpark.persistencia.dao.Conexao;
import br.feevale.smartpark.persistencia.dao.Localizador;
import br.feevale.smartpark.persistencia.regras.AreaRegra;
import br.feevale.smartpark.persistencia.tabelas.Area;
import br.feevale.smartpark.persistencia.tabelas.Usuario;

public class MntAreas {
	
	
	
	public List<Area> getLista(){
		
		Conexao cnx = Conexao.getConexao( Area.class );
		try{
			List<?> lista = cnx.getSession().createCriteria( Area.class ).list();
			
			if( lista != null ) {
				return (List<Area>) lista;
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
		 			gravaArea( request );
		 		} catch( Exception e ){
		 			e.printStackTrace();
		 			return "ERRO:" + e.getMessage();
		 		}
		 		
		 		return  "Areas Gravada!";
		 	} else if( acao.equals("excluir") ){
		 		
		 		excluirArea( request );
		 		
		 	}
		}
		
		return null;
	}

	private void excluirArea(HttpServletRequest request) {
		
		String idArea = request.getParameter("idArea");
		System.out.println( idArea );
		Area a = (Area) Localizador.buscaTabela(Area.class, "idArea", Integer.parseInt(idArea) );
		
		if( a != null ){
			AreaRegra ar = new AreaRegra(a);
			ar.excluir();
		}
	}


	private void gravaArea(HttpServletRequest request) {
		
		Area area = new Area();
		
		String desativar = request.getParameter("desativar");
		
		if( desativar == null ){
			desativar = "";
		}
		
		
		area.setDsArea( request.getParameter("descricao"));
		area.setSnDesativado(desativar.equals("on") ? "S": "N" );
		
		if( Localizador.buscaTabela(Area.class, "dsArea", area.getDsArea() ) != null ) {
			throw new RuntimeException( "Area (" + area.getDsArea() + ") já consta na base");
		}
		
		
		
		AreaRegra areaRegra = new AreaRegra(area);
		areaRegra.inserir();
		
		
	}
	
}