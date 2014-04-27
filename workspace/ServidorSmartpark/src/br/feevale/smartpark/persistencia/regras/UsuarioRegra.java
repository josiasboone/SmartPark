package br.feevale.smartpark.persistencia.regras;

import br.feevale.smartpark.persistencia.dao.Regras;
import br.feevale.smartpark.persistencia.tabelas.Usuario;

public class UsuarioRegra extends Regras<Usuario> {

	public UsuarioRegra(Usuario t) {
		super(t);
	}
	
}