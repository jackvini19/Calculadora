/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;
import model.Pessoa;

/**
 *
 * @author aluno
 */
public class PessoaDAOImp implements PessoaDAO{

    private Connection con;
    public PessoaDAOImp() throws Exception{
    }

    @Override
    public void Inserir(Pessoa pes) throws Exception {
        PreparedStatement ps = null;
        if(pes == null){
            throw new Exception("O valor não pode ser nulo");
        }
         try {
            con = Conexao.abrirConexao();
            System.out.println("Conexão realizada com sucesso");       
        } catch (Exception e) {
            System.err.println("Erro na conexão");
            System.err.println("Erro:"+e.getMessage());
        }
         try {
             con = Conexao.abrirConexao();
            System.out.println("Conexão realizada com sucesso");    
            String sql = "INSERT INTO quemsabe (nome,email,datanasc,senha) VALUES (? , ? , ? , ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1,pes.getNome());
            ps.setString(2,pes.getEmail());
            ps.setString(3,pes.getDatanasc());
            ps.setString(4,pes.getSenha());
            ps.executeUpdate();
        } catch (Exception e) {
           //System.err.println("Erro na conexão");
            System.err.println("Erro:"+e.getMessage());
            throw new Exception("Erro ao inserir pessoa :"+ e.getMessage());
        }finally {
             Conexao.fecharConexao(con, ps);
         }
    
        //To change body of generated methods, choose Tools | Templates.
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
