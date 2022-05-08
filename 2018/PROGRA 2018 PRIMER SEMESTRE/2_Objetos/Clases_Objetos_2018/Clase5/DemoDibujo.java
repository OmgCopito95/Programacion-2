/**
 *
 * @author vsanz
 */
public class DemoDibujo {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        /*Crea el dibujo especificado */
        Triangulo techo= new Triangulo( 71, 71, 71, "rojo","negro", new Punto(56,100));
        Cuadrado pared= new Cuadrado( 71, "amarillo", "negro",new Punto(56,156) ); 
        Cuadrado puerta = new Cuadrado( 26, "marron", "negro",new Punto(56,177) ); 
        Circulo sol = new Circulo( 32, "naranja", "negro", new Punto(149,82));
        Dibujo dibu = new Dibujo("La casa soleada", "Gregorio", 4);
        dibu.añadirFigura(techo);
        dibu.añadirFigura(pared);
        dibu.añadirFigura(puerta);
        dibu.añadirFigura(sol);
        //dibu.añadirFigura(sol); //Si se descomenta falla; se intenta añadir una figura mas al arreglo cuando no hay lugar
        dibu.mostrar();
        System.out.println("Area techo: " + techo.calcularArea() + "  Perimetro techo: " + techo.calcularPerimetro());
        System.out.println("Area pared: " + pared.calcularArea() + "  Perimetro pared: " + pared.calcularPerimetro());
        System.out.println("Area puerta: " + puerta.calcularArea() + "  Perimetro puerta: " + puerta.calcularPerimetro());
        System.out.println("Area sol: " + sol.calcularArea() + "  Perimetro sol: " + sol.calcularPerimetro());
 
    }
    
}
