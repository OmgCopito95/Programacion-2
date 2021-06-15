import java.util.Random;

public class Generador{

	private int nro_actual_volumen;
	
	//Crea un generador de nro de volumen
	public Generador(){
		Random rnd = new Random();
		nro_actual_volumen= rnd.nextInt(50);
	}

	//Retorna el nro de volumen a registrar
	public int getNroVolumen(){
		nro_actual_volumen++;
		return nro_actual_volumen;
	} 
}