/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package persistencia;
import java.util.List;
import model.Pessoa;
/**
 *
 * @author aluno
 */
public interface PessoaDAO {
    public void Inserir(Pessoa pes) throws Exception;
    public void Remover(int id) throws Exception;
    public  void Atualizar(Pessoa pes) throws Exception;
    public  List<Pessoa>Buscar(Pessoa pes) throws Exception;
    public  List<Pessoa>Listar(Pessoa pes) throws Exception;
    
}
