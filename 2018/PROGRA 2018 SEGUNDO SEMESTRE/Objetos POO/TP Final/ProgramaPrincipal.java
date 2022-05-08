import java.util.Random;

/*Programa Principal del TP-Final*/
public class ProgramaPrincipal{

	public void main(String [] args){
		Random rnd = new Random();
		
		Farmacia farmacia = new Farmacia(1000); // a lo sumo se manejan mil medicamentos
		
		/*Carga de medicamentos random*/
		for(int i=0; i<rnd.nextInt(5)+5; i++){
			Medicamento m;
			
			int codigo = i;
			String nombre = "Medicamento"+codigo;
			String presentación = "Presentacion" + rnd.nextInt(10);
			String marca =  "Marca" + rnd.nextInt(5);
			double precio = (rnd.nextDouble()*1000)+20;
			
			int tipo = rnd.nextInt(1);
			if(tipo == 0){ //es un medicamento de venta libre
				int cantU = rnd.nextInt(100);
				m = new DeVentaLibre(codigo, nombre, presentación, marca, precio, cantU);
			}
			else{//es recetado
				m = new Recetado(codigo, nombre, presentación, marca, precio);
				
				/*Agrego las recetas*/
				for(int j=0; j<rnd.nextInt(5)+1; j++){
					int dniCliente = rnd.nextInt(46000000)+10000000;
					String obraSocial = (rnd.nextInt(1) % 2 == 0)?"IOMA":"PAMI";
					int descuento = rnd.nextInt(40)+10;
					Receta r = new Receta(dniCliente, obraSocial, descuento);	
/*1*/				m.agregarReceta(r); //agrega la receta al medicamento
				}
			}
/*2*/		farmacia.agregarMedicamento(m); //agrega el medicamento a la farmacia
		}
		
/*3*/	/*Llamado a imprimirFacturación(....) */
	} 
	
/*4*/public static void imprimirFacturación(/*...*/){
	
		/* No olvidarse de imprimir para cada medicamento:
				Su información completa
				El monto de ventas de ese medicamento en particular
		*/
		
		/* No olvidarse de imprimir el monto total de ventas de la farmacia */
	}		
}