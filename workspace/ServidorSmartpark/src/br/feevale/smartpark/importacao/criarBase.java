package br.feevale.smartpark.importacao;

import br.feevale.smartpark.persistencia.dao.Conexao;
import br.feevale.smartpark.persistencia.dao.Persistencia;
import br.feevale.smartpark.persistencia.tabelas.Area;
import br.feevale.smartpark.persistencia.tabelas.Usuario;
import br.feevale.smartpark.persistencia.tabelas.Vaga;
import br.feevale.smartpark.util.Md5;

public class criarBase {
	
	
	public static void main(String[] args) {
		
		getArea();
		getUsuario();
		getVaga();
	}
	

	public static void getArea(){
		Conexao cnx = Conexao.getConexao( Area.class );
		
		try{
			Area area = new Area();
		 	
		 	area.setDsArea("teste");
		 	area.setSnDesativado("N");
		 	Persistencia p = new Persistencia( cnx, area );
		 	p.inserir();
			
		 	p = new Persistencia( cnx, area );
		 	p.excluir();
		} finally {
			cnx.close();
		}

	}
	
	public static void getUsuario(){
		Conexao cnx = Conexao.getConexao( Usuario.class );
		
		try{
			Usuario usuario = new Usuario();
		 	
		 	usuario.setDsUsuario("admin");
		 	usuario.setDsSenha(Md5.converter("admin"));
		 	
		 	Persistencia p = new Persistencia( cnx, usuario );
		 	p.inserir();
		} finally {
			cnx.close();
		}

	}
	
	public static void getVaga(){
		Conexao cnx = Conexao.getConexao( Vaga.class );
		
		try{
		
			Vaga vaga = new Vaga();
			
			vaga.setCdChaveSensor( 1 );
			vaga.setTpEstado( "O" );
		 	vaga.setIdArea( 0 );
			
		 	Persistencia p = new Persistencia( cnx, vaga );
		 	p.inserir();
		 	p = new Persistencia( cnx, vaga );
		 	p.excluir();
		} finally {
			cnx.close();
		}
	}
	
	
}