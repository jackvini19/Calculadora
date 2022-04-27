/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import model.Pessoa;
import telas.login;
import utilitarios.Criptografia;

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
        PreparedStatement ps = null;
        ResultSet rs=null;
        if (id <= 0){
            throw new Exception("O valor não pode ser nulo.");
        }
        try {
             con = Conexao.abrirConexao();
             System.out.println("Conexão realizada com sucesso");
             String sql = "DELETE FROM quemsabe "+
                     "WHERE id = ?";
             ps = con.prepareStatement(sql);
             ps.setInt(1, id);
             ps.executeUpdate();
        }
       catch (Exception e) {
           //System.err.println("Erro na conexão");
            System.err.println("Erro:"+e.getMessage());
            throw new Exception("Erro ao remover pessoa :"+ e.getMessage());
        }finally {
             Conexao.fecharConexao(con, ps, rs);
         
        }
    }

    @Override
    public void Atualizar(Pessoa pes) throws Exception {
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
            String sql = "UPDATE quemsabe SET nome=?,"
                 + "email=?,datanasc=? WHERE id=? ";
            ps = con.prepareStatement(sql);
            ps.setString(1,pes.getNome());
            ps.setString(2,pes.getEmail());
            ps.setString(3,pes.getDatanasc());
            ps.setInt(4,pes.getId());
            ps.executeUpdate();
        } catch (Exception e) {
           //System.err.println("Erro na conexão");
            System.err.println("Erro:"+e.getMessage());
            throw new Exception("Erro ao inserir pessoa :"+ e.getMessage());
        }finally {
             Conexao.fecharConexao(con, ps);
         }
    
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Pessoa> Buscar(Pessoa pes) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Pessoa> Listar() throws Exception {
       List<Pessoa> lista = new ArrayList<>();
       Statement stmt = null;
       ResultSet rs = null;
      try {
             con = Conexao.abrirConexao();
             System.out.println("Conexão realizada com sucesso");
             String sql = "SELECT * FROM quemsabe";
             stmt = con.createStatement();
             rs = stmt.executeQuery(sql);
             while (rs.next()){
                  Pessoa pess = new Pessoa();
                 pess.setId(rs.getInt("id"));
                 pess.setEmail(rs.getString("email"));
                 pess.setNome(rs.getString("nome"));
                 //pess.setSenha("senha");
                 pess.setDatanasc(rs.getString("datanasc"));
               lista.add(pess);
             }
             return lista;
      }catch (Exception e){
          
      }
        return null;
    }

    @Override
    public boolean VerificarEmail(String email) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs=null;
        if (email == null){
            throw new Exception("O valor não pode ser nulo.");
        }
        try {
             con = Conexao.abrirConexao();
             System.out.println("Conexão realizada com sucesso");
             String sql = "SELECT * FROM quemsabe "+
                     "WHERE email = ?";
             ps = con.prepareStatement(sql);
             ps.setString(1, email);
             rs = ps.executeQuery();
             if (rs.next()){
                 
                 return true;
             }
       return false;
        }
       catch (Exception e) {
           //System.err.println("Erro na conexão");
            System.err.println("Erro:"+e.getMessage());
            throw new Exception("Erro ao inserir pessoa :"+ e.getMessage());
        }finally {
             Conexao.fecharConexao(con, ps, rs);
         
        }
    }

    @Override
    public Pessoa Validar(String email, String senha) throws Exception {
        if (email == null || senha == null){
            throw new Exception ("Erro : os valores "+
                    "não podem ser nulos");
        }
        PreparedStatement ps = null;
        ResultSet rs=null;
        try {
             con = Conexao.abrirConexao();
             System.out.println("Conexão realizada com sucesso");
             String sql = "SELECT * FROM quemsabe "+
                     "WHERE email = ? and senha = ?";
             ps = con.prepareStatement(sql);
             ps.setString(1, email);
             ps.setString(2, senha);
             rs = ps.executeQuery();
             if (rs.next()){
                 Pessoa pess = new Pessoa();
                 pess.setId(rs.getInt("id"));
                 pess.setEmail(rs.getString("email"));
                 pess.setNome(rs.getString("nome"));
                 pess.setSenha("senha");
                 pess.setDatanasc(rs.getString("datanasc"));
                 return pess;
             }
             return null;
        }
       catch (Exception e) {
           //System.err.println("Erro na conexão");
            System.err.println("Erro:"+e.getMessage());
            throw new Exception("Erro ao inserir pessoa :"+ e.getMessage());
        }finally {
             Conexao.fecharConexao(con, ps, rs);
    }
}

    @Override
    public Pessoa Buscar(int id) throws Exception {
        if (id < 0){
            throw new Exception ("Erro : id invalido ");
        }
        PreparedStatement ps = null;
        ResultSet rs=null;
        try {
             con = Conexao.abrirConexao();
             System.out.println("Conexão realizada com sucesso");
             String sql = "SELECT * FROM quemsabe "+
                     "WHERE email = ? and senha = ?";
             ps = con.prepareStatement(sql);
             ps.setInt(1, id);
             rs = ps.executeQuery();
             if (rs.next()){
                 Pessoa pess = new Pessoa();
                 pess.setId(rs.getInt("id"));
                 pess.setEmail(rs.getString("email"));
                 pess.setNome(rs.getString("nome"));
                 pess.setDatanasc(rs.getString("datanasc"));
                 return pess;
             }
             return null;
        }
       catch (Exception e) {
           //System.err.println("Erro na conexão");
            System.err.println("Erro:"+e.getMessage());
            throw new Exception("Erro ao inserir pessoa :"+ e.getMessage());
        }finally {
             Conexao.fecharConexao(con, ps, rs);
    }
    }

}

    
    

