package br.feevale.smartpark.apresentacao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import br.feevale.smartpark.persistencia.dao.Conexao;
import br.feevale.smartpark.persistencia.dao.Localizador;
import br.feevale.smartpark.persistencia.regras.AreaRegra;
import br.feevale.smartpark.persistencia.regras.UsuarioRegra;
import br.feevale.smartpark.persistencia.tabelas.Area;
import br.feevale.smartpark.persistencia.tabelas.Usuario;

public class MntUsuario {
	
	
	
	public List<Usuario> getLista(){
		
		Conexao cnx = Conexao.getConexao( Usuario.class );
		try{
			List<?> lista = cnx.getSession().createCriteria( Usuario.class ).list();
			
			if( lista != null ) {
				return (List<Usuario>) lista;
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
		 			gravaUsuario( request );
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
		
		String idUsuario = request.getParameter("idUsuario");
		System.out.println( idUsuario );
		Area a = (Area) Localizador.buscaTabela(Area.class, "idUsuario", Integer.parseInt(idUsuario) );
		
		if( a != null ){
			AreaRegra ar = new AreaRegra(a);
			ar.excluir();
		}
	}


	private void gravaUsuario(HttpServletRequest request) {
		
		Usuario usuario = new Usuario();
		
		String desativar = request.getParameter("desativar");
		
		if( desativar == null ){
			desativar = "";
		}
		
//		usuario.setDsArea( request.getParameter("descricao"));
//		usuario.setSnDesativado(desativar.equals("on") ? "S": "N" );
		
		UsuarioRegra usuarioRegra = new UsuarioRegra(usuario);
		usuarioRegra.inserir();
		
		
	}
	
}