/**
 *
 * @author vsanz
 */
public class DemoFiguras {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Circulo circ =new Circulo(5, "amarillo", "negro", new Punto (100,100));
        System.out.println(circ.getRadio());   
        circ.dibujar();
        Figura fig= circ; 
        //System.out.println(fig.getRadio()); 
        fig.dibujar(); 
        System.out.println("Color linea: " + fig.getColorLinea()); 

    }
    
    
    
}
