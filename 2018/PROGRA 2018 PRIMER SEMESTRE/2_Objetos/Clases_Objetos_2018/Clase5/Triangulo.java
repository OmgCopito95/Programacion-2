/**
 *
 * @author vsanz
 */
public class Triangulo extends Figura{
   private double lado1;
   private double lado2;
   private double lado3;

   
  /* Añadido: tema constructores (1er constructor) */ 
  public Triangulo(double nuevoL1, double nuevoL2, double nuevoL3, String nuevoCR, String nuevoCL, Punto unPunto){
      super(nuevoCR,nuevoCL,unPunto);
      lado1 = nuevoL1;
      lado2 = nuevoL2;
      lado3 = nuevoL3;
    
  } 
  
    /* Añadido: tema constructores (2do constructor) */ 
  public Triangulo(double nuevoL1, double nuevoL2, double nuevoL3){
      this(nuevoL1,nuevoL2,nuevoL3,"blanco","negro",new Punto());
      
  } 
  
    /* Añadido: tema constructores (3er constructor) */ 
   public Triangulo(){

   } 
   
   
  public double getLado1(){
       return lado1;       
  }
  public void setLado1(double nuevoLado)
  {
       lado1=nuevoLado;
  }
  public double getLado2(){
       return lado2;       
  }
  public void setLado2(double nuevoLado)
  {
       lado2=nuevoLado;
  }
  public double getLado3(){
       return lado3;       
  }
  public void setLado3(double nuevoLado)
  {
       lado3=nuevoLado;
  }
  
 
  public double calcularArea(){
     double s = (lado1+lado2+lado3)/2;
     return Math.sqrt(s*(s-lado1)*(s-lado2)*(s-lado3));
  }
  
  public double calcularPerimetro(){
     return (lado1 + lado2 + lado3);
  }
  
  public void dibujar(){
     System.out.println("Triangulo: " );
     super.dibujar();
     System.out.println("Lado1: " + lado1 );
     System.out.println("Lado2: " + lado2 );
     System.out.println("Lado3: " + lado3 );
  }
  

}
