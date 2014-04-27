package br.feevale.smartpark.importacao;

import java.math.BigInteger;
import java.security.MessageDigest;

public class ImportacaoSensores {
	
	
	public static void main(String[] args) {
		
		MessageDigest md = null;
		
		try{
			md = MessageDigest.getInstance("MD5");
		} catch(Exception e ){
			e.printStackTrace();
		}
		BigInteger hash = new BigInteger(1, md.digest("123".getBytes()));
		System.out.println( hash.toString(16).length());
		
		
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