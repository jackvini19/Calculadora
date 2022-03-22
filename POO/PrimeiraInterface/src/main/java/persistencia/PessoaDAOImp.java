/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package persistencia;

import java.sql.Connection;
import java.util.List;
import model.Pessoa;

/**
 *
 * @author aluno
 */
public class PessoaDAOImp implements PessoaDAO{
    
    private Connection con;
    public PessoaDAOImp() throws Exception{
        try {
            con = Conexao.abrirConexao();
            System.out.println("Conexão realizada com sucesso");       
        } catch (Exception e) {
            System.err.println("Erro na conexão");
            System.err.println("Erro:"+e.getMessage());
        }
    }

    @Override
    public void Inserir(Pessoa pes) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void Remover(int id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void Atualizar(Pessoa pes) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Pessoa> Buscar(Pessoa pes) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Pessoa> Listar(Pessoa pes) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
