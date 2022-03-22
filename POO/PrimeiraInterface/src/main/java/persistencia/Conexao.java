/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package persistencia;

import static java.lang.Class.forName;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

/**
 *
 * @author aluno
 */
public class Conexao {
    public static Connection abrirConexao()throws Exception{
           try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            String servidor= "localhost";
            String database = "naosei";
            String porta = "3307";
            
            String bd_url ="jdbc:mysql://"+servidor+
                    ":"+porta+"/"+database+
                    "?useTimezone=true&serverTimezone=UTC";
            String usuario ="root";
            String senha = "mysql";
            return DriverManager.getConnection(bd_url, usuario,senha);
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }
    public static void fechar(Connection con, Statement stmt, ResulSet rs)
            throws Exception{
        try {
             if (rs !=null){rs.close();}
             if (rs !=null){stmt.close();}
             if (rs !=null){con.close();}
        } catch (Exception e) {
    throw new Exception(e.getMessage());
        }    
    }
    public static void fecharConexao(Connection con, Statement stmt, ResulSet rs)
            throws Exception{
        fechar(con,stmt,rs);
    }
     public static void fecharConexao(Connection con, Statement stmt)
            throws Exception{
         fechar(con,stmt,null);
    }
      public static void fecharConexao(Connection con)
            throws Exception{
         fechar(con,null,null);
}
}