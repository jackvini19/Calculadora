/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utilitarios;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
/**
 *
 * @author aluno
 */
public class Criptografia {
    
    /**
     *
     * @param senha
     * @return
     */
    public String Criptografar(char[] senha) throws NoSuchAlgorithmException, UnsupportedEncodingException{
        
    String res = Arrays.toString(senha);
        System.out.println("senha:" + res);
        MessageDigest a = MessageDigest.getInstance("SHA-256");
        
        String salt = "210485102044561564h056b1gfjn013bfebgdxgbgn01278nhvgf";
        a.update(salt.getBytes());
        byte b[] = a.digest(res.getBytes("UTF-8"));
        //System.out.println("nova senha: "+ Arrays.toString(b));
        StringBuilder builder = new StringBuilder();
        for (byte c : b){
            builder.append(String.format("%02X", 0xFF & c));
        }
        String novaSenha = builder.toString();
        System.out.println("nova senha : " + novaSenha);
        return novaSenha;
       
    }
}
