/**
 *
 * @author vsanz
 */
public class Dibujo {
    
    private String titulo;
    private String autor;
    private Figura[] figuras;
    private int cantFiguras;
    private int maxFiguras;
    
        /*Crea un dibujo vacio que contendra un maximo “max” de figuras, del autor “aut” y titulo “tit” */
    public Dibujo(String tit, String aut,int max){
        titulo=tit;
        autor=aut;
        maxFiguras=max;
        cantFiguras=0;
        figuras=new Figura[max];
    }
    
    /*Añade una nueva figura al dibujo, el usuario debe controlar que no este lleno */
    public void añadirFigura(Figura f){
        figuras[cantFiguras]=f;
        cantFiguras++;
    }
    
    /* Retorna true si el dibujo tiene el máximo de figuras admitidas, false en caso contrario */                     
    public boolean estaLleno(){
        return (cantFiguras==maxFiguras);
    }
    
    /* Muestra el dibujo en pantalla */
    public void mostrar(){
        int i;
        System.out.println("Titulo: " + titulo + " Autor: " + autor);
        for (i=0;i<cantFiguras;i++){
            figuras[i].dibujar();
        }
    }
    
    public String getTitulo(){
        return titulo;
    }
    public void setTitulo(String nuevoTitulo){
        titulo= nuevoTitulo;
    }  
    public String getAutor(){
        return autor;
    }
    public void setAutor(String nuevoAutor){
        autor= nuevoAutor;
    } 
}
