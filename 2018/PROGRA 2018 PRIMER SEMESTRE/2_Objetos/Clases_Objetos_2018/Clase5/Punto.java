/**
 *
 * @author vsanz
 */
public class Punto {
    private int x, y;
    
    public Punto (int valorX, int valorY){
        x=valorX;
        y=valorY;
    }
    
    public Punto (){
        x=0;
        y=0;
    }
    public int getX(){
        return x;
    }
    
    public int getY(){
        return y;
    }
  
    public void cambiarPosicion( int valorX, int valorY ){
        x=valorX;
        y=valorY;
    }
    
    public void trasladar(int dx, int dy){
        x=x+dx;
        y=y+dy;
    }
    
    @Override
    public String toString(){
        return ("Punto ("+x+","+y+")");
    }
    
}
