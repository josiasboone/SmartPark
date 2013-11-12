package br.feevale.smartpark.apresentacao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import br.feevale.smartpark.persistencia.dao.Conexao;
import br.feevale.smartpark.persistencia.regras.AreaRegra;
import br.feevale.smartpark.persistencia.tabelas.Area;

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
		if( acao != null ){
		 	if( acao.equals( "incluir") ){
		 		try{
		 			gravaArea( request );
		 		} catch( Exception e ){
		 			e.printStackTrace();
		 			
		 			return "ERRO:" + e.getMessage();
		 		}
		 		
		 		return  "Areas Gravada!";
		 	}
		}
		
		return null;
	}

	private void gravaArea(HttpServletRequest request) {
		
		Area area = new Area();
		
		String desativar = request.getParameter("desativar");
		
		if( desativar == null ){
			desativar = "";
		}
		
		area.setDsArea( request.getParameter("descricao"));
		area.setSnDesativado(desativar.equals("on") ? "S": "N" );
		
		AreaRegra areaRegra = new AreaRegra(area);
		areaRegra.inserir();
		
		
	}
	
}