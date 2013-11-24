package br.feevale.smartpark.sessao;

import javax.servlet.http.HttpServletRequest;

import br.feevale.smartpark.apresentacao.MntAreas;
import br.feevale.smartpark.apresentacao.MntUsuario;
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
	
	
	public static MntAreas getMntAreas( HttpServletRequest request ){
		
		if( !isSessaoValida(request)){
			return null;
		}
		
		MntAreas mnt = (MntAreas) request.getSession().getAttribute( "MntArea" );
		
		if( mnt != null ){
			return mnt;
		}
		
		mnt = new MntAreas();
		
		request.getSession().setAttribute( "MntArea", mnt);
		
		return mnt;
	}
	
	public static MntUsuario getMntUsuario( HttpServletRequest request ){
		
		if( !isSessaoValida(request)){
			return null;
		}
		
		MntUsuario mnt = (MntUsuario) request.getSession().getAttribute( "MntUsuario" );
		
		if( mnt != null ){
			return mnt;
		}
		
		mnt = new MntUsuario();
		
		request.getSession().setAttribute( "MntUsuario", mnt);
		
		return mnt;
	}
	
	
}