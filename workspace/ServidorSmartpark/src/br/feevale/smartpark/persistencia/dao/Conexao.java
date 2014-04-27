package br.feevale.smartpark.persistencia.dao;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.classic.Session;

public class Conexao {

	private SessionFactory sessionFactory;
	private Session session;
	
	private Conexao(){
		
	}
	
	public static Conexao getConexao( Class classes ){
		Conexao cnx = new Conexao();
		cnx.estabeleceConexao(classes);
		return cnx;
	}
	
	public void estabeleceConexao(Class classes) {
		AnnotationConfiguration config = new AnnotationConfiguration();
		config.addAnnotatedClass(classes);
		sessionFactory = config.buildSessionFactory();
		session = sessionFactory.openSession();
	}

	public void close() {
		session.close();
		sessionFactory.close();
	}
	
	public Session getSession() {
		return session;
	}
}