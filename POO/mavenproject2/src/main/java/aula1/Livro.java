package aula1;

public class Livro {
        String titulo;
        int ano;
        double preco;
        String area;
    public Livro (String titulo, int ano, double preco, String area){
        this.titulo = titulo;
        this.ano = ano;
        this.preco = preco;
        this.area = area;
    }
    public String getTitulo() {
        return titulo;
    }
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
    public int getAno() {
        return ano;
    }
    public void setAno(int ano) {
        this.ano = ano;
    }
    public double getPreco() {
        return preco;
    }
    public void setPreco(double preco) {
        this.preco = preco;
    }
    public String getArea() {
        return area;
    }
    public void setArea(String area) {
        this.area = area;
    }
}
