package br.feevale.smartpark.importacao;

import java.security.MessageDigest;

import br.feevale.smartpark.persistencia.Vaga;
import br.feevale.smartpark.persistencia.dao.Conexao;
import br.feevale.smartpark.persistencia.dao.Persistencia;
import br.feevale.smartpark.webservice.WebserviceSensores;
import br.feevale.smartpark.webservice.wsl.ArrayOfString;

public class ImportacaoSensores {
	
	
	public static void main(String[] args) {
		
		MessageDigest md = null;
		
		try{
			
		} catch(Exception e ){
			e.printStackTrace();
		}
		
		
		
//		Conexao cnx = Conexao.getConexao( Vaga.class );
//		
//		try{
//			ArrayOfString lista = WebserviceSensores.retornaListaEstados();
//			
//			for( String sensor : lista.getString() ) {
//				
//				String[] split = sensor.split( ";" );
//				
//				Vaga vaga = new Vaga();
//				
//				vaga.setCdChaveSensor( Integer.parseInt( split[ 0 ] ) );
//				vaga.setTpEstado( split[ 1 ] );
//			 	vaga.setIdArea( 0 );
//				
//			 	Persistencia p = new Persistencia( cnx, vaga );
//			 	p.inserir();
//			 	System.out.println( "gravando: " + sensor );
//			 	
//			 	System.out.println( );
//				
//			}
//		} finally {
//			cnx.close();
//		}
		
	}
	
}