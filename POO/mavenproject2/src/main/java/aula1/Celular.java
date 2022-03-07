package aula1;

public class Celular {
    String marca;
    String modelo;
    double preco;
    int ano;
    public Celular (String marca, String modelo, double preco, int ano){
        this.marca = marca;
        this.modelo = modelo;
        this.preco = preco;
        this.ano = ano;
    }
    public String getMarca() {
        return marca;
    }
    public void setMarca(String marca) {
        this.marca = marca;
    }
    public String getModelo() {
        return modelo;
    }
    public void setModelo(String modelo) {
        this.modelo = modelo;
    }
    public double getPreco() {
        return preco;
    }
    public void setPreco(double preco) {
        this.preco = preco;
    }
    public int getAno() {
        return ano;
    }
    public void setAno(int ano) {
        this.ano = ano;
    }
}