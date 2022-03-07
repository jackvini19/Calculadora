package aula1;
import secundario.NewClass2;

public class Principal{
    public static void main(String[] args) {
        /*System.out.println(soma (1,2));
        System.out.println(soma(1.2,3));
        System.out.println(soma(1,2.3));*/
        
        NewClass x = new NewClass();
        NewClass2 y = new NewClass2();
        
    }
    
    public static int soma(int a, int b){
        return(a+b);
    }
    
    public static double soma(int a, int b, int c){
        return(a+b+c);
    }
    
    public static double soma(double a, int b){
        return(a+b);
    }
    
    public static double soma(int a, double b){
        return(a+b);
    }
    
    public static double soma(double a, double b){
        return(a+b);
    }
}
