package br.feevale.smartpark.sessao;

import javax.servlet.http.HttpServletRequest;

import br.feevale.smartpark.persistencia.dao.Localizador;
import br.feevale.smartpark.persistencia.tabelas.Usuario;
import br.feevale.smartpark.util.Md5;

public class GerenciadorDeSessao {
	
	public static boolean isSessaoValida( HttpServletRequest request ){
		
		if( request.getSession() != null && request.getSession().getAttribute("usuario" ) != null ){
			return true;
		}
		
		return false;
	}
	
	public static boolean gravaUsuarioNaSessao( HttpServletRequest request ){
		
		try{
			String nome = request.getParameter( "nmLogin" );
			String senha = request.getParameter( "nmSenha" );
			
			Usuario u = (Usuario) Localizador.buscaTabela(Usuario.class, "dsUsuario", nome);
			
			if( u != null ){
				senha = Md5.converter(senha);
				if(u.getDsSenha().equals(senha)){
					request.getSession().setAttribute("usuario", u);
					return true;
				}
			}
		} catch(Exception e ){
			e.printStackTrace();	
		}
		
		return false;
	}
	
}