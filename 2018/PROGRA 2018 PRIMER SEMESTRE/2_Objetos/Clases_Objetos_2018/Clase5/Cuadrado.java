/**
 *
 * @author vsanz
 */
public class Cuadrado extends Figura{
    
    private double lado;
    
    public Cuadrado(double nuevoLado, String nuevoCR, String nuevoCL, Punto unPunto){
        super(nuevoCR, nuevoCL, unPunto);  // primera linea 
        this.setLado(nuevoLado);
    } 
    
    public double getLado(){
        return lado;       
    }
  
    public void setLado(double nuevoLado){
        lado=nuevoLado;
    }
    
    public void dibujar(){
        System.out.println("Cuadrado: " );
        super.dibujar();
        System.out.println("Lado: " + lado );
    }
  
    @Override
    public double calcularArea(){
       return (lado* lado);
    }
    
    @Override
    public double calcularPerimetro(){
       return (lado*4);
    }
}
